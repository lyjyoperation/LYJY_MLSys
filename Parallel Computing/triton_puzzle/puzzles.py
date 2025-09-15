import argparse
from typing import List
import os

import torch
import triton
import triton.language as tl

# Local imports
from display import print_end_line
from tensor_type import Float32, Int32
from test_puzzle import test


"""
# Triton Puzzles Lite

Programming for accelerators such as GPUs is critical for modern AI systems.
This often means programming directly in proprietary low-level languages such as CUDA. Triton is 
an alternative open-source language that allows you to code at a higher-level and compile to accelerators 
like GPU.

Coding for Triton is very similar to Numpy and PyTorch in both syntax and semantics. However, as a lower-level 
language there are a lot of details that you need to keep track of. In particular, one area that learners have 
trouble with is memory loading and storage which is critical for speed on low-level devices.

This set is puzzles is meant to teach you how to use Triton from first principles in an interactive fashion. 
You will start with trivial examples and build your way up to real algorithms like Flash Attention and 
Quantized neural networks. These puzzles **do not** need to run on GPU since they use a Triton interpreter.
"""


r"""
## Introduction

To begin with, we will only use `tl.load` and `tl.store` in order to build simple programs.
"""


"""
### Demo 1

Here's an example of load. It takes an `arange` over the memory. By default the indexing of
torch tensors with column, rows, depths or right-to-left. It also takes in a mask as the second
argument. Mask is critically important because all shapes in Triton need to be powers of two.

Expected Results:

[0 1 2 3 4 5 6 7]
[1. 1. 1. 1. 1. 0. 0. 0.]

Explanation:

tl.load(ptr, mask)
tl.load use mask: [0 1 2 3 4 5 6 7] < 5 = [1 1 1 1 1 0 0 0]
"""


@triton.jit
def demo1(x_ptr):
    range = tl.arange(0, 8)
    # print works in the interpreter
    print(range)
    x = tl.load(x_ptr + range, range < 5, 0)
    print(x)


def run_demo1():
    print("Demo1 Output: ")
    demo1[(1, 1, 1)](torch.ones(4, 3))
    print_end_line()
"""
#解析：demo1[(1, 1, 1)](torch.ones(4, 3))调用,创建一个4行3列的张量，
值全为1,[(1, 1, 1)] 表示启动1个执行块。
range = tl.arange(0, 8)：创建一个索引序列，值0到7
x_ptr + range这个是访问刚才那个向量的0到7的位置，range < 5掩码，决定哪个位置会被实际访问
前五个位置会实际加载位置（值为1），剩下三个位置返回后面跟着的默认值0,load是加载，从内存中加载数据
"""
"""
### Demo 2:

You can also use this trick to read in a 2d array.

Expected Results:

[[ 0  1  2  3]
[ 4  5  6  7]
[ 8  9 10 11]
[12 13 14 15]
[16 17 18 19]
[20 21 22 23]
[24 25 26 27]
[28 29 30 31]]
[[1. 1. 1. 0.]
[1. 1. 1. 0.]
[1. 1. 1. 0.]
[1. 1. 1. 0.]
[0. 0. 0. 0.]
[0. 0. 0. 0.]
[0. 0. 0. 0.]
[0. 0. 0. 0.]]

Explanation:

tl.load use mask: i < 4 and j < 3.
"""


@triton.jit
def demo2(x_ptr):
    i_range = tl.arange(0, 8)[:, None]  #[:, None] 中：表示选择所有行，None表示添加一个维度
    #所以上面的含义就是将一维数组转换为列向量
    """
    [[0],
    [1],
    [2],
    [3],
    [4],
    [5],
    [6],
    [7]]
    """
    j_range = tl.arange(0, 4)[None, :]
    #将一维数组转换为行向量
    """
    [[0, 1, 2, 3]]
    """
    range = i_range * 4 + j_range
    #广播机制：先将i_range和j_range扩展，然后再执行运算
    """
    i_range 从 (8, 1) 广播到 (8, 4):
    [[0, 0, 0, 0],
    [1, 1, 1, 1],
    [2, 2, 2, 2],
    [3, 3, 3, 3],
    [4, 4, 4, 4],
    [5, 5, 5, 5],
    [6, 6, 6, 6],
    [7, 7, 7, 7]]
    j_range 从 (1, 4) 广播到 (8, 4)：
    [[0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3],
    [0, 1, 2, 3]]
    执行运算：
    [[0*4+0, 0*4+1, 0*4+2, 0*4+3],
    [1*4+0, 1*4+1, 1*4+2, 1*4+3],
    [2*4+0, 2*4+1, 2*4+2, 2*4+3],
    [3*4+0, 3*4+1, 3*4+2, 3*4+3],
    [4*4+0, 4*4+1, 4*4+2, 4*4+3],
    [5*4+0, 5*4+1, 5*4+2, 5*4+3],
    [6*4+0, 6*4+1, 6*4+2, 6*4+3],
    [7*4+0, 7*4+1, 7*4+2, 7*4+3]]
    这种方法就是结合广播机制高效创建多维索引数组，避免了显示循环
    [[ 0,  1,  2,  3],
    [ 4,  5,  6,  7],
    [ 8,  9, 10, 11],
    [12, 13, 14, 15],
    [16, 17, 18, 19],
    [20, 21, 22, 23],
    [24, 25, 26, 27],
    [28, 29, 30, 31]]
    """
    print(range)
    """
    传进去只有16个元素，但是我们试图访问32个元素，由于掩码机制的存在，其他越界位置不会被实际访问
    ，这样就不会真实造成索引访问越界的问题，但是如果掩码没有掩盖到真实16个元素之外的位置，即真实
    访问到外面的位置就会真的造成访问越界的问题
    """
    x = tl.load(x_ptr + range, (i_range < 4) & (j_range < 3), 0)
    print(x)


