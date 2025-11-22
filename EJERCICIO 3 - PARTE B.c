#include <stdint.h>

#define GPIO_P0_BASE   (0x50000000UL)   // dirección base del PUERTO 0

// Punteros a los registros del PUERTO 0
volatile uint32_t * const P0_OUT    = (uint32_t *)(GPIO_P0_BASE + 0x504);
volatile uint32_t * const P0_OUTSET = (uint32_t *)(GPIO_P0_BASE + 0x508);
volatile uint32_t * const P0_OUTCLR = (uint32_t *)(GPIO_P0_BASE + 0x50C);
volatile uint32_t * const P0_IN     = (uint32_t *)(GPIO_P0_BASE + 0x510);
volatile uint32_t * const P0_DIR    = (uint32_t *)(GPIO_P0_BASE + 0x514);
volatile uint32_t * const P0_DIRSET = (uint32_t *)(GPIO_P0_BASE + 0x518);
volatile uint32_t * const P0_DIRCLR = (uint32_t *)(GPIO_P0_BASE + 0x51C);