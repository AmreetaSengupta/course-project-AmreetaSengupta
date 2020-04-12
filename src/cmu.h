/********************************************************************************************************************************
* File Name: cmu.h
* Description: Header files and variable declarations for cmu.c
* Author: Amreeta Sengupta
* References: https://siliconlabs.github.io/Gecko_SDK_Doc/efr32bg13/html/group__LETIMER.html#gaa4e7e28b4b04595a991a93b9e76c9919
**********************************************************************************************************************************/

#ifndef SRC_CMU_H_
#define SRC_CMU_H_

#include "em_cmu.h"

#define sleep_state (2) // Valid Inputs: 0,1,2,3 representing EM0,EM1, EM2, EM3

/*
 * @brief: This function performs configuration and setting up of the clock
 *         management unit according to various energy modes.
 */
void cmu_letimer_config();

#endif /* SRC_CMU_H_ */