def run_demo2():
    print("Demo2 Output: ")
    demo2[(1, 1, 1)](torch.ones(4, 4))
    print_end_line()


"""
### Demo 3

The `tl.store` function is quite similar. It allows you to write to a tensor.

Expected Results:

tensor([[10., 10., 10.],
    [10., 10.,  1.],
    [ 1.,  1.,  1.],
    [ 1.,  1.,  1.]])

Explanation:

tl.store(ptr, value, mask)
here range < 5 corresponds to the 2D-mask

[[1. 1. 1.]
[1. 1. 0.]
[0. 0. 0.]
[0. 0. 0.]]
"""


@triton.jit
def demo3(z_ptr):
    range = tl.arange(0, 8)
    #store命令解析：访问前8个位置，写入10,但是由于range < 5掩码机制的存在
    #只有前五个位置会实际被写入
    z = tl.store(z_ptr + range, 10, range < 5)


def run_demo3():
    print("Demo3 Output: ")
    z = torch.ones(4, 3)
    demo3[(1, 1, 1)](z)
    print(z)
    print_end_line()


"""
### Demo 4

You can only load in relatively small `blocks` at a time in Triton. To work 
with larger tensors you need to use a program id axis to run multiple blocks in 
parallel. 

Here is an example with one program axis with 3 blocks.

Expected Results:

Print for each [0] [1. 1. 1. 1. 1. 1. 1. 1.]
Print for each [1] [1. 1. 1. 1. 1. 1. 1. 1.]
Print for each [2] [1. 1. 1. 1. 0. 0. 0. 0.]

Explanation:

This program launch 3 blocks in parallel. For each block (pid=0, 1, 2), it loads 8 
elements. Note that similar to demo3, multi-dimensional tensors are flattened when we 
use pointer (i.e. continuous in memory).
"""


@triton.jit
def demo4(x_ptr):
    #获取当前程序块在第一个维度上的ID
    """
    程序块0: program_id(0)=0, program_id(1)=0, program_id(2)=0
    程序块1: program_id(0)=1, program_id(1)=0, program_id(2)=0
    程序块2: program_id(0)=2, program_id(1)=0, program_id(2)=0
    """
    pid = tl.program_id(0)
    #每个块计算自己的数据偏移量
    """
    块0: 元素 0-7
    块1: 元素 8-15
    块2: 元素 16-23
    """
    range = tl.arange(0, 8) + pid * 8
    x = tl.load(x_ptr + range, range < 20)
    print("Print for each", pid, x)


def run_demo4():
    print("Demo4 Output: ")
    #创建一个2×4×4的全1张量
    x = torch.ones(2, 4, 4)
    #启动3×1×1个程序块并行执行内核
    demo4[(3, 1, 1)](x)
    print_end_line()


r"""
## Puzzle 1: Constant Add

Add a constant to a vector. Uses one program id axis. 
Block size `B0` is always the same as vector `x` with length `N0`.

.. math::
    z_i = 10 + x_i \text{ for } i = 1\ldots N_0
"""


def add_spec(x: Float32[32,]) -> Float32[32,]:
    "This is the spec that you should implement. Uses typing to define sizes."
    return x + 10.0


@triton.jit
def add_kernel(x_ptr, z_ptr, N0, B0: tl.constexpr):
    # We name the offsets of the pointers as "off_"
    off_x = tl.arange(0, B0)
    x = tl.load(x_ptr + off_x)
    # Finish me!
    x = x +10.0
    z = tl.store(z_ptr + off_x,x)
    return z


