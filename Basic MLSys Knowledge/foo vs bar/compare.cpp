#include <cstdint>
#include <iostream>
#include <thread>
#include <chrono>

// 假设缓存行大小为64字节
constexpr size_t CACHE_LINE_SIZE = 64;

struct data {
  alignas(CACHE_LINE_SIZE) int a = 0;  // 对齐到缓存行
  char padding[CACHE_LINE_SIZE - sizeof(int)]; // 填充剩余空间
  alignas(CACHE_LINE_SIZE) int b = 0;  // 对齐到下一个缓存行
};

void add_a(data &global_data) {
  for (int i = 0; i < 500000000; ++i) {
    global_data.a++;
  }
}

void add_b(data &global_data) {
  for (int i = 0; i < 500000000; ++i) {
    global_data.b++;
  }
}

void foo() {
  data data_x;
  std::thread t1([&data_x]() { add_a(data_x); });
  std::thread t2([&data_x]() { add_b(data_x); });

  t1.join();
  t2.join();
  uint64_t sum = data_x.a + data_x.b;
  std::cout << "Sum foo : " << sum << std::endl;
}

void bar() {
  data data_y;
  add_a(data_y);
  add_b(data_y);

  uint64_t sum = data_y.a + data_y.b;
  std::cout << "Sum bar : " << sum << std::endl;
}

int main() {
    // 测试foo的执行时间
    auto start_foo = std::chrono::high_resolution_clock::now();
    foo();
    auto end_foo = std::chrono::high_resolution_clock::now();
    auto duration0 = std::chrono::duration_cast<std::chrono::milliseconds>(end_foo - start_foo);
    std::cout << "foo执行时间: " << duration0.count() << "ms" << std::endl;

    // 测试bar的执行时间
    auto start_bar = std::chrono::high_resolution_clock::now();
    bar();
    auto end_bar = std::chrono::high_resolution_clock::now();
    auto duration1 = std::chrono::duration_cast<std::chrono::milliseconds>(end_bar - start_bar);
    std::cout << "bar执行时间: " << duration1.count() << "ms" << std::endl;


    return 0;
}