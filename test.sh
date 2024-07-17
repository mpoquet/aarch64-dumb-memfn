#!/usr/bin/env sh
QEMU=${QEMU:-qemu-aarch64}
ret=0

for fn in memcpy memset memcmp memmove
do
  for implem in libc diy-asm diy-c
  do
    bin="${fn}-${implem}"
    ${QEMU} ./${bin} > ./${bin}.out
  done

  diff -q ./${fn}-libc.out ./${fn}-diy-c.out
  if [ $? -ne 0 ]; then
    ret=1
  fi

  diff -q ./${fn}-libc.out ./${fn}-diy-asm.out
  if [ $? -ne 0 ]; then
    ret=1
  fi
done

exit ${ret}
