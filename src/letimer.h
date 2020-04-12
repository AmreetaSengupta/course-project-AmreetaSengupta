/********************************************************************************************************************************
* File Name: cmu.h
* Description: Header files and variable declarations for letimer.c
* Author: Amreeta Sengupta
* References: https://siliconlabs.github.io/Gecko_SDK_Doc/efr32bg13/html/group__LETIMER.html#gaa4e7e28b4b04595a991a93b9e76c9919
**********************************************************************************************************************************/

#ifndef SRC_LETIMER_H_
#define SRC_LETIMER_H_

#include <math.h>
#include "cmu.h"
#include "em_core.h"
#include "em_letimer.h"
#include "gpio.h"
#include "display.h"

#define ontime (.175) //On-time in seconds
#define period (1) //Period in seconds

int on_ticks, freq, ms_count;

/*
 * @brief: This function calculates the pre-scalar value to be set for each oscillator.
 * @return: Returns the value of ticks which is loaded into the LETIMER compare register.
 */
int prescalar_calc();


/*
 * @brief: This function performs configuration and setting up of LETIMER.
 */
void letimer_config();

/*
 * @brief: This function is used to perform blocking wait for the specified
 * 		   amount of time in microseconds.
 * @parameter: us_wait which is the integer value which specifies the delay in
 * 			   microseconds.
 */
void timerWaitUs(uint32_t us_wait);

/*
 * @brief: This function is used to perform non-blocking wait for the specified
 * 		   amount of time in milliseconds.
 * @parameter: ms_until_wakeup which is the integer value which specifies the
 * 			   delay in milliseconds.
 */
void timerSetEventInMs(uint32_t ms_until_wakeup);

/*
 * @brief: This function is used to calculate amount of time in milliseconds
 * 		   since startup (time-stamp).
 * @return: Returns a count of milliseconds since power up.
 *
 */
uint32_t timerGetRunTimeMilliseconds();

#endif
