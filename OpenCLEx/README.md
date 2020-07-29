# Summer20
OpenCL to spirv example using createProgramWithIL copied from [spirvkernelfromfile](https://github.com/bashbaug/SimpleOpenCLSamples/tree/master/samples/05_spirvkernelfromfile).

## Compile On DevCloud
```sh
$ clang -c -cl-std=CL1.2 -target spir64 -emit-llvm -Xclang -finclude-default-header -flto sample_kernel.cl -o sample_kernel.ll
$ llvm-spirv sample_kernel64.ll -o sample_kernel64.spv
$ g++ -std=c++0x -o main main.cpp -lOpenCL
```
