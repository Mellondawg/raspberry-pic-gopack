/******************************************************************
Name: main.c
Author: Mark Price
Date: 03/30/2017

INCLUDE FILES: p33FJ64MC204.h, p33FJ64MC204.gld (Linker Script),
functions.c, support.h
******************************************************************/
#define FCY 40000000UL

#include "p33FJ64MC204.h" 	//Include p33FJ64MC202 header file
#include <math.h>			//Include math libary
#include "support.h" 		//Include Defitions and function prototypes
#include <stdio.h>
#include <stdlib.h>
#include "libpic30.h"		//FCY must be defined before libpic30.h is included

////////////////////////////////////////////////////////////////////////////////////////////
// Global variable declarations
////////////////////////////////////////////////////////////////////////////////////////////

// Initialization/runtime variables
long int run_time = 0;			// 1 msec increments, resets at 2^16 msec
float period;
int wait_flag = 0;				// signal for end of sample time
float samp_time = 1; 			// milliseconds

// PWM output variables
float p;
int pwm1_duty_12bit;
int pwm1_duty;
int pwm2_duty;
extern short oc1flag;
unsigned int pwm1_duty_16bit;

// Encoder variables
//int enc1_res = 4096; // # pulses x 4 (quadrature)
//int enc2_res = 4096;
//float enc1_pos = 0;
//float enc2_pos = 0;
extern short enc1flag;

unsigned int dataIn[RASPI_BUF_SIZE];
unsigned int dataOut[RASPI_BUF_SIZE];

// SPI communication variables
int spi1_flag;
int spi2_flag;
int SPI_wait_flag = 0;
extern short rasPiErrFlag;


/////////////////////////////////////////////////////////////////
// Start Main Function
/////////////////////////////////////////////////////////////////

int main()
{
//Initialization Routines
init_clock();			// initialize Clock 80 MHz/40 MIPS
init_pins();			// initialize pins
init_samptime();		// initialize sample time

//Set up SPI (slave - RasPi, master - peripherals)
init_spi1();            // slave
init_dma0_spi1_tx();
init_dma1_spi1_rx();

init_encoder1();
init_pwm1();


initDMA_ADC();
init_ADC();
initTmr3();

//Local variables in main

RGB_R = 1;
RGB_G = 1;
RGB_B = 1;
LED_Y = 1;

pwm1_duty = 500;

while(1)
{
    _RB5 = 1;
    while(!SPI_wait_flag){
        if(run_time > 100){ 
//            getEnc1Pos();
            pwm1_duty = 500;
            MOT_ENABLE = 0;
            _RB5 = 0;
            RGB_G = 1;
            RGB_R = 0;
        }
    }
    _RB5 = 0;    
    MOT_ENABLE = 1;
    RGB_G = 0;
    RGB_R = 1;
    run_time = 0;
    processRXdata();
    SPI_wait_flag = 0;
}
return 0;
} // end main