r"""
## Puzzle 2: Constant Add Block

Add a constant to a vector. Uses one program block axis (no `for` loops yet). 
Block size `B0` is now smaller than the shape vector `x` which is `N0`.

.. math::
    z_i = 10 + x_i \text{ for } i = 1\ldots N_0
"""


def add2_spec(x: Float32[200,]) -> Float32[200,]:
    return x + 10.0


@triton.jit
def add_mask2_kernel(x_ptr, z_ptr, N0, B0: tl.constexpr):
    # Finish me!
    pid = tl.program_id(0)
    range = tl.arange(0,B0) + pid * B0
    x = tl.load(x_ptr+range,range<N0,0)
    x = x+10.0
    z = tl.store(z_ptr+range,x,range<N0)
    return z


r"""
## Puzzle 3: Outer Vector Add

Add two vectors.

Uses one program block axis. Block size `B0` is always the same as vector `x` length `N0`.
Block size `B1` is always the same as vector `y` length `N1`.

.. math::
    z_{j, i} = x_i + y_j\text{ for } i = 1\ldots B_0,\ j = 1\ldots B_1
"""


def add_vec_spec(x: Float32[32,], y: Float32[32,]) -> Float32[32, 32]:
    return x[None, :] + y[:, None]


@triton.jit
def add_vec_kernel(x_ptr, y_ptr, z_ptr, N0, N1, B0: tl.constexpr, B1: tl.constexpr):
    # Finish me!
    off_x = tl.arange(0,B0)[None,:]
    off_y = tl.arange(0,B1)[:,None]
    off_z = B0*off_y + off_x
    x = tl.load(x_ptr+off_x)
    y = tl.load(y_ptr+off_y)
    z = x+y
    tl.store(z_ptr+off_z,z)
    return


r"""
## Puzzle 4: Outer Vector Add Block

Add a row vector to a column vector.

Uses two program block axes. Block size `B0` is always less than the vector `x` length `N0`.
Block size `B1` is always less than vector `y` length `N1`.

.. math::
    z_{j, i} = x_i + y_j\text{ for } i = 1\ldots N_0,\ j = 1\ldots N_1
"""


def add_vec_block_spec(x: Float32[100,], y: Float32[90,]) -> Float32[90, 100]:
    return x[None, :] + y[:, None]


@triton.jit
def add_vec_block_kernel(
    x_ptr, y_ptr, z_ptr, N0, N1, B0: tl.constexpr, B1: tl.constexpr
):
    block_id_x = tl.program_id(0)
    block_id_y = tl.program_id(1)
    #注意这个题，无论是off偏移量，还是mask，还是最终结果都需要变成二维的
    off_x = (tl.arange(0,B0)+block_id_x*B0)[None,:]
    off_y = (tl.arange(0,B1)+block_id_y*B1)[:,None]
    off_z = off_y*N0+off_x
    mask_x = off_x<N0
    mask_y = off_y<N1
    mask_z = mask_x&mask_y
    x = tl.load(x_ptr+off_x,mask_x,0)
    y = tl.load(y_ptr+off_y,mask_y,0)
    z = x+ y
    tl.store(z_ptr+off_z,z,mask_z)
    return


r"""
## Puzzle 5: Fused Outer Multiplication

Multiply a row vector to a column vector and take a relu.

Uses two program block axes. Block size `B0` is always less than the vector `x` length `N0`.
Block size `B1` is always less than vector `y` length `N1`.

.. math::
    z_{j, i} = \text{relu}(x_i \times y_j)\text{ for } i = 1\ldots N_0,\ j = 1\ldots N_1
"""


def mul_relu_block_spec(x: Float32[100,], y: Float32[90,]) -> Float32[90, 100]:
    return torch.relu(x[None, :] * y[:, None])


@triton.jit
def mul_relu_block_kernel(
    x_ptr, y_ptr, z_ptr, N0, N1, B0: tl.constexpr, B1: tl.constexpr
):
    block_id_x = tl.program_id(0)
    block_id_y = tl.program_id(1)
    # Finish me!
    off_x = (tl.arange(0,B0)+block_id_x*B0)[None,:]
    off_y = (tl.arange(0,B1)+block_id_y*B1)[:,None]
    off_z = off_y*N0+off_x
    mask_x = off_x<N0
    mask_y = off_y<N1
    mask_z = mask_x&mask_y
    x = tl.load(x_ptr+off_x,mask_x,0)
    y = tl.load(y_ptr+off_y,mask_y,0)
    #注意在triton内核中不能调用pytorch的函数
    """
    relu:
    f(x) = { x, 如果 x > 0
       { 0, 如果 x ≤ 0
    tl.where(,condition,x,y)
    当conditon为真的时候选择x的值，反之选择y的值
    """
    z = tl.where(x*y>0,x*y,0)
    tl.store(z_ptr+off_z,z,mask_z)
    return


