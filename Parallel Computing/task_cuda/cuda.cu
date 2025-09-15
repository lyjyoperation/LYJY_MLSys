#include <cmath>
#include <cuda.h>
#include <cuda_runtime.h>
#include <torch/extension.h>
#include <iostream>

__global__ void kernel(const float *__restrict__ A_ptr,
                       const float *__restrict__ B_ptr,
                       float *__restrict__ result_ptr,
                       const int num_elements) {
  // TODO: Implement the Kernel Logic
  // Sum up all the elements in the input tensor
  int index = blockIdx.x *blockDim.x+threadIdx.x;
  int stride = blockDim.x *gridDim.x;
  for(int i = index;i<num_elements;i += stride)  result_ptr[i] = A_ptr[i] + B_ptr[i];
}

static void launch_kernel(const void *A_ptr, const void *B_ptr, void *output_ptr,
                          const int num_elements) {
  // TODO: Implement the LaunchKernel Logic
  int blockSize = 32;
  int numBlocks = (num_elements + blockSize - 1)/blockSize;
  kernel<<<numBlocks,blockSize>>>((const float*)A_ptr,(const float*)B_ptr, (float*)output_ptr, num_elements);
  std::cout << "\n\nWarning: Need to implement the this!!\n\n" << std::endl;
  cudaDeviceSynchronize();
}

//CUDA包装函数（暴露给py的）
torch::Tensor test_kernel(const torch::Tensor &A, const torch::Tensor &B) {
  torch::Tensor result_tensor = torch::empty_like(A);
  const int element_count = A.numel();

  launch_kernel(A.data_ptr<float>(), B.data_ptr<float>(), result_tensor.data_ptr<float>(),
                element_count);

  return result_tensor;
}

//此模块是pybind宏，将C++函数暴露给py环境使用
//CUDA_Test这个名字到时候被python import
//定义了py中名为"test_kernel"的函数，第三个参数是文档字符串
PYBIND11_MODULE(CUDA_Test, m) {
  m.def("test_kernel", &test_kernel, "Test kernel");
}