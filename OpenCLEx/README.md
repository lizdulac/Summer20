# Summer20
OpenCL to spirv example using createProgramWithIL copied from [spirvkernelfromfile](https://github.com/bashbaug/SimpleOpenCLSamples/tree/master/samples/05_spirvkernelfromfile).

## Compile On DevCloud
```sh
$ clang -c -cl-std=CL1.2 -target spir64 -emit-llvm -Xclang -finclude-default-header -flto sample_kernel.cl -o sample_kernel.ll
$ llvm-spirv sample_kernel.ll -o sample_kernel.spv
$ g++ -std=c++0x -o main main.cpp -lOpenCL
```

Note: Compile on a compute node. Compilation on head node will result in `g++` error:
```
main.cpp:22:10: fatal error: CL/cl2.hpp: No such file or directory
 #include <CL/cl2.hpp>
          ^~~~~~~~~~~~
compilation terminated.
```

## Run On DevCloud
Note: devcloud compute nodes have multiple OpenCL platforms:
```sh
$ clinfo -l
Platform #0: Intel(R) FPGA Emulation Platform for OpenCL(TM)
 `-- Device #0: Intel(R) FPGA Emulation Device
Platform #1: Intel(R) OpenCL
 `-- Device #0: Intel(R) Xeon(R) E-2146G CPU @ 3.50GHz
Platform #2: Intel(R) OpenCL HD Graphics
 `-- Device #0: Intel(R) Gen9 HD Graphics NEO
```

Specify that the executable should be run with the OpenCL GPU platform using the `-p` flag:
```
$ ./main -p 2
Running on platform: Intel(R) OpenCL HD Graphics
Running on device: Intel(R) Gen9 HD Graphics NEO
CL_DEVICE_ADDRESS_BITS is 64 for this device.
Reading SPIR-V from file: sample_kernel64.spv
Building program with build options: (none)
Creating kernel: Test
Done.
```