r"""
## Puzzle 6: Fused Outer Multiplication - Backwards

Backwards of a function that multiplies a matrix with a row vector and take a relu.

Uses two program blocks. Block size `B0` is always less than the vector `x` length `N0`.
Block size `B1` is always less than vector `y` length `N1`. Chain rule backward `dz`
is of shape `N1` by `N0`

.. math::
    f(x, y) = \text{relu}(x_{j, i} \times y_j)\text{ for } i = 1\ldots N_0,\ j = 1\ldots N_1

.. math::
    dx_{j, i} = f_x'(x, y)_{j, i} \times dz_{j, i}
"""


def mul_relu_block_back_spec(
    x: Float32[90, 100], y: Float32[90,], dz: Float32[90, 100]
) -> Float32[90, 100]:
    x = x.clone()
    y = y.clone()
    x = x.requires_grad_(True)
    y = y.requires_grad_(True)
    z = torch.relu(x * y[:, None])
    z.backward(dz)
    dx = x.grad
    return dx


@triton.jit
def mul_relu_block_back_kernel(
    x_ptr, y_ptr, dz_ptr, dx_ptr, N0, N1, B0: tl.constexpr, B1: tl.constexpr
):
    block_id_i = tl.program_id(0)
    block_id_j = tl.program_id(1)
    #forward过程：z = relu(x * y[:, None])
    off_i = (tl.arange(0,B0)+B0*block_id_i)[None,:]
    off_j = (tl.arange(0,B1)+B1*block_id_j)[:,None]
    off_x = off_j*N0+off_i
    mask_i = off_i<N0
    mask_j = off_j<N1
    mask_x = mask_i&mask_j
    x = tl.load(x_ptr+off_x,mask_x,0)
    y = tl.load(y_ptr+off_j,mask_j,0)
    """
    backward：dx = dz * ∂(relu(x*y))/∂x
    ∂(relu(x*y))/∂x：如果 x * y > 0，导数为 y，如果 x * y ≤ 0，导数为 0
    """
    dz = tl.load(dz_ptr+off_x,mask_x,0)
    dd = tl.where(x*y>0,y,0)
    tl.store(dx_ptr+off_x,dz*dd,mask_x) 
    return


r"""
## Puzzle 7: Long Sum

Sum of a batch of numbers.

Uses one program blocks. Block size `B0` represents a range of batches of  `x` of length `N0`.
Each element is of length `T`. Process it `B1 < T` elements at a time.  

.. math::
    z_{i} = \sum^{T}_j x_{i,j} =  \text{ for } i = 1\ldots N_0

Hint: You will need a for loop for this problem. These work and look the same as in Python.
"""


def sum_spec(x: Float32[4, 200]) -> Float32[4,]:
    return x.sum(1)

"""
明白这个题的题意，x是一个N0行，T列的张量，每块中处理B0行，在每次处理的时候一并处理B1个元素
目的就是将一整行的元素相加，放入z中
"""

@triton.jit
def sum_kernel(x_ptr, z_ptr, N0, N1, T, B0: tl.constexpr, B1: tl.constexpr):
    tid = tl.program_id(0)
    off_i  = tid*B0+tl.arange(0,B0) 
    mask_i = off_i<N0
    z = tl.zeros([B0],dtype=tl.float32)
    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,0)
        #tl.sum：对count张量的行进行求和（axis=1），如果是列求和（axis=0）
        z += tl.sum(count,axis=1)
    tl.store(z_ptr+off_i,z,mask_i)

            
    return


r"""
## Puzzle 8: Long Softmax

Softmax of a batch of logits.

Uses one program block axis. Block size `B0` represents the batch of `x` of length `N0`.
Block logit length `T`.   Process it `B1 < T` elements at a time.  

.. math::
    z_{i, j} = \text{softmax}(x_{i,1} \ldots x_{i, T}) \text{ for } i = 1\ldots N_0

Note softmax needs to be computed in numerically stable form as in Python. In addition in Triton 
they recommend not using `exp` but instead using `exp2`. You need the identity

.. math::
    \exp(x) = 2^{\log_2(e) x}

Advanced: there one way to do this with 3 loops. You can also do it with 2 loops if you are clever. 
Hint: you will find this identity useful:

.. math::
    \exp(x_i - m) =  \exp(x_i - m/2 - m/2) = \exp(x_i - m/ 2) /  \exp(m/2)
"""


