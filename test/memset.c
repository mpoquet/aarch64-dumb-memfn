#include "common.h"

void *memset(void * dest, int constant, size_t n);

int main() {
  uint8_t array[64];
  for (int i = 0; i < 64; ++i)
    array[i] = i;
  print_array(array, 64);

  memset(array, 0x00, 8);
  print_array(array, 64);

  memset(array, 0x2A, 15);
  print_array(array, 64);

  memset(array+17, 0xFF, 21);
  print_array(array, 64);

  return 0;
}
