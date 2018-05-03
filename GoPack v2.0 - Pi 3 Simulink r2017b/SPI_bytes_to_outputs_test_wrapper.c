
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
void SPI_bytes_to_outputs_test_Outputs_wrapper(const uint8_T *read,
			real_T *dutyCycle,
			int32_T *enc1count,
			uint16_T *analog0,
			uint16_T *analog1,
			uint16_T *analog2,
			uint16_T *analog3,
			real_T *analog6,
			const real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] == 1)
{
    #ifndef MATLAB_MEX_FILE

        int n;
        int m;
        int msgMarker;
        uint16_T intDutyCycle;
        int readSize;
        
        int numMsgs = 8;
        int msgStartInd = 0;
        
        readSize = sizeof(read)/sizeof(read[0]);
        
        for(n=0; n < numMsgs; n++){
            msgMarker = read[msgStartInd];
            if (msgMarker == 1){
                enc1count[0] = read[msgStartInd+1] + (read[msgStartInd+2] << 8) + (read[msgStartInd+3] << 16) + (read[msgStartInd+4] << 24);
                msgStartInd += 5;
            }
            else if (msgMarker == 2){
                intDutyCycle = read[msgStartInd+1] + (read[msgStartInd+2] << 8);
                msgStartInd += 3;
            }
            else if (msgMarker == 0x10){
                for(m = 0; m<4; m++){
                    analog0[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x11){
                for(m = 0; m<4; m++){
                    analog1[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x12){
                for(m = 0; m<4; m++){
                    analog2[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x13){
                for(m = 0; m<4; m++){
                    analog3[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0x16){
                for(m = 0; m<4; m++){
                    analog6[m] = read[msgStartInd+(2*m+1)] + (read[msgStartInd+(2*m+2)] << 8);
                }
                msgStartInd += 9;
            }
            else if (msgMarker == 0xF0){
                msgStartInd = 0;
            }
        }
        
        
//         
//         for (n = 0; n < 6; n++){
//             if(n % 3 == 0){
//                 msgMarker = read[n];
//             }
//             else if(n % 3 == 1){
//                 switch(msgMarker){
//                     case 1:
//                         enc1count[0] = read[n];
//                         break;
//                     case 2:
//                         intDutyCycle = read[n];     //echo back commanded duty cycle
//                         break;
//                 }    
//             }
//             
//             else{
//                 switch(msgMarker){
//                     case 1:
//                         enc1count[0] = enc1count[0] + (read[n] << 8);
//                         break;
//                     case 2:
//                         intDutyCycle = intDutyCycle + (read[n] << 8);     //echo back commanded duty cycle
//                         break;
//                 }    
//             }
//         }
        
        //intDutyCycleOut[0] = intDutyCycle;
        dutyCycle[0] = (float)intDutyCycle*0.001526;
        
    #endif
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void SPI_bytes_to_outputs_test_Update_wrapper(const uint8_T *read,
			real_T *dutyCycle,
			int32_T *enc1count,
			uint16_T *analog0,
			uint16_T *analog1,
			uint16_T *analog2,
			uint16_T *analog3,
			real_T *analog6,
			real_T *xD)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
if(xD[0] != 1){
    
    xD[0] = 1;           
}
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}