def softmax_spec(x: Float32[4, 200]) -> Float32[4, 200]:
    x_max = x.max(1, keepdim=True)[0]
    x = x - x_max
    x_exp = x.exp()
    return x_exp / x_exp.sum(1, keepdim=True)


@triton.jit
def softmax_kernel(x_ptr, z_ptr, N0, N1, T, B0: tl.constexpr, B1: tl.constexpr):
    """2 loops ver."""
    block_id_i = tl.program_id(0)
    log2_e = 1.44269504
    off_i  = block_id_i*B0+tl.arange(0,B0) 
    mask_i = off_i<N0
    max_val = tl.full([B0],-float('inf'),dtype=tl.float32)
    z = tl.zeros([B0],dtype=tl.float32)
    sum_exp = tl.zeros([B0],dtype=tl.float32)
    #第一个循环计算最大值max_val和sum_exp
    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,-float('inf'))

        c_max = tl.max(count,axis=1)
        old_max = max_val
        max_val = tl.maximum(max_val,c_max)
        # 使用恒等式: exp(x - new_max) = exp(x - old_max) * exp(old_max - new_max)
        scale = tl.exp2((old_max - max_val)*log2_e)
        sum_exp = sum_exp*scale

        exp_val = tl.exp2((count-max_val)*log2_e)
        sum_exp += tl.sum(exp_val,axis=1)

    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,0)
        exp_val = tl.exp2((count-max_val)*log2_e)
        z = exp_val/(sum_exp + 1e-8)
        tl.store(z_ptr +off_c,z,mask_c)


@triton.jit
def softmax_kernel_brute_force(
    x_ptr, z_ptr, N0, N1, T, B0: tl.constexpr, B1: tl.constexpr
):
    """3 loops ver."""
    #对每一行找最大值，并且计算exp_sum
    block_id_i = tl.program_id(0)
    log2_e = 1.44269504
    off_i  = block_id_i*B0+tl.arange(0,B0) 
    mask_i = off_i<N0
    max_val = tl.full([B0],-float('inf'),dtype=tl.float32)
    z = tl.zeros([B0],dtype=tl.float32)
    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,-float('inf'))
        c_max = tl.max(count,axis=1)
        max_val = tl.maximum(max_val,c_max)

    sum_exp = tl.zeros([B0],dtype=tl.float32)
    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,0)
        exp_val = tl.exp2((count-max_val)*log2_e)
        sum_exp += tl.sum(exp_val,axis=1)

    for j in tl.range(0,T,B1):
        off_j = j + tl.arange(0,B1)
        mask_j = off_j<T
        off_c = off_i[:,None]*T+off_j[None,:]
        mask_c = mask_i[:,None]&mask_j[None,:]
        count = tl.load(x_ptr+off_c,mask_c,0)
        exp_val = tl.exp2((count-max_val)*log2_e)
        z = exp_val/(sum_exp + 1e-8)
        tl.store(z_ptr +off_c,z,mask_c)



    return


r"""
## Puzzle 9: Simple FlashAttention

A scalar version of FlashAttention.

Uses zero programs. Block size `B0` represent the batches of `q` to process out of `N0`. Sequence length is `T`. Process it `B1 < T` elements (`k`, `v`) at a time for some `B1`.

.. math::
    z_{i} = \sum_{j=1}^{T} \text{softmax}(q_i k_1, \ldots, q_i k_T)_j v_{j} \text{ for } i = 1\ldots N_0

This can be done in 1 loop using a similar trick from the last puzzle.

Hint: Use `tl.where` to mask `q dot k` to -inf to avoid overflow (NaN).
"""


def flashatt_spec(
    q: Float32[200,], k: Float32[200,], v: Float32[200,]
) -> Float32[200,]:
    x = q[:, None] * k[None, :]
    x_max = x.max(1, keepdim=True)[0]
    x = x - x_max
    x_exp = x.exp()
    soft = x_exp / x_exp.sum(1, keepdim=True)
    return (v[None, :] * soft).sum(1)


