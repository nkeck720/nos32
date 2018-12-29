/*
 * kmain.c - the entry point for the high-level portion of the kernel
 */

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <nos/terminal.h>

#if defined(__linux__)
#error "The kernel must be cross-compiled."
#endif

void nos_main(void) {
  /* Initialize the terminal for kernel logging. */
  term_init();
  term_print("nos version 0.0 build 1\n");
}
