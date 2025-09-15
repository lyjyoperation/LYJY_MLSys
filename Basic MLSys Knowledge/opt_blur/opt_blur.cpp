#include <algorithm>
#include <immintrin.h>
#include <xmmintrin.h> 
#include <stdbool.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <vector>
#define X 10240
#define Y 10240
#define IterNum 10000000
#define BLUR_SIZE 4
#define Two_BLUR_SIZE_PLUS_ONE (2*BLUR_SIZE+1)
int image[X * Y];
int image_blur_origin[X * Y];
int image_blur_SIMD[X * Y];

//原测试函数
void blur_y(int const image[X * Y], int image_blur[X * Y]) {
  for (int j = 0; j < Y; j++) {
    for (int i = 0; i < X; i++) {
      int sum = 0;
      for (int t = -BLUR_SIZE; t <= BLUR_SIZE; t++) {
        if (i + t >= 0 && i + t < X) {
          sum += image[(i + t) * Y + j];
        }
      }
      image_blur[i * Y + j] = sum / Two_BLUR_SIZE_PLUS_ONE;
    }
  }
}

//SIMD向量化+循环分块优化+手写多线程（列循环并行化）+prefetch+滑动窗口
void blur_y_simd(int const image[X * Y], int image_blur[X * Y]) {
  const __m256 scale_vec = _mm256_set1_ps(1.0f/Two_BLUR_SIZE_PLUS_ONE);

  //获得可用的CPU核心数
  unsigned int num_threads = std::thread::hardware_concurrency();
  if (num_threads == 0) num_threads = 4; // 默认使用4个线程

  int total_blocks = Y/8;
  //因为这个例子是10240/8,所以一共1280个块
  //下面是每个线程需要处理的块
  int block_per_thread = total_blocks / num_threads;
  //下面是平分不完的blocks
  int remainer_blocks = total_blocks % num_threads;

  //创建线程向量
  std::vector<std::thread> threads;

  //启动线程
  int start_block = 0;
  //p为当前线程的索引
  for(unsigned int p =0;p<num_threads;p++){
    //计算当前thread需要处理的列块范围
    int end_block = start_block + block_per_thread;
    //分配余数
    /*比如：1280/6余2,将余出来的两个block分配给前两个线程 */
    if(p < remainer_blocks) end_block ++;
    //确保不越界
    end_block = std::min(end_block,total_blocks);

    // 复制起止值，避免 lambda 捕获问题
    int thread_start = start_block;
    int thread_end = end_block;

    //启动线程处理指定的列块范围
      threads.emplace_back([thread_start, thread_end, &image, &image_blur,scale_vec]() {
            for(int block = thread_start;block<thread_end;block++){
                //实际索引
                int j = block*8;
                
                // --- 初始化 i = 0 的滑动窗口 sum ---
                __m256i acc = _mm256_setzero_si256();
                for (int t = -BLUR_SIZE; t <= BLUR_SIZE; ++t) {
                    int idx = 0 + t;
                    if (idx >= 0 && idx < X) {
                        // 经验性 prefetch（预取未来几个元素）
                        int pf_idx = idx + 4;
                        if (pf_idx < X) {
                            _mm_prefetch((const char*)&image[pf_idx * Y + j], _MM_HINT_T0);
                        }
                        __m256i data = _mm256_loadu_si256((__m256i const*)&image[idx * Y + j]);
                        acc = _mm256_add_epi32(acc, data);
                    }
                }

                // 存储 i=0 的结果
                {
                    __m256 acc_f = _mm256_cvtepi32_ps(acc);
                    acc_f = _mm256_mul_ps(acc_f, scale_vec);
                    __m256i res = _mm256_cvttps_epi32(acc_f);
                    _mm256_storeu_si256((__m256i*)&image_blur[0 * Y + j], res);
                }
                
                // --- 对 i = 1 .. X-1 使用滑动窗口更新： acc = acc - remove + add ---
                for (int i = 1; i < X; ++i) {
                    int remove_idx = i - BLUR_SIZE - 1; // 要移除的旧元素索引
                    int add_idx = i + BLUR_SIZE;        // 要加入的新元素索引

                    __m256i sub = _mm256_setzero_si256();
                    __m256i add = _mm256_setzero_si256();

                    if (remove_idx >= 0) {
                        sub = _mm256_loadu_si256((__m256i const*)&image[remove_idx * Y + j]);
                    }
                    if (add_idx < X) {
                        // 预取将来可能用到的元素（经验值 +4）
                        int pf_idx = add_idx + 4;
                        if (pf_idx < X) {
                            _mm_prefetch((const char*)&image[pf_idx * Y + j], _MM_HINT_T0);
                        }
                        add = _mm256_loadu_si256((__m256i const*)&image[add_idx * Y + j]);
                    }

                    // acc = acc - sub + add
                    acc = _mm256_add_epi32(_mm256_sub_epi32(acc, sub), add);

                    // 转浮点乘 scale，并存回
                    __m256 acc_f = _mm256_cvtepi32_ps(acc);
                    acc_f = _mm256_mul_ps(acc_f, scale_vec);
                    __m256i res = _mm256_cvttps_epi32(acc_f);
                    _mm256_storeu_si256((__m256i*)&image_blur[i * Y + j], res);
                }


            }
      });
      //这一行的作用是更新下一行的起始位置 
      start_block = end_block;
    }

    //等待所有线程完成
     for (auto& thread : threads) {
        thread.join();
    }

}



// 初始化图像数据
void init_image() {
    for (int i = 0; i < X * Y; i++) {
        image[i] = rand() % 256;
    }
}

// 性能测试函数
void benchmark() {
    init_image();
    
    auto start = std::chrono::high_resolution_clock::now();
    blur_y(image, image_blur_origin);
    auto end = std::chrono::high_resolution_clock::now();
    auto duration0 = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "Original: " << duration0.count() << "ms" << std::endl;
    
    start = std::chrono::high_resolution_clock::now();
    blur_y_simd(image, image_blur_SIMD);
    end = std::chrono::high_resolution_clock::now();
    auto duration_simd = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    std::cout << "SIMD: " << duration_simd.count() << "ms" << std::endl;
    
    std::cout <<"Original/SIMD加速比:"<< duration0.count()/duration_simd.count()<<std::endl;
}

int main() {
    benchmark();
    return 0;
}