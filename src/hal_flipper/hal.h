#ifndef MRBC_SRC_HAL_H_
#define MRBC_SRC_HAL_H_

#include <furi_hal.h>

/***** Macros ***************************************************************/
/* Don't run forever */
#ifndef MRBC_SCHEDULER_EXIT
#define MRBC_SCHEDULER_EXIT 1
#endif

#if !defined(MRBC_TICK_UNIT)
#define MRBC_TICK_UNIT_1_MS   1
#define MRBC_TICK_UNIT_2_MS   2
#define MRBC_TICK_UNIT_4_MS   4
#define MRBC_TICK_UNIT_10_MS 10
// You may be able to reduce power consumption if you configure
// MRBC_TICK_UNIT_2_MS or larger.
#define MRBC_TICK_UNIT MRBC_TICK_UNIT_1_MS
// Substantial timeslice value (millisecond) will be
// MRBC_TICK_UNIT * MRBC_TIMESLICE_TICK_COUNT (+ Jitter).
// MRBC_TIMESLICE_TICK_COUNT must be natural number
// (recommended value is from 1 to 10).
#define MRBC_TIMESLICE_TICK_COUNT 10
#endif


# define hal_init()        ((void)0)
# define hal_enable_irq()  ((void)0)
# define hal_disable_irq() ((void)0)
# define hal_idle_cpu()    (furi_delay_ms(MRBC_TICK_UNIT), mrbc_tick())

/***** Typedefs *************************************************************/
/***** Global variables *****************************************************/
/***** Function prototypes **************************************************/
inline static int hal_write(int fd, const void *buf, int nbytes) {
  UNUSED(fd);
  UNUSED(nbytes);
  return printf(buf);
}

inline static int hal_flush(int fd) {
  UNUSED(fd);
  return 0;
}

#endif // ifndef MRBC_HAL_H_
