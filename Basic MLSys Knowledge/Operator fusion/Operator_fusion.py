import math
import time
import numpy as np

def version1(x, weight, bias):
 
    m, k = x.shape
    n = weight.shape[1]
    result = np.zeros((m, n))
    
    # 矩阵乘法和偏置加法
    for i in range(m):          
        for j in range(n):      
            for a in range(k):  
                result[i][j] += x[i][a] * weight[a][j]
            result[i][j] += bias[j]  # A
    
    # Sigmoid激活
    for i in range(m):
        for j in range(n):
            result[i][j] = 1 / (1 + math.exp(-result[i][j]))  # B
    
    return result

def version2(x, weight, bias):
  
    m, k = x.shape
    n = weight.shape[1]
    result = np.zeros((m, n))
    
    for i in range(m):          
        for j in range(n):      
            for a in range(k):  
                result[i][j] += x[i][a] * weight[a][j]
            result[i][j] += bias[j]  # A
            result[i][j] = 1 / (1 + math.exp(-result[i][j]))  # B
    
    return result



# 测试数据
m, n, k = 97, 8, 8
x = np.random.randn(m, k)
weight = np.random.randn(k, n)
bias = np.random.randn(n)

# 验证结果一致性
result1 = version1(x, weight, bias)
result2 = version2(x, weight, bias)


print("结果一致性检查:")
print("Version1 vs Version2:", np.allclose(result1, result2))

# 性能测试
def time_function(func, *args):
    start = time.time()
    for _ in range(10000):  # 多次运行以获得更准确的时间
        result = func(*args)
    end = time.time()
    return end - start

time1 = time_function(version1, x, weight, bias)
time2 = time_function(version2, x, weight, bias)


print("\n性能对比 (运行100次的时间):")
print(f"Version1 (原始版本): {time1:.4f} 秒")
print(f"Version2 (优化版本): {time2:.4f} 秒")
print(f"\nVersion2 比 Version1 快 {time1/time2:.2f} 倍")
