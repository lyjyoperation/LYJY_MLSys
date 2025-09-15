from setuptools import setup
from torch.utils import cpp_extension


setup(
    #py模块名
    name='CUDA_Test',
    #扩展模块
    ext_modules=[
        #扩展，如果是CPP文件就需要用CPPExtension
        cpp_extension.CUDAExtension(
            #py模块名
            name='CUDA_Test',
            #源文件
            sources=['cuda.cu'],
            #编译参数
            extra_compile_args={
                'cxx': ['-g', '-O0'],
                'nvcc': ['-g', "-G", '-O0']
            }
        )
    ],
    #模板，照着写就行
    cmdclass={
        'build_ext': cpp_extension.BuildExtension
    }
)
