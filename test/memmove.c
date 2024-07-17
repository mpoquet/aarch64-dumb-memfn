#include "common.h"

void *memmove(void * dest, const void * src, size_t n);

int main() {
  uint8_t array[64];
  for (int i = 0; i < 64; ++i)
    array[i] = i;
  print_array(array, 64);

  // non-overlapping cases
  memmove(array+32, array, 8);
  print_array(array, 64);

  memmove(array+48, array, 1);
  print_array(array, 64);

  memmove(array+35, array+3, 6);
  print_array(array, 64);

  memmove(array, array+32, 16);
  print_array(array, 64);

  memmove(array+16, array+48, 16);
  print_array(array, 64);

  // overlapping non-aligned cases
  memmove(array+6, array, 16);
  print_array(array, 64);

  memmove(array+35, array+20, 17);
  print_array(array, 64);

  return 0;
}
