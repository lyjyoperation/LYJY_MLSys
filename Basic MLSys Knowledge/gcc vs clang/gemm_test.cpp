#include <iostream>
#include <chrono>
#include <random>
#include <cassert>

// 基本矩阵乘法实现
void gemm_basic(float* A, float* B, float* C, int M, int N, int K) {
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

// 初始化矩阵
void init_matrix(float* matrix, int rows, int cols) {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<float> dis(0.0f, 1.0f);
    
    for (int i = 0; i < rows * cols; i++) {
        matrix[i] = dis(gen);
    }
}

// 验证矩阵乘法结果
bool verify_result(float* A, float* B, float* C, int M, int N, int K) {
    // 只验证几个随机位置以减少计算量
    const int num_checks = 5;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<int> row_dis(0, M-1);
    std::uniform_int_distribution<int> col_dis(0, N-1);
    
    for (int i = 0; i < num_checks; i++) {
        int row = row_dis(gen);
        int col = col_dis(gen);
        
        float expected = 0.0f;
        for (int k = 0; k < K; k++) {
            expected += A[row * K + k] * B[k * N + col];
        }
        
        if (std::abs(C[row * N + col] - expected) > 1e-4) {
            std::cout << "Mismatch at (" << row << ", " << col << "): " 
                      << C[row * N + col] << " vs " << expected << std::endl;
            return false;
        }
    }
    return true;
}

int main() {
    // 设置矩阵维度
    const int M = 256;
    const int N = 256;
    const int K = 256;
    
    // 分配内存
    float* A = new float[M * K];
    float* B = new float[K * N];
    float* C = new float[M * N];
    
    // 初始化矩阵
    init_matrix(A, M, K);
    init_matrix(B, K, N);
    
    // 执行矩阵乘法并计时
    auto start = std::chrono::high_resolution_clock::now();
    gemm_basic(A, B, C, M, N, K);
    auto end = std::chrono::high_resolution_clock::now();
    
    // 计算执行时间
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "Matrix multiplication took " << duration.count() << " ms" << std::endl;
    
    // 验证结果
    if (verify_result(A, B, C, M, N, K)) {
        std::cout << "Result verification passed!" << std::endl;
    } else {
        std::cout << "Result verification failed!" << std::endl;
    }
    
    // 释放内存
    delete[] A;
    delete[] B;
    delete[] C;
    
    return 0;
}