@triton.jit
def flashatt_kernel(
    q_ptr, k_ptr, v_ptr, z_ptr, N0, T, B0: tl.constexpr, B1: tl.constexpr
):
    block_id_i = tl.program_id(0)
    log2_e = 1.44269504
    #myexp = lambda x: tl.exp2(log2_e * x)

    off_i = block_id_i*B0 + tl.arange(0,B0)
    mask_i = off_i< N0
    q = tl.load(q_ptr+off_i,mask_i,0)
    exp_sum = tl.zeros((B0,), dtype=tl.float32)
    qk_max = tl.full((B0,), -1.0e6, dtype=tl.float32)
    z = tl.zeros((B0,), dtype=tl.float32)
    for j in tl.range(0,T,B1):
        off_j = j+tl.arange(0,B1)
        mask_j = off_j<T
        k = tl.load(k_ptr+off_j,mask_j,0)
        v = tl.load(v_ptr+off_j,mask_j,0)
        mask_ij = mask_i[:,None]&mask_j[None,:]

        qk = q[:,None]*k[None,:]+tl.where(mask_ij,0,-1.0e6)
        #这里的max是针对每一行求得max
        new_max = tl.maximum(tl.max(qk,axis=1),qk_max)
        qk_exp = tl.exp2(log2_e * (qk - new_max[:, None]))
        factor = tl.exp2(log2_e * (qk_max - new_max))
        #这里的sum也是针对每一行求的sum
        new_exp_sum = exp_sum * factor + tl.sum(qk_exp, axis=1)
        z = z * factor + tl.sum(qk_exp * v[None, :], axis=1)
        qk_max = new_max
        exp_sum = new_exp_sum

    z = z / exp_sum
    tl.store(z_ptr + off_i, z, mask=mask_i)
    return


r"""
## Puzzle 10: Two Dimensional Convolution

A batched 2D convolution.

Uses one program id axis. Block size `B0` represent the batches to process out of `N0`.
Image `x` is size is `H` by `W` with only 1 channel, and kernel `k` is size `KH` by `KW`.

.. math::
    z_{i, j, l} = \sum_{oj, ol}^{j+oj\le H, l+ol\le W} k_{oj,ol} \times x_{i,j + oj, l + ol} 
    \text{ for } i = 1\ldots N_0 \text{ for } j = 1\ldots H \text{ for } l = 1\ldots W
"""


def conv2d_spec(x: Float32[4, 8, 8], k: Float32[4, 4]) -> Float32[4, 8, 8]:
    z = torch.zeros(4, 8, 8)
    x = torch.nn.functional.pad(x, (0, 4, 0, 4, 0, 0), value=0.0)
    # print(x.shape, k.shape)
    for i in range(8):
        for j in range(8):
            z[:, i, j] = (k[None, :, :] * x[:, i : i + 4, j : j + 4]).sum(1).sum(1)
    return z


@triton.jit
def conv2d_kernel(
    x_ptr, k_ptr, z_ptr, N0, H, W, KH: tl.constexpr, KW: tl.constexpr, B0: tl.constexpr
):
    block_id_i = tl.program_id(0)
    
    off_i = block_id_i*B0+tl.arange(0,B0)
    mask_i = off_i<N0

    off_k = tl.arange(0,KH)[:,None]*KW + tl.arange(0,KW)[None,:]
    k = tl.load(k_ptr+off_k)

    for h in tl.range(0,H,1):
        for w in tl.range(0,W,1):
            off_h = h+tl.arange(0,KH)[None,:,None]
            off_w = w+tl.arange(0,KW)[None,None,:]
            off_x = off_i*H*W + off_h*W+off_w
            mask_x = (off_h<H)&(off_w<W)
            x = tl.load(x_ptr+off_x,mask_x,0)

            z = tl.sum(x*k[None,:])
            off_z = off_i*H*W+h*W+w
            tl.store(z_ptr+off_z,z)







    return


r"""
## Puzzle 11: Matrix Multiplication

A blocked matrix multiplication.

Uses three program id axes. Block size `B2` represent the batches to process out of `N2`.
Block size `B0` represent the rows of `x` to process out of `N0`. Block size `B1` represent the cols 
of `y` to process out of `N1`. The middle shape is `MID`.

.. math::
    z_{i, j, k} = \sum_{l} x_{i,j, l} \times y_{i, l, k} \text{ for } i = 1\ldots N_2, j = 1\ldots N_0, k = 1\ldots N_1

You are allowed to use `tl.dot` which computes a smaller mat mul.

Hint: the main trick is that you can split a matmul into smaller parts.

.. math::
    z_{i, j, k} = \sum_{l=1}^{L/2} x_{i,j, l} \times y_{i, l, k} +  \sum_{l=L/2}^{L} x_{i,j, l} \times y_{i, l, k}
"""


def dot_spec(x: Float32[4, 32, 32], y: Float32[4, 32, 32]) -> Float32[4, 32, 32]:
    return x @ y


