#include <iostream>
#include <vector>
#include <chrono>
#include <thread>
#include <immintrin.h> // AVX2 指令集头文件

// 单线程标量相加版本
void scalar_add(const std::vector<int>& b, const std::vector<int>& d, std::vector<int>& a) {
    for (size_t i = 0; i < b.size(); ++i) {
        a[i] = b[i] + d[i];
    }
}

// 多线程 AVX2 向量化相加版本
void multithread_avx2_add(const std::vector<int>& b, const std::vector<int>& d, std::vector<int>& a, int num_threads) {
    size_t total_size = b.size();
    size_t chunk_size = total_size / num_threads;
    
    // 确保 chunk_size 是 8 的倍数，以便 AVX2 正确处理
    chunk_size = (chunk_size + 7) / 8 * 8;
    
    std::vector<std::thread> threads;
    
    for (int i = 0; i < num_threads; ++i) {
        size_t start = i * chunk_size;
        size_t end = std::min((i + 1) * chunk_size, total_size);
        
        if (start >= total_size) break;
        
        threads.emplace_back([&, start, end]() {
            for (size_t j = start; j + 7 < end; j += 8) {
                __m256i b_vec = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(&b[j]));
                __m256i d_vec = _mm256_loadu_si256(reinterpret_cast<const __m256i*>(&d[j]));
                __m256i result = _mm256_add_epi32(b_vec, d_vec);
                _mm256_storeu_si256(reinterpret_cast<__m256i*>(&a[j]), result);
            }
            
            // 处理剩余元素
            for (size_t j = (end / 8) * 8; j < end; ++j) {
                a[j] = b[j] + d[j];
            }
        });
    }
    
    for (auto& thread : threads) {
        thread.join();
    }
}

int main() {
    // 设置较大的数组大小以便更好地测量性能
    const size_t SIZE = 1000000000; 
    const int NUM_THREADS = std::thread::hardware_concurrency();
    
    std::cout << "数组大小: " << SIZE << " 个元素" << std::endl;
    std::cout << "可用线程数: " << NUM_THREADS << std::endl;
    
    // 初始化数据
    std::vector<int> b(SIZE);
    std::vector<int> d(SIZE);
    std::vector<int> a1(SIZE); // 用于标量版本
    std::vector<int> a3(SIZE); // 用于多线程 AVX2 版本
    
    for (size_t i = 0; i < SIZE; ++i) {
        b[i] = i % 100;
        d[i] = (i + 1) % 100;
    }
    
    // 测试单线程标量版本
    auto start = std::chrono::high_resolution_clock::now();
    scalar_add(b, d, a1);
    auto end = std::chrono::high_resolution_clock::now();
    auto scalar_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "单线程标量版本时间: " << scalar_time.count() << " 毫秒" << std::endl;
    
    // 测试多线程 AVX2 版本
    start = std::chrono::high_resolution_clock::now();
    multithread_avx2_add(b, d, a3, NUM_THREADS);
    end = std::chrono::high_resolution_clock::now();
    auto multithread_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "多线程 AVX2 版本时间: " << multithread_time.count() << " 毫秒" << std::endl;
    
    // 计算加速比（标量时间 / 多线程时间）
    double speedup = static_cast<double>(scalar_time.count()) / multithread_time.count();
    std::cout << "多线程加速比: " << speedup << "x" << std::endl;
    
    // 验证结果是否正确
    bool correct = true;
    for (size_t i = 0; i < SIZE; ++i) {
        if (a1[i] != a3[i]) {
            std::cout << "错误: 多线程 AVX2 版本结果不正确!" << std::endl;
            correct = false;
            break;
        }
    }
    
    if (correct) {
        std::cout << "结果验证: 正确" << std::endl;
    }
    
    return 0;
}