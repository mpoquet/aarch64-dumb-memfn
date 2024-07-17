#include "common.h"

#include <stdio.h>

int memcmp(const void * s1, const void * s2, size_t n);

void print_sign(int i) {
  if (i < 0)
    i = -1;
  else if (i > 0)
    i = 1;
  printf("%d\n", i);
}

int main() {
  uint8_t a[64];
  uint8_t b[64];
  for (int i = 0; i < 64; ++i)
    a[i] = b[i] = i;
  print_sign(memcmp(a, b, 0));
  print_sign(memcmp(a, b, 64));
  print_sign(memcmp(a+20, b+20, 44));

  b[63] = 0;
  print_sign(memcmp(a, b, 56));
  print_sign(memcmp(a, b, 64));

  b[41] = 0;
  print_sign(memcmp(a+32, b+32, 1));
  print_sign(memcmp(a+32, b+32, 8));
  print_sign(memcmp(a+32, b+32, 16));
  print_sign(memcmp(a+32, b+32, 32));

  return 0;
}
