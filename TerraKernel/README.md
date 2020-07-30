# Terra Kernel Skeleton
Compiling `terra_skeleton.t` results in error:
```
terra/src/terralib.lua:747: failed to initialize target for LLVM Triple: spir64-unknown-unknown (No available targets are compatible with triple "spir64-unknown-unknown")
stack traceback:
        [C]: in function 'inittarget'
        /home/u45377/terra/src/terralib.lua:747: in function 'newtarget'
        /home/u45377/SimpleOpenCLSample/terra_kernel.t:2: in main chunk
```
