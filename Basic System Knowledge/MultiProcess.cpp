#include <iostream>
#include <vector>
#include <chrono>
#include <sys/mman.h>
#include <sys/wait.h>
#include <unistd.h>
#include <cstring>
#include <immintrin.h> // AVX2 指令集头文件

// 单线程标量相加版本
void scalar_add(int* b, int* d, int* a, size_t size) {
    for (size_t i = 0; i < size; ++i) {
        a[i] = b[i] + d[i];
    }
}

// AVX2 向量化相加函数
void avx2_add(int* b, int* d, int* a, size_t start, size_t end) {
    size_t i = start;
    
    // 使用 AVX2 处理大部分数据
    for (; i + 7 < end; i += 8) {
        __m256i b_vec = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(&b[i]));
        __m256i d_vec = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(&d[i]));
        __m256i result = _mm256_add_epi32(b_vec, d_vec);
        _mm256_storeu_si256(reinterpret_cast<__m256i*>(&a[i]), result);
    }
    
    // 处理剩余的元素
    for (; i < end; ++i) {
        a[i] = b[i] + d[i];
    }
}

int main() {
    const size_t SIZE = 1000000000; // 1亿个元素
    const int NUM_PROCESSES = 8;   // 进程数量
    
    std::cout << "数组大小: " << SIZE << " 个元素" << std::endl;
    std::cout << "使用进程数: " << NUM_PROCESSES << std::endl;
    
    // 使用mmap分配共享内存
    size_t data_size = SIZE * sizeof(int);
    int* shared_b = (int*)mmap(NULL, data_size, PROT_READ | PROT_WRITE, 
                               MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    int* shared_d = (int*)mmap(NULL, data_size, PROT_READ | PROT_WRITE, 
                               MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    int* shared_a = (int*)mmap(NULL, data_size, PROT_READ | PROT_WRITE, 
                               MAP_SHARED | MAP_ANONYMOUS, -1, 0);
    
    // 初始化数据
    for (size_t i = 0; i < SIZE; ++i) {
        shared_b[i] = i % 100;
        shared_d[i] = (i + 1) % 100;
    }
    
    // 预热
    scalar_add(shared_b, shared_d, shared_a, SIZE);
    
    // 测试单线程标量版本
    auto start = std::chrono::high_resolution_clock::now();
    scalar_add(shared_b, shared_d, shared_a, SIZE);
    auto end = std::chrono::high_resolution_clock::now();
    auto scalar_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "单线程标量版本时间: " << scalar_time.count() << " 毫秒" << std::endl;
    
    // 测试多进程 + AVX2 版本
    start = std::chrono::high_resolution_clock::now();
    
    // 计算每个进程处理的数据块大小
    size_t chunk_size = SIZE / NUM_PROCESSES;
    // 确保块大小是8的倍数，以便AVX2正确处理
    chunk_size = (chunk_size + 7) / 8 * 8;
    
    // 创建子进程
    for (int i = 0; i < NUM_PROCESSES; ++i) {
        pid_t pid = fork();
        
        if (pid == 0) { // 子进程
            size_t start_idx = i * chunk_size;
            size_t end_idx = (i == NUM_PROCESSES - 1) ? SIZE : (i + 1) * chunk_size;
            
            // 使用 AVX2 向量化执行计算
            avx2_add(shared_b, shared_d, shared_a, start_idx, end_idx);
            
            exit(0); // 子进程退出
        } else if (pid < 0) {
            std::cerr << "创建进程失败" << std::endl;
            return 1;
        }
    }
    
    // 等待所有子进程完成
    for (int i = 0; i < NUM_PROCESSES; ++i) {
        wait(NULL);
    }
    
    end = std::chrono::high_resolution_clock::now();
    auto multiprocess_avx2_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "多进程+AVX2版本时间: " << multiprocess_avx2_time.count() << " 毫秒" << std::endl;
    
    // 计算加速比
    double speedup = static_cast<double>(scalar_time.count()) / multiprocess_avx2_time.count();
    std::cout << "多进程+AVX2加速比: " << speedup << "x" << std::endl;
    
    // 验证结果
    bool correct = true;
    int* test_result = new int[SIZE];
    scalar_add(shared_b, shared_d, test_result, SIZE);
    
    for (size_t i = 0; i < SIZE; i += SIZE / 1000) { // 只检查部分样本
        if (test_result[i] != shared_a[i]) {
            std::cout << "错误: 结果不正确 at index " << i << std::endl;
            correct = false;
            break;
        }
    }
    
    if (correct) {
        std::cout << "结果验证: 正确" << std::endl;
    }
    
    delete[] test_result;
    
    // 释放共享内存
    munmap(shared_b, data_size);
    munmap(shared_d, data_size);
    munmap(shared_a, data_size);
    
    return 0;
}