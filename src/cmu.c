/********************************************************************************************************************************
* File Name: cmu.c
* Description: Configuration and setting up of CMU for LETIMER0.
* Author: Amreeta Sengupta
* References: https://siliconlabs.github.io/Gecko_SDK_Doc/efr32bg13/html/group__LETIMER.html#gaa4e7e28b4b04595a991a93b9e76c9919
**********************************************************************************************************************************/

#include "cmu.h"

void cmu_letimer_config()
{
	if(sleep_state == 3)
	{
		CMU_OscillatorEnable (cmuOsc_ULFRCO,true,true); //To enable the oscillator
		CMU_ClockSelectSet (cmuClock_LFA,cmuSelect_ULFRCO); //To select the clock source
	}
	else if(sleep_state == 0 || sleep_state == 1 || sleep_state == 2 )
	{
		CMU_OscillatorEnable (cmuOsc_LFXO,true,true); //To enable the oscillator
		CMU_ClockSelectSet (cmuClock_LFA,cmuSelect_LFXO); //To select the clock source
	}

	CMU_ClockEnable	(cmuClock_LFA,true); //To enable the clock
	CMU_ClockEnable	(cmuClock_LETIMER0,true); //To enable the clock
}

