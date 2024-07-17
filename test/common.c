#include "common.h"

#include <stdio.h>

void print_array(uint8_t * ptr, uint64_t size) {
  for (uint64_t i = 0; i < size; ++i) {
    printf("%02x", ptr[i]);
  }
  printf("\n");
  fflush(stdout);
}