@triton.jit
def dot_kernel(
    x_ptr,
    y_ptr,
    z_ptr,
    N0,
    N1,
    N2,
    MID,
    B0: tl.constexpr,
    B1: tl.constexpr,
    B2: tl.constexpr,
    B_MID: tl.constexpr, #这个参数是内部维度块
):
    block_id_j = tl.program_id(0)
    block_id_k = tl.program_id(1)
    block_id_i = tl.program_id(2)
    # Finish me!
    off_j = B0*block_id_j + tl.arange(0,B0)
    off_k = B1*block_id_k + tl.arange(0,B1)
    off_i = B2*block_id_i + tl.arange(0,B2)
    
    multi = tl.zeros((B2,B0,B1),dtype=tl.float32)
    for m in tl.range(0,MID,B_MID):
        off_m = tl.arange(0,B_MID)+m
        off_x = off_i[:,None,None]*(N0*MID)+off_j[None,:,None]*MID + off_m[None,None,:]
        off_y = off_i[:,None,None]*(N1*MID)+off_m[None,:,None]*N1 + off_k[None,None,:]
        mask_x =(off_j < N0)[None,:,None]&(off_m<MID)[None,None,:]&(off_i<N2)[:,None,None]
        mask_y = (off_k< N1)[None,None,:]&(off_m<MID)[None,:,None]&(off_i<N2)[:,None,None]

        x = tl.load(x_ptr+off_x,mask_x,0)
        y = tl.load(y_ptr+off_y,mask_y,0)
        multi += tl.dot(x,y)

    off_z = off_i[:, None, None]*(N0*N1)+off_j[None, :, None]*N1+off_k[None, None, :]
    mask_z = (off_i<N2)[:, None, None]&(off_j<N0)[None, :, None]&(off_k<N1)[None, None, :]
    tl.store(z_ptr+off_z,multi,mask_z)

        

r"""
## Puzzle 12: Quantized Matrix Mult

When doing matrix multiplication with quantized neural networks a common strategy is to store the weight matrix in lower precision, with a shift and scale term.

For this problem our `weight` will be stored in 4 bits. We can store `FPINT` of these in a 32 bit integer. In addition for every `group` weights in order we will store 1 `scale` float value and 1 `shift` 4 bit value. We store these for the column of weight. The `activation`s are stored separately in standard floats.

Mathematically it looks like.

.. math::
    z_{j, k} = \sum_{l} sc_{j, \frac{l}{g}} (w_{j, l} - sh_{j, \frac{l}{g}}) \times y_{l, k} 
    \text{ for } j = 1\ldots N_0, k = 1\ldots N_1

Where `g` is the number of groups (`GROUP`).

However, it is a bit more complex since we need to also extract the 4-bit values into floats to begin.

Note:
- We don't consider batch size, i.e. `i`, in this puzzle.
- Remember to unpack the `FPINT` values into separate 4-bit values. This contains some shape manipulation.
"""

FPINT = 32 // 4
GROUP = 8


def quant_dot_spec(
    scale: Float32[32, 8],
    offset: Int32[32,],
    weight: Int32[32, 8],
    activation: Float32[64, 32],
) -> Float32[32, 32]:
    offset = offset.view(32, 1)

    def extract(x):
        over = torch.arange(8) * 4
        mask = 2**4 - 1
        return (x[..., None] >> over) & mask

    scale = scale[..., None].expand(-1, 8, GROUP).contiguous().view(-1, 64)
    offset = (
        extract(offset)[..., None].expand(-1, 1, 8, GROUP).contiguous().view(-1, 64)
    )
    return (scale * (extract(weight).view(-1, 64) - offset)) @ activation


