/*
 * File: ArduinoMATLAB.c
 *
 * Code generated for Simulink model 'ArduinoMATLAB'.
 *
 * Model version                  : 1.1
 * Simulink Coder version         : 8.13 (R2017b) 24-Jul-2017
 * C/C++ source code generated on : Fri Apr 13 15:41:08 2018
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ArduinoMATLAB.h"
#include "ArduinoMATLAB_private.h"
#include "ArduinoMATLAB_dt.h"

/* Block signals (auto storage) */
B_ArduinoMATLAB_T ArduinoMATLAB_B;

/* Block states (auto storage) */
DW_ArduinoMATLAB_T ArduinoMATLAB_DW;

/* Real-time model */
RT_MODEL_ArduinoMATLAB_T ArduinoMATLAB_M_;
RT_MODEL_ArduinoMATLAB_T *const ArduinoMATLAB_M = &ArduinoMATLAB_M_;

/* Model step function */
void ArduinoMATLAB_step(void)
{
  /* S-Function (arduinoanaloginput_sfcn): '<Root>/Analog Input' */
  ArduinoMATLAB_B.AnalogInput = MW_analogRead(ArduinoMATLAB_P.AnalogInput_p1);

  /* External mode */
  rtExtModeUploadCheckTrigger(1);

  {                                    /* Sample time: [0.001s, 0.0s] */
    rtExtModeUpload(0, ArduinoMATLAB_M->Timing.taskTime0);
  }

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.001s, 0.0s] */
    if ((rtmGetTFinal(ArduinoMATLAB_M)!=-1) &&
        !((rtmGetTFinal(ArduinoMATLAB_M)-ArduinoMATLAB_M->Timing.taskTime0) >
          ArduinoMATLAB_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(ArduinoMATLAB_M, "Simulation finished");
    }

    if (rtmGetStopRequested(ArduinoMATLAB_M)) {
      rtmSetErrorStatus(ArduinoMATLAB_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  ArduinoMATLAB_M->Timing.taskTime0 =
    (++ArduinoMATLAB_M->Timing.clockTick0) * ArduinoMATLAB_M->Timing.stepSize0;
}

/* Model initialize function */
void ArduinoMATLAB_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)ArduinoMATLAB_M, 0,
                sizeof(RT_MODEL_ArduinoMATLAB_T));
  rtmSetTFinal(ArduinoMATLAB_M, -1);
  ArduinoMATLAB_M->Timing.stepSize0 = 0.001;

  /* External mode info */
  ArduinoMATLAB_M->Sizes.checksums[0] = (873604475U);
  ArduinoMATLAB_M->Sizes.checksums[1] = (3690113997U);
  ArduinoMATLAB_M->Sizes.checksums[2] = (2940237738U);
  ArduinoMATLAB_M->Sizes.checksums[3] = (3358733065U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    ArduinoMATLAB_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(ArduinoMATLAB_M->extModeInfo,
      &ArduinoMATLAB_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(ArduinoMATLAB_M->extModeInfo,
                        ArduinoMATLAB_M->Sizes.checksums);
    rteiSetTPtr(ArduinoMATLAB_M->extModeInfo, rtmGetTPtr(ArduinoMATLAB_M));
  }

  /* block I/O */
  (void) memset(((void *) &ArduinoMATLAB_B), 0,
                sizeof(B_ArduinoMATLAB_T));

  /* states (dwork) */
  (void) memset((void *)&ArduinoMATLAB_DW, 0,
                sizeof(DW_ArduinoMATLAB_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    ArduinoMATLAB_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Start for S-Function (arduinoanaloginput_sfcn): '<Root>/Analog Input' */
  MW_pinModeAnalogInput(ArduinoMATLAB_P.AnalogInput_p1);
}

/* Model terminate function */
void ArduinoMATLAB_terminate(void)
{
  /* (no terminate code required) */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
