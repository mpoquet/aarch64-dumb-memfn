# aarch64-dumb-memfn
This repository contains an implementation of `memcpy`, `memmove`, `memset` and `memcmp` in Aarch64 assembly.

## Why???
These 4 functions should be implemented whenever using GCC's freestanding environment ([source](https://gcc.gnu.org/onlinedocs/gcc/Standards.html)).

## Rationale
This is just a simple codebase that can be used for pedagogical reasons. This is very slow, please avoid using it on real systems.

My initial use case is to compile [a pedagogical toy operating system on Aarch64](https://github.com/mpoquet/raspberry-pi-os-qemu) and I did not want to use an efficient but hard to read implementation, to prevent students to get lost in the codebase.

Features
- Addresses do not require any specific alignment
- Tested against glibc's implementation (test base is tiny, feel free to PR missing cases)

Non goals
- Optimization: all operations are done byte-by-byte.  
  If you want an optimized version please refer to [ARM's implementation](https://github.com/ARM-software/optimized-routines/tree/master/string/aarch64).

## Build & test
- Compile examples: `make`
- Run tests: `make test`

I needed a cross compiler and emulator to test this, you can use the following Nix environments to get them.
- Cross compiler: `nix develop .#cross-compiler`
- Cross QEMU: `nix develop .#cross-qemu`
