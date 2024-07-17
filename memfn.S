/** memcpy - copy memory area that do not overlap
 *  x0: dst (pointer)
 *  x1: src (pointer)
 *  x2: length
 **/
.globl memcpy
memcpy:
  cbz x2, .memcpy_ret
  mov x8, x0
.memcpy_loop:
  ldrb w9, [x1], #1
  subs x2, x2, #1
  strb w9, [x8], #1
  b.ne .memcpy_loop
.memcpy_ret:
  ret

/** memzero - fill 8-byte aligned memory with zeros
 *  x0: dst (pointer)
 * 	x1: length
 **/
.globl memzero
memzero:
  str xzr, [x0], #8
  subs x1, x1, #8
  b.gt memzero
  ret

/** memset - fill memory with a constant byte
 *  x0: dst (pointer)
 *  x1: val
 * 	x2: length
 **/
.globl memset
memset:
  cbz x2, .memset_ret
  mov x8, x0
.memset_loop:
  subs x2, x2, #1
  strb w1, [x8], #1
  b.ne .memset_loop
.memset_ret:
  ret

/** memcmp - compare memory areas
 *  x0: area1 (pointer)
 *  x1: area2 (pointer)
 * 	x2: length
 **/
.globl memcmp
memcmp:
  cbz x2, .memcmp_ret0
.memcmp_loop:
  ldrb w8, [x0], #1
  ldrb w9, [x1], #1
  subs w8, w8, w9
  b.ne .memcmp_retdiff
  subs x2, x2, #1
  b.ne .memcmp_loop
.memcmp_ret0:
  mov w0, wzr
  ret
.memcmp_retdiff:
  sxtb w0, w8
  ret

/** memmove - copy memory area that may overlap
 *  x0: dst (pointer)
 *  x1: src (pointer)
 *  x2: length
 **/
.globl memmove
memmove:
  cmp x1, x0
  b.ls .memmove_forward_entry
  cmp w2, #1
  b.lt .memmove_ret
  and x8, x2, #0x7fffffff
  mov x9, x0
.memmove_backward_loop:
  ldrb w10, [x1], #1
  subs x8, x8, #1
  strb w10, [x9], #1
  b.ne .memmove_backward_loop
  b .memmove_ret
.memmove_forward_entry:
  cmp w2, #1
  b.lt .memmove_ret
  and x8, x2, #0x7fffffff
  sub x8, x8, #1
.memmove_forward_loop:
  add x9, x8, #1
  ldrb w10, [x1, x8]
  sub x11, x8, #1
  cmp x9, #1
  strb w10, [x0, x8]
  mov x8, x11
  b.hi .memmove_forward_loop
.memmove_ret:
  ret
