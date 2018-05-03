
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
#include <math.h>
# endif
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
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
void inputs_to_SPI_bytes_test_Outputs_wrapper(const real_T *dutyCycle,
			uint8_T *write,
			const real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE

        // request encoder
        write[0] = 0x01;
        write[1] = 0x00;
        write[2] = 0x00;
        write[3] = 0x00;
        write[4] = 0x00;
        unsigned int placeholder;
        
        // convert duty cycle to 16 bit int
        //placeholder = (unsigned int)(655.35*(dutyCycle[0]));
        placeholder = (unsigned int)(3276.75*(dutyCycle[0]+10));
        //write[2] = 0x02;
        //write[3] = 0x33;
        
        write[5] = 0x02;
        write[6] = (placeholder & 0x00ff);
        write[7] = (placeholder & 0xff00) >> 8;
      //  write[3] = (placeholder & 0xff0)>>4;
        //duty_cycle_int[0] = placeholder;
        
        // Request analog channels 0,1,2,6
        int n;
        int m;
        int anTag[5];
        anTag[0] = 0x10;
        anTag[1] = 0x11;
        anTag[2] = 0x12;
        anTag[3] = 0x13;
        anTag[4] = 0x16;
        
        for(n = 0; n < 5; n++){
            write[8 + n*9] = anTag[n];
            for(m = 1; m<8; m++){
                write[(9*n)+m+8] = 0;
            }
        }
        
        // End message byte
        write[53] = 0xF0;
        
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void inputs_to_SPI_bytes_test_Update_wrapper(const real_T *dutyCycle,
			uint8_T *write,
			real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}


