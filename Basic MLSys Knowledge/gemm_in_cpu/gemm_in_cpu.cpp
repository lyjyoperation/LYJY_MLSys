#include <iostream>
#include <chrono>
#include <random>
#include <cstring>
#include <cmath>
#include <immintrin.h>  
#include <thread>       
#include <vector>
#include <algorithm> 

// 朴素矩阵乘法
void gemm_example(float* A, float* B, float* C, int M, int N, int K) {
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            float sum = 0.0f;
            for (int k = 0; k < K; k++) {
                sum += A[i * K + k] * B[k * N + j];
            }
            C[i * N + j] = sum;
        }
    }
}

void transpose_matrix(float* src, float* dst, int rows, int cols) {
    const int BLOCK_SIZE = 64; // 根据CPU缓存调整块大小
    for (int i = 0; i < rows; i += BLOCK_SIZE) {
        for (int j = 0; j < cols; j += BLOCK_SIZE) {
            // 处理块内的转置
            for (int block_i = i; block_i < i + BLOCK_SIZE && block_i < rows; ++block_i) {
                for (int block_j = j; block_j < j + BLOCK_SIZE && block_j < cols; ++block_j) {
                    dst[block_j * rows + block_i] = src[block_i * cols + block_j];
                }
            }
        }
    }
}

void gemm_thread_worker(float* A, float* B_transposed, float* C, 
                        int M, int N, int K, int start_row, int end_row) {
    for (int i = start_row; i < end_row; i++) {
        for (int j = 0; j < N; j++) {
            // 初始化累加器
            __m256 acc = _mm256_setzero_ps();
            
            // 每次处理8个元素
            int k = 0;
            for (; k <= K - 8; k += 8) {
                // 加载A的8个元素
                __m256 a_vec = _mm256_loadu_ps(&A[i * K + k]);
                
                // 加载B转置后的8个元素（对应原B矩阵的一列）
                __m256 b_vec = _mm256_loadu_ps(&B_transposed[j * K + k]);
                
                // 乘积累加
                acc = _mm256_fmadd_ps(a_vec, b_vec, acc);
            }
            
            //横向求和           
            __m128 low  = _mm256_castps256_ps128(acc);      
            __m128 high = _mm256_extractf128_ps(acc, 1);   
            __m128 sum128 = _mm_add_ps(low, high);         
            sum128 = _mm_hadd_ps(sum128, sum128);          
            sum128 = _mm_hadd_ps(sum128, sum128);          
            float sum = _mm_cvtss_f32(sum128); 
            
            // 处理剩余的元素（如果K不是8的倍数）
            for (; k < K; k++) {
                sum += A[i * K + k] * B_transposed[j * K + k];
            }
            
            // 存储结果
            C[i * N + j] = sum;
        }
    }
}

//SIMD并行化+多线程+横向求和+转置（利用行主序的内存连续性）
void gemm_optimized(float* A, float* B, float* C, int M, int N, int K) {

   // 转置矩阵B以提高缓存性能
    float* B_transposed = new float[K * N];
    transpose_matrix(B, B_transposed, K, N);

    // 获取系统支持的线程数
    unsigned int num_threads = std::thread::hardware_concurrency();
    if (num_threads == 0) num_threads = 4; // 默认使用4个线程 

    std::vector<std::thread> threads;
    //每个线程负责的行有哪些
    int rows_per_thread = M / num_threads;

     // 创建并启动线程
    for (unsigned int t = 0; t < num_threads; t++) {
        int start_row = t * rows_per_thread;
        int end_row = (t == num_threads - 1) ? M : (t + 1) * rows_per_thread;
        
        threads.emplace_back(gemm_thread_worker, 
                            A, B_transposed, C, 
                            M, N, K, 
                            start_row, end_row);
    }
    
    // 等待所有线程完成
    for (auto& thread : threads) {
        thread.join();
    }
    
    // 释放转置矩阵的内存
    delete[] B_transposed;


}

// 初始化矩阵
void initialize_matrix(float* matrix, int size) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, 1.0f);
    
    for (int i = 0; i < size; i++) {
        matrix[i] = dis(gen);
    }
}

// 验证两个矩阵是否相同（用于调试）
bool verify_matrices(float* C1, float* C2, int size, float tolerance = 1e-5f) {
    for (int i = 0; i < size; i++) {
        if (std::abs(C1[i] - C2[i]) > tolerance) {
            std::cout << "验证失败: C1[" << i << "] = " << C1[i] 
                      << ", C2[" << i << "] = " << C2[i] << std::endl;
            return false;
        }
    }
    return true;
}

int main() {
    // 设置矩阵尺寸
    const int M = 1024;
    const int N = 1024;
    const int K = 1024 ;
    
    // 分配内存
    float* A = new float[M * K];
    float* B = new float[K * N];
    float* C_naive = new float[M * N];
    float* C_optimized = new float[M * N];
    
    // 初始化矩阵
    initialize_matrix(A, M * K);
    initialize_matrix(B, K * N);
    
    // 测试朴素版本
    auto start = std::chrono::high_resolution_clock::now();
    gemm_example(A, B, C_naive, M, N, K);
    auto end = std::chrono::high_resolution_clock::now();
    auto naive_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    // 测试优化版本
    start = std::chrono::high_resolution_clock::now();
    gemm_optimized(A, B, C_optimized, M, N, K);
    end = std::chrono::high_resolution_clock::now();
    auto optimized_time = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    
    
    // 输出结果
    std::cout << "矩阵尺寸: " << M << " x " << N << " x " << K << std::endl;
    std::cout << "朴素版本时间: " << naive_time.count() << " ms" << std::endl;
    std::cout << "优化版本时间: " << optimized_time.count() << " ms" << std::endl;
    std::cout << "加速比: " << naive_time.count() / optimized_time.count() << std::endl;
    
    // 释放内存
    delete[] A;
    delete[] B;
    delete[] C_naive;
    delete[] C_optimized;
    
    return 0;
}