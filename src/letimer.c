/********************************************************************************************************************************
* File Name: letimer.c
* Description: Configuration and setting up of LETIMER0.
* Author: Amreeta Sengupta
* References: https://www.silabs.com/community/wireless/bluetooth/knowledge-base.entry.html/2017/08/17/using_low_energytim-9RYB
* 	      https://siliconlabs.github.io/Gecko_SDK_Doc/efr32bg13/html/group__LETIMER.html#gaa4e7e28b4b04595a991a93b9e76c9919
**********************************************************************************************************************************/

#include "letimer.h"
//#include "native_gecko.h"

void LETIMER0_IRQHandler(void)
{
	//Interrupt Disable
	CORE_ATOMIC_IRQ_DISABLE();

	int int_val;

	//To get the LETIMER interrupt flags
	int_val = LETIMER_IntGetEnabled(LETIMER0);

	if(int_val & LETIMER_IF_UF)
	{
		//To clear LETIMER Interrupts
		LETIMER_IntClear(LETIMER0,LETIMER_IFC_UF);
		ms_count = ms_count + 1;
		displayUpdate();
//		if(connect_flag == true)
//		{
//			event_current |= 1U<<EVENT_TIMER_EXPIRE;
//			gecko_external_signal(event_current);
//		}
	}

	if(int_val & LETIMER_IF_COMP1)
	{
		//To clear LETIMER Interrupts
		LETIMER_IntClear(LETIMER0,LETIMER_IFC_COMP1);

		LETIMER_CompareSet(LETIMER0,1,0XFFFF);
		//To disable the LETIMER interrupt
		LETIMER_IntDisable(LETIMER0,LETIMER_IEN_COMP1);

//		event_current |= 1U<<EVENT_DELAY_EXPIRE;
//		gecko_external_signal(event_current);
	}

	//Interrupt enable
	CORE_ATOMIC_IRQ_ENABLE();
}

int prescalar_calc()
{
	int count = 0;
	int ticks = freq * period;

	if(ticks > 65535)
	{
		while(freq * period > 65535)
		{
			freq = freq/2;
			count++;
		}
		ticks = freq * period;
		CMU_ClockDivSet (cmuClock_LETIMER0,pow(2,count)); //To set clock prescalar
	}
	on_ticks = freq * ontime;
	return ticks;
}

void letimer_config()
{
	int load_val;

	//To clear LETIMER Interrupts
	LETIMER_IntClear(LETIMER0,LETIMER_IFC_COMP1|LETIMER_IFC_UF);

	//To set the configurations for LETIMER0
	const LETIMER_Init_TypeDef letimer_config =
	{
			.enable = false,              /* Start counting when initialization completed. */
			.debugRun = false,            /* Counter shall not keep running during debug halt. */
			.comp0Top = true,             /* Load COMP0 register into CNT when counter underflows. COMP0 is used as TOP */
			.bufTop = false,              /* Don't load COMP1 into COMP0 when REP0 reaches 0. */
			.out0Pol = 0,                 /* Idle value for output 0. */
			.out1Pol = 0,                 /* Idle value for output 1. */
			.ufoa0 = letimerUFOAPwm,      /* PWM output on output 0 */
			.ufoa1 = letimerUFOAPwm,      /* PWM output on output 1*/
			.repMode = letimerRepeatFree  /* Count until stopped */
	};

	//To initialize LETIMER0
	LETIMER_Init(LETIMER0, &letimer_config);

	if(sleep_state == 3)
	{
		freq = 1000;
		load_val = prescalar_calc();
	}
	else if(sleep_state == 0 || sleep_state == 1 || sleep_state == 2)
	{
		freq = 32768;
		load_val = prescalar_calc();
	}

	//To set LETIMER compare register value.
	LETIMER_CompareSet(LETIMER0, 0, load_val); //COMP0

	//To enable LETIMER0 Interrupts
	LETIMER_IntEnable(LETIMER0,LETIMER_IEN_UF);

	//To enable interrupts to the CPU
	NVIC->ISER[(((uint32_t)LETIMER0_IRQn) >> 5UL)] |= (uint32_t)(1UL << (((uint32_t)LETIMER0_IRQn) & 0x1FUL));

	//To enable LETIMER0
	LETIMER_Enable(LETIMER0,true);
}

void timerWaitUs(uint32_t us_wait)
{
	uint32_t ticks_set, ticks_current, comp_val, diff;

	ticks_set = (us_wait * freq)/1000000; //the total ticks that needs to be counted

	//To get current LETIMER counter value
	ticks_current = LETIMER_CounterGet(LETIMER0);

	if(ticks_current >= ticks_set)
	{
		diff = ticks_current - ticks_set;
	}
	else
	{
		diff = ticks_set - ticks_current;

		//To get LETIMER compare register value
		comp_val = LETIMER_CompareGet(LETIMER0,0);
		diff = comp_val - diff;
	}

	while(LETIMER_CounterGet(LETIMER0) != diff);
}

void timerSetEventInMs(uint32_t ms_until_wakeup)
{
	uint32_t ticks_set, ticks_current, comp_val, diff;

	ticks_set = (ms_until_wakeup * freq)/1000; //the total ticks that needs to be counted

	//To get current LETIMER counter value
	ticks_current = LETIMER_CounterGet(LETIMER0);

	if(ticks_current >= ticks_set)
	{
		diff = ticks_current - ticks_set;
	}
	else
	{
		diff = ticks_set - ticks_current;

		//To get LETIMER compare register value
		comp_val = LETIMER_CompareGet(LETIMER0,0);
		diff = comp_val - diff;
	}

	//To set LETIMER compare register value.
	LETIMER_CompareSet(LETIMER0, 1, diff); //COMP1

	//To enable LETIMER0 Interrupts
	LETIMER_IntEnable(LETIMER0,LETIMER_IEN_COMP1);
}

uint32_t timerGetRunTimeMilliseconds()
{
	uint32_t ms_val;

	ms_val = (LETIMER_CompareGet(LETIMER0,0))-(LETIMER_CounterGet(LETIMER0));

	return ((ms_val*1000)/freq) +(ms_count * period * 1000);

}




