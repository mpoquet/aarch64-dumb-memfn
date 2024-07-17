CC ?= aarch64-linux-gnu
CFLAGS ?= -Wall -Wextra

.PHONY: all clean test

all: memcpy-libc memcpy-diy-asm memcpy-diy-c  memset-libc memset-diy-asm memset-diy-c memcmp-libc memcmp-diy-asm memcmp-diy-c memmove-libc memmove-diy-asm memmove-diy-c

clean:
	rm -f memcpy-libc memcpy-diy-asm memcpy-diy-c
	rm -f memset-libc memset-diy-asm memset-diy-c
	rm -f memcmp-libc memcmp-diy-asm memcmp-diy-c
	rm -f memmove-libc memmove-diy-asm memmove-diy-c
	rm -f mem*.out

test: test.sh memcpy-libc memcpy-diy-asm memcpy-diy-c memset-libc memset-diy-asm memset-diy-c memcmp-libc memcmp-diy-asm memcmp-diy-c memmove-libc memmove-diy-asm memmove-diy-c
	./test.sh


memcpy-libc: Makefile test/common.h test/common.c test/memcpy.c
	$(CC) $(CFLAGS) -Itest -o $@ test/common.c test/memcpy.c

memcpy-diy-asm: Makefile memfn.S test/common.h test/common.c test/memcpy.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.S test/common.c test/memcpy.c

memcpy-diy-c: Makefile memfn.c test/common.h test/common.c test/memcpy.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.c test/common.c test/memcpy.c


memset-libc: Makefile test/common.h test/common.c test/memset.c
	$(CC) $(CFLAGS) -Itest -o $@ test/common.c test/memset.c

memset-diy-asm: Makefile memfn.S test/common.h test/common.c test/memset.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.S test/common.c test/memset.c

memset-diy-c: Makefile memfn.c test/common.h test/common.c test/memset.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.c test/common.c test/memset.c


memcmp-libc: Makefile test/common.h test/common.c test/memcmp.c
	$(CC) $(CFLAGS) -Itest -o $@ test/common.c test/memcmp.c

memcmp-diy-asm: Makefile memfn.S test/common.h test/common.c test/memcmp.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.S test/common.c test/memcmp.c

memcmp-diy-c: Makefile memfn.c test/common.h test/common.c test/memcmp.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.c test/common.c test/memcmp.c


memmove-libc: Makefile test/common.h test/common.c test/memmove.c
	$(CC) $(CFLAGS) -Itest -o $@ test/common.c test/memmove.c

memmove-diy-asm: Makefile memfn.S test/common.h test/common.c test/memmove.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.S test/common.c test/memmove.c

memmove-diy-c: Makefile memfn.c test/common.h test/common.c test/memmove.c
	$(CC) $(CFLAGS) -ffreestanding -Itest -o $@ memfn.c test/common.c test/memmove.c
