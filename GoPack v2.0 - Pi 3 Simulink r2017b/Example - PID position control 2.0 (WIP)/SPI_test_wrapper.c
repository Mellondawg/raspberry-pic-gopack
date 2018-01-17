
/*
 * Include Files
 *
 */
#if defined(MATLAB_MEX_FILE)
#include "tmwtypes.h"
#include "simstruc_types.h"
#else
#include "rtwtypes.h"
#endif



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
# ifndef MATLAB_MEX_FILE

#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/wiringPi.h>
#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/wiringPiSPI.h>
#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/wiringPi.c>
#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/piHiPri.c>
#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/piThread.c>
#include </home/pi/wiringPi-GoPack/wiringPi/wiringPi/wiringPiSPI.c>

// global variables for address, high and low bits for data
int fd, inputSize;
# endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 54
#define y_width 1

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
/* extern double func(double a); */
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Output functions
 *
 */
void SPI_test_Outputs_wrapper(const uint8_T *write,
			uint8_T *read,
			real_T *spi_test,
			const real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE
        // Read high byte, low byte, then combine:
    
        unsigned char spiData[54];
        int n;
        
        for (n = 0; n < 54; n++){
            spiData[n] = write[n];
        }
                
    	spi_test[0] = wiringPiSPIDataRW(0,spiData,54) ;
        
        for (n = 1; n < 54; n++){
            read[n-1] = spiData[n];
        }

        read[53] = spiData[0];
        
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void SPI_test_Update_wrapper(const uint8_T *write,
			uint8_T *read,
			real_T *spi_test,
			real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    
    # ifndef MATLAB_MEX_FILE     
        // Check that device is connected and setup:
        wiringPiSetup ();
        fd = wiringPiSPISetup(0,4000000,1);

    #endif
//done with initialization
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}


