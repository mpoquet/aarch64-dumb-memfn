#include "common.h"

void *memcpy(void * dest, const void * src, size_t n);

int main() {
  uint8_t array[64];
  for (int i = 0; i < 64; ++i)
    array[i] = i;
  print_array(array, 64);

  memcpy(array+32, array, 8);
  print_array(array, 64);

  memcpy(array+48, array, 1);
  print_array(array, 64);

  memcpy(array+35, array+3, 6);
  print_array(array, 64);

  memcpy(array, array+32, 16);
  print_array(array, 64);

  memcpy(array+16, array+48, 16);
  print_array(array, 64);

  return 0;
}
