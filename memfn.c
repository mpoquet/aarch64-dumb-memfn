#include <stddef.h>
#include <stdint.h>

void *memcpy(void * dest, const void * src, size_t n) {
  uint8_t * const d = dest;
  uint8_t const * const s = src;
  for (size_t i = 0; i < n; ++i)
    d[i] = s[i];
  return dest;
}

void *memset(void * dest, int constant, size_t n) {
  uint8_t * const d = dest;
  for (size_t i = 0; i < n; ++i)
    d[i] = constant;
  return dest;
}

int memcmp(const void * s1, const void * s2, size_t n) {
  uint8_t const * const a = s1;
  uint8_t const * const b = s2;
  for (size_t i = 0; i < n; ++i) {
    int8_t diff = a[i] - b[i];
    if (diff != 0)
      return diff;
  }
  return 0;
}

void *memmove(void * dest, const void * src, size_t n) {
  uint8_t * const d = dest;
  uint8_t const * const s = src;

  if (s > d) {
    for (int i = 0; i < (int)n; ++i)
      d[i] = s[i];
  } else {
    for (int i = (int)n-1; i >= 0; --i)
      d[i] = s[i];
  }

  return dest;
}