@triton.jit
def quant_dot_kernel(
    scale_ptr,
    offset_ptr,
    weight_ptr,
    activation_ptr,
    z_ptr,
    N0,
    N1,
    MID,
    B0: tl.constexpr,
    B1: tl.constexpr,
    B_MID: tl.constexpr,
):
    block_id_j = tl.program_id(0)
    block_id_k = tl.program_id(1)
    off_j = block_id_j*B0 + tl.arange(0,B0)
    off_k = block_id_k*B1 + tl.arange(0,B1)
    mask_j = off_j<N0
    mask_k = off_k<N1

    z = tl.zeros((B0,B1),dtype=tl.float32)
    off_z = off_j[:, None] * N1 + off_k[None, :]
    mask_z = mask_j[:, None] & mask_k[None, :]

    for m in tl.range(0,MID,B_MID):
        off_m = m//GROUP + tl.arange(0,B_MID//GROUP)
        mask_m = off_m<(MID//GROUP)
        off_x = off_j[:,None]*(MID//GROUP)+off_m[None,:]
        mask_x = mask_j[:,None]&mask_m[None,:]

        scale = tl.load(scale_ptr+off_x,mask_x,0)
        weight = tl.load(weight_ptr+off_x,mask_x,0)
        offset = tl.load(offset_ptr+off_j,mask_j,0)

        off_y = m + tl.arange(0,B_MID)
        mask_y = off_y<MID
        off_activation = off_y[:,None]*N1 + off_k[None,:]
        mask_activation = mask_y[:,None]&mask_k[None,:]
        activation = tl.load(activation_ptr+off_activation,mask_activation,0)

        #这里需要利用广播机制进行高效解包
        #这里weight向第三个维度进行解包
        unpack = tl.arange(0,8)*4
        #哪里是None就扩展哪个维度
        unpack_shift = (offset[:,None]>>unpack)&0xF
        unpack_weight = (weight[:,:,None]>>unpack)&0xF
        
        quant_weight = scale[:,:,None] * (unpack_weight-unpack_shift[:,:,None])
        #这里再将第三个维度合并就可以了，这里就理解成利用内存布局不变，reshape知道怎么将后两个维度合并就可以了
        quant_weight = quant_weight.reshape(
           B0,B_MID
        )
        z +=tl.dot(quant_weight,activation)
    tl.store(z_ptr+off_z,z,mask_z)
    return


def run_demos():
    run_demo1()
    run_demo2()
    run_demo3()
    run_demo4()


def run_puzzles(args, puzzles: List[int]):
    print_log = args.log
    device = args.device

    if 1 in puzzles:
        print("Puzzle #1:")
        ok = test(
            add_kernel,
            add_spec,
            nelem={"N0": 32},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 2 in puzzles:
        print("Puzzle #2:")
        ok = test(
            add_mask2_kernel,
            add2_spec,
            nelem={"N0": 200},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 3 in puzzles:
        print("Puzzle #3:")
        ok = test(
            add_vec_kernel,
            add_vec_spec,
            nelem={"N0": 32, "N1": 32},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 4 in puzzles:
        print("Puzzle #4:")
        ok = test(
            add_vec_block_kernel,
            add_vec_block_spec,
            nelem={"N0": 100, "N1": 90},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 5 in puzzles:
        print("Puzzle #5:")
        ok = test(
            mul_relu_block_kernel,
            mul_relu_block_spec,
            nelem={"N0": 100, "N1": 90},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 6 in puzzles:
        print("Puzzle #6:")
        ok = test(
            mul_relu_block_back_kernel,
            mul_relu_block_back_spec,
            nelem={"N0": 100, "N1": 90},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 7 in puzzles:
        print("Puzzle #7:")
        ok = test(
            sum_kernel,
            sum_spec,
            B={"B0": 1, "B1": 32},
            nelem={"N0": 4, "N1": 32, "T": 200},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 8 in puzzles:
        print("Puzzle #8:")
        ok = test(
            softmax_kernel,
            softmax_spec,
            B={"B0": 1, "B1": 32},
            nelem={"N0": 4, "N1": 32, "T": 200},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 9 in puzzles:
        print("Puzzle #9:")
        ok = test(
            flashatt_kernel,
            flashatt_spec,
            B={"B0": 64, "B1": 32},
            nelem={"N0": 200, "T": 200},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 10 in puzzles:
        print("Puzzle #10:")
        ok = test(
            conv2d_kernel,
            conv2d_spec,
            B={"B0": 1},
            nelem={"N0": 4, "H": 8, "W": 8, "KH": 4, "KW": 4},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 11 in puzzles:
        print("Puzzle #11:")
        ok = test(
            dot_kernel,
            dot_spec,
            B={"B0": 16, "B1": 16, "B2": 1, "B_MID": 16},
            nelem={"N0": 32, "N1": 32, "N2": 4, "MID": 32},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    if 12 in puzzles:
        print("Puzzle #12:")
        ok = test(
            quant_dot_kernel,
            quant_dot_spec,
            B={"B0": 16, "B1": 16, "B_MID": 64},
            nelem={"N0": 32, "N1": 32, "MID": 64},
            print_log=print_log,
            device=device,
        )
        print_end_line()
        if not ok:
            return
    print("All tests passed!")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-p", "--puzzle", type=int, metavar="N", help="Run Puzzle #N")
    parser.add_argument(
        "-a",
        "--all",
        action="store_true",
        help="Run all Puzzles. Stop at first failure.",
    )
    parser.add_argument("-l", "--log", action="store_true", help="Print log messages.")
    parser.add_argument(
        "-i",
        "--intro",
        action="store_true",
        help="Run all demos in the introduction part.",
    )

    args = parser.parse_args()

    if os.getenv("TRITON_INTERPRET", "0") == "1":
        torch.set_default_device("cpu")
        args.device = "cpu"
    else:  # GPU mode
        torch.set_default_device("cuda")
        args.device = "cuda"

    if args.intro:
        run_demos()
    elif args.all:
        run_puzzles(args, list(range(1, 13)))
    elif args.puzzle:
        run_puzzles(args, [int(args.puzzle)])
    else:
        parser.print_help()
