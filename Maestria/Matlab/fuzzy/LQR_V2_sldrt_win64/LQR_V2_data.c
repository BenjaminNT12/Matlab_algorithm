/*
 * LQR_V2_data.c
 *
 * Code generation for model "LQR_V2".
 *
 * Model version              : 1.107
 * Simulink Coder version : 8.10 (R2016a) 10-Feb-2016
 * C source code generated on : Mon Jun 11 02:04:14 2012
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "LQR_V2.h"
#include "LQR_V2_private.h"

/* Block parameters (auto storage) */
P_LQR_V2_T LQR_V2_P = {
  -63.693680658289395,                 /* Variable: k1
                                        * Referenced by: '<S1>/Constant1'
                                        */
  -16.784763266824122,                 /* Variable: k2
                                        * Referenced by: '<S1>/Constant4'
                                        */
  -6.3245553203370761,                 /* Variable: k3
                                        * Referenced by: '<S1>/Constant2'
                                        */
  -10.583381821991495,                 /* Variable: k4
                                        * Referenced by: '<S1>/Constant3'
                                        */
  10.0,                                /* Mask Parameter: AnalogOutput_MaxMissedTicks
                                        * Referenced by: '<S2>/Analog Output'
                                        */
  10.0,                                /* Mask Parameter: AnalogOutput1_MaxMissedTicks
                                        * Referenced by: '<S2>/Analog Output1'
                                        */
  10.0,                                /* Mask Parameter: AnalogInput_MaxMissedTicks
                                        * Referenced by: '<S2>/Analog Input'
                                        */
  10.0,                                /* Mask Parameter: AnalogInput1_MaxMissedTicks
                                        * Referenced by: '<S2>/Analog Input1'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_YieldWhenWaiting
                                        * Referenced by: '<S2>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput1_YieldWhenWaiting
                                        * Referenced by: '<S2>/Analog Output1'
                                        */
  0.0,                                 /* Mask Parameter: AnalogInput_YieldWhenWaiting
                                        * Referenced by: '<S2>/Analog Input'
                                        */
  0.0,                                 /* Mask Parameter: AnalogInput1_YieldWhenWaiting
                                        * Referenced by: '<S2>/Analog Input1'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_Channels
                                        * Referenced by: '<S2>/Analog Output'
                                        */
  1,                                   /* Mask Parameter: AnalogOutput1_Channels
                                        * Referenced by: '<S2>/Analog Output1'
                                        */
  0,                                   /* Mask Parameter: AnalogInput_Channels
                                        * Referenced by: '<S2>/Analog Input'
                                        */
  1,                                   /* Mask Parameter: AnalogInput1_Channels
                                        * Referenced by: '<S2>/Analog Input1'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_RangeMode
                                        * Referenced by: '<S2>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput1_RangeMode
                                        * Referenced by: '<S2>/Analog Output1'
                                        */
  0,                                   /* Mask Parameter: AnalogInput_RangeMode
                                        * Referenced by: '<S2>/Analog Input'
                                        */
  0,                                   /* Mask Parameter: AnalogInput1_RangeMode
                                        * Referenced by: '<S2>/Analog Input1'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_VoltRange
                                        * Referenced by: '<S2>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput1_VoltRange
                                        * Referenced by: '<S2>/Analog Output1'
                                        */
  9,                                   /* Mask Parameter: AnalogInput_VoltRange
                                        * Referenced by: '<S2>/Analog Input'
                                        */
  9,                                   /* Mask Parameter: AnalogInput1_VoltRange
                                        * Referenced by: '<S2>/Analog Input1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S2>/Constant9'
                                        */
  0.0354,                              /* Expression: 0.0354
                                        * Referenced by: '<S2>/Constant'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Constant1'
                                        */
  0.01,                                /* Expression: 0.01
                                        * Referenced by: '<Root>/Signal Generator1'
                                        */
  1.5,                                 /* Expression: 1.5
                                        * Referenced by: '<Root>/Signal Generator1'
                                        */
  -50.0,                               /* Computed Parameter: TransferFcn3_A
                                        * Referenced by: '<S2>/Transfer Fcn3'
                                        */
  50.0,                                /* Computed Parameter: TransferFcn3_C
                                        * Referenced by: '<S2>/Transfer Fcn3'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn4_A
                                        * Referenced by: '<S2>/Transfer Fcn4'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn4_C
                                        * Referenced by: '<S2>/Transfer Fcn4'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Constant'
                                        */
  0.1,                                 /* Expression: 0.1
                                        * Referenced by: '<Root>/Signal Generator'
                                        */
  1.5,                                 /* Expression: 1.5
                                        * Referenced by: '<Root>/Signal Generator'
                                        */
  -50.0,                               /* Computed Parameter: TransferFcn2_A
                                        * Referenced by: '<S2>/Transfer Fcn2'
                                        */
  50.0,                                /* Computed Parameter: TransferFcn2_C
                                        * Referenced by: '<S2>/Transfer Fcn2'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn1_A
                                        * Referenced by: '<S2>/Transfer Fcn1'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn1_C
                                        * Referenced by: '<S2>/Transfer Fcn1'
                                        */
  12.0,                                /* Expression: 12
                                        * Referenced by: '<Root>/Saturation'
                                        */
  -12.0,                               /* Expression: -12
                                        * Referenced by: '<Root>/Saturation'
                                        */
  4.5,                                 /* Expression: 4.5
                                        * Referenced by: '<S2>/Constant6'
                                        */
  12.0,                                /* Expression: 12
                                        * Referenced by: '<S2>/Saturation'
                                        */
  -12.0,                               /* Expression: -12
                                        * Referenced by: '<S2>/Saturation'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S2>/Constant7'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S2>/Constant8'
                                        */
  0.6,                                 /* Expression: 0.6
                                        * Referenced by: '<S3>/in_min'
                                        */
  0.5,                                 /* Expression: 0.5
                                        * Referenced by: '<S3>/out_max'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S3>/out_min'
                                        */
  5.0,                                 /* Expression: 5
                                        * Referenced by: '<S3>/in_max'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn6_A
                                        * Referenced by: '<S2>/Transfer Fcn6'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn6_C
                                        * Referenced by: '<S2>/Transfer Fcn6'
                                        */
  -0.2826,                             /* Expression: -0.2826
                                        * Referenced by: '<S2>/Constant5'
                                        */
  2.7161,                              /* Expression: 2.7161
                                        * Referenced by: '<S2>/Constant3'
                                        */
  5.0627,                              /* Expression: 5.0627
                                        * Referenced by: '<S2>/Constant4'
                                        */
  2.04833984375,                       /* Expression: 2.04833984375
                                        * Referenced by: '<S4>/in_min'
                                        */
  45.0,                                /* Expression: 45
                                        * Referenced by: '<S4>/out_max'
                                        */
  -45.0,                               /* Expression: -45
                                        * Referenced by: '<S4>/out_min'
                                        */
  3.0591,                              /* Expression: 3.0591
                                        * Referenced by: '<S4>/in_max'
                                        */
  -1.61,                               /* Expression: -1.61
                                        * Referenced by: '<S2>/Constant10'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn5_A
                                        * Referenced by: '<S2>/Transfer Fcn5'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn5_C
                                        * Referenced by: '<S2>/Transfer Fcn5'
                                        */
  1U,                                  /* Computed Parameter: ManualSwitch1_CurrentSetting
                                        * Referenced by: '<Root>/Manual Switch1'
                                        */
  1U,                                  /* Computed Parameter: ManualSwitch_CurrentSetting
                                        * Referenced by: '<Root>/Manual Switch'
                                        */
  1U                                   /* Computed Parameter: ManualSwitch_CurrentSetting_f
                                        * Referenced by: '<S2>/Manual Switch'
                                        */
};
