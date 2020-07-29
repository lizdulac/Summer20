# Summer20
OpenCL to spirv example using createProgramWithIL copied from [spirvkernelfromfile](https://github.com/bashbaug/SimpleOpenCLSamples/tree/master/samples/05_spirvkernelfromfile).

## Compile
```sh
$ clang -c -cl-std=CL1.2 -target spir64 -emit-llvm -Xclang -finclude-default-header -flto sample_kernel.cl -o sample_kernel.ll
$ llvm-spirv sample_kernel64.ll -o sample_kernel64.spv
$ g++ -std=c++0x -o main main.cpp -lOpenCL
```

## Error
Running the above commands on devcloud results in one of two errors:

1. On the head node, the `g++` error is:
```
main.cpp:22:10: fatal error: CL/cl2.hpp: No such file or directory
 #include <CL/cl2.hpp>
          ^~~~~~~~~~~~
compilation terminated.
```

2. On a compute node, the `g++` error is:
```
In file included from main.cpp:23:0:
/usr/include/CL/cl2.hpp:442:109: note: #pragma message: cl2.hpp: CL_HPP_TARGET_OPENCL_VERSION is not defined. It will default to 200 (OpenCL 2.0)
 TARGET_OPENCL_VERSION is not defined. It will default to 200 (OpenCL 2.0)"

main.cpp: In function ‘cl::Program createProgramWithIL(const cl::Context&, const std::vector<unsigned char, std::allocator<unsigned char> >&)’:
main.cpp:107:36: error: ‘clCreateProgramWithILKHR_fn’ was not declared in this scope
  auto clCreateProgramWithILKHR_ = (clCreateProgramWithILKHR_fn)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
main.cpp:107:36: note: suggested alternative: ‘clCreateProgramWithILKHR_’
  auto clCreateProgramWithILKHR_ = (clCreateProgramWithILKHR_fn)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                    clCreateProgramWithILKHR_
```

Note: The type `clCreateProgramWithILKHR_fn` is declared in [cl2.hpp](https://github.com/KhronosGroup/OpenCL-CLHPP/blob/5f3cc41df821a3e5988490232082a3e3b82c0283/include/CL/cl2.hpp?fbclid=IwAR0RDZP-3zOAOLhGaqmUvezmceZzjrgvNHKuBIkiMQcLzIdwXtXY4IRpnZ8#L6345) 
