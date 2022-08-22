/*
 * pendulo_fuzzy2015_data.c
 *
 * Code generation for model "pendulo_fuzzy2015".
 *
 * Model version              : 1.50
 * Simulink Coder version : 8.10 (R2016a) 10-Feb-2016
 * C source code generated on : Mon Jun 11 02:05:53 2012
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "pendulo_fuzzy2015.h"
#include "pendulo_fuzzy2015_private.h"

/* Block parameters (auto storage) */
P_pendulo_fuzzy2015_T pendulo_fuzzy2015_P = {
  10.0,                                /* Mask Parameter: AnalogOutput_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  10.0,                                /* Mask Parameter: AnalogOutput1_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  10.0,                                /* Mask Parameter: AnalogInput_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  10.0,                                /* Mask Parameter: AnalogInput1_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput1_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  0.0,                                 /* Mask Parameter: AnalogInput_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  0.0,                                 /* Mask Parameter: AnalogInput1_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Input1'
                                        */

  /*  Mask Parameter: mf1_a
   * Referenced by: '<S38>/Linear Coeff'
   */
  { 41.37, 10.03, 3.162, 4.288 },

  /*  Mask Parameter: mf2_a
   * Referenced by: '<S46>/Linear Coeff'
   */
  { 40.41, 10.05, 3.162, 4.288 },

  /*  Mask Parameter: mf3_a
   * Referenced by: '<S47>/Linear Coeff'
   */
  { 41.37, 10.03, 3.162, 4.288 },

  /*  Mask Parameter: mf4_a
   * Referenced by: '<S48>/Linear Coeff'
   */
  { 40.41, 10.05, 3.162, 4.288 },

  /*  Mask Parameter: mf5_a
   * Referenced by: '<S49>/Linear Coeff'
   */
  { 38.56, 10.18, 3.182, 4.288 },

  /*  Mask Parameter: mf6_a
   * Referenced by: '<S50>/Linear Coeff'
   */
  { 37.6, 10.15, 3.162, 4.288 },

  /*  Mask Parameter: mf7_a
   * Referenced by: '<S51>/Linear Coeff'
   */
  { 30.56, 10.18, 3.162, 4.288 },

  /*  Mask Parameter: mf8_a
   * Referenced by: '<S52>/Linear Coeff'
   */
  { 37.6, 10.15, 3.162, 4.288 },

  /*  Mask Parameter: mf9_a
   * Referenced by: '<S53>/Linear Coeff'
   */
  { 37.6, 10.15, 3.162, 4.288 },

  /*  Mask Parameter: mf10_a
   * Referenced by: '<S39>/Linear Coeff'
   */
  { 30.56, 10.18, 3.162, 4.288 },

  /*  Mask Parameter: mf11_a
   * Referenced by: '<S40>/Linear Coeff'
   */
  { 37.6, 10.15, 3.162, 4.288 },

  /*  Mask Parameter: mf12_a
   * Referenced by: '<S41>/Linear Coeff'
   */
  { 38.56, 10.18, 3.182, 4.288 },

  /*  Mask Parameter: mf13_a
   * Referenced by: '<S42>/Linear Coeff'
   */
  { 40.41, 10.05, 3.162, 4.288 },

  /*  Mask Parameter: mf14_a
   * Referenced by: '<S43>/Linear Coeff'
   */
  { 41.37, 10.03, 3.162, 4.288 },

  /*  Mask Parameter: mf15_a
   * Referenced by: '<S44>/Linear Coeff'
   */
  { 40.41, 10.05, 3.162, 4.288 },

  /*  Mask Parameter: mf16_a
   * Referenced by: '<S45>/Linear Coeff'
   */
  { 41.37, 10.03, 3.162, 4.288 },
  0.3386,                              /* Mask Parameter: mf1_b
                                        * Referenced by: '<S38>/Constant Coeff'
                                        */
  0.2068,                              /* Mask Parameter: mf2_b
                                        * Referenced by: '<S46>/Constant Coeff'
                                        */
  0.3386,                              /* Mask Parameter: mf3_b
                                        * Referenced by: '<S47>/Constant Coeff'
                                        */
  0.2068,                              /* Mask Parameter: mf4_b
                                        * Referenced by: '<S48>/Constant Coeff'
                                        */
  -0.04893,                            /* Mask Parameter: mf5_b
                                        * Referenced by: '<S49>/Constant Coeff'
                                        */
  -0.1807,                             /* Mask Parameter: mf6_b
                                        * Referenced by: '<S50>/Constant Coeff'
                                        */
  -0.04893,                            /* Mask Parameter: mf7_b
                                        * Referenced by: '<S51>/Constant Coeff'
                                        */
  -0.1807,                             /* Mask Parameter: mf8_b
                                        * Referenced by: '<S52>/Constant Coeff'
                                        */
  0.1807,                              /* Mask Parameter: mf9_b
                                        * Referenced by: '<S53>/Constant Coeff'
                                        */
  0.04893,                             /* Mask Parameter: mf10_b
                                        * Referenced by: '<S39>/Constant Coeff'
                                        */
  0.1807,                              /* Mask Parameter: mf11_b
                                        * Referenced by: '<S40>/Constant Coeff'
                                        */
  0.04893,                             /* Mask Parameter: mf12_b
                                        * Referenced by: '<S41>/Constant Coeff'
                                        */
  -0.2068,                             /* Mask Parameter: mf13_b
                                        * Referenced by: '<S42>/Constant Coeff'
                                        */
  -0.3386,                             /* Mask Parameter: mf14_b
                                        * Referenced by: '<S43>/Constant Coeff'
                                        */
  -0.2068,                             /* Mask Parameter: mf15_b
                                        * Referenced by: '<S44>/Constant Coeff'
                                        */
  -0.3386,                             /* Mask Parameter: mf16_b
                                        * Referenced by: '<S45>/Constant Coeff'
                                        */
  -0.3,                                /* Mask Parameter: mf1_mu
                                        * Referenced by: '<S30>/mu'
                                        */
  -1.0,                                /* Mask Parameter: mf1_mu_f
                                        * Referenced by: '<S32>/mu'
                                        */
  -3.0,                                /* Mask Parameter: mf1_mu_a
                                        * Referenced by: '<S34>/mu'
                                        */
  -3.0,                                /* Mask Parameter: mf1_mu_k
                                        * Referenced by: '<S36>/mu'
                                        */
  3.0,                                 /* Mask Parameter: mf2_mu
                                        * Referenced by: '<S37>/mu'
                                        */
  3.0,                                 /* Mask Parameter: mf2_mu_h
                                        * Referenced by: '<S35>/mu'
                                        */
  1.0,                                 /* Mask Parameter: mf2_mu_f
                                        * Referenced by: '<S33>/mu'
                                        */
  0.3,                                 /* Mask Parameter: mf2_mu_n
                                        * Referenced by: '<S31>/mu'
                                        */
  0.2548,                              /* Mask Parameter: mf1_sigma
                                        * Referenced by: '<S30>/sigma'
                                        */
  0.8494,                              /* Mask Parameter: mf1_sigma_i
                                        * Referenced by: '<S32>/sigma'
                                        */
  2.548,                               /* Mask Parameter: mf1_sigma_c
                                        * Referenced by: '<S34>/sigma'
                                        */
  2.548,                               /* Mask Parameter: mf1_sigma_f
                                        * Referenced by: '<S36>/sigma'
                                        */
  2.548,                               /* Mask Parameter: mf2_sigma
                                        * Referenced by: '<S37>/sigma'
                                        */
  2.548,                               /* Mask Parameter: mf2_sigma_b
                                        * Referenced by: '<S35>/sigma'
                                        */
  0.8494,                              /* Mask Parameter: mf2_sigma_o
                                        * Referenced by: '<S33>/sigma'
                                        */
  0.2548,                              /* Mask Parameter: mf2_sigma_j
                                        * Referenced by: '<S31>/sigma'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_Channels
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  1,                                   /* Mask Parameter: AnalogOutput1_Channels
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  0,                                   /* Mask Parameter: AnalogInput_Channels
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  1,                                   /* Mask Parameter: AnalogInput1_Channels
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_RangeMode
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput1_RangeMode
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  0,                                   /* Mask Parameter: AnalogInput_RangeMode
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  0,                                   /* Mask Parameter: AnalogInput1_RangeMode
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_VoltRange
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput1_VoltRange
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  9,                                   /* Mask Parameter: AnalogInput_VoltRange
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  9,                                   /* Mask Parameter: AnalogInput1_VoltRange
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S28>/Out1'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S28>/One'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S7>/Weight'
                                        */
  -50.0,                               /* Computed Parameter: TransferFcn3_A
                                        * Referenced by: '<S4>/Transfer Fcn3'
                                        */
  50.0,                                /* Computed Parameter: TransferFcn3_C
                                        * Referenced by: '<S4>/Transfer Fcn3'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S30>/Gain'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn4_A
                                        * Referenced by: '<S4>/Transfer Fcn4'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn4_C
                                        * Referenced by: '<S4>/Transfer Fcn4'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S32>/Gain'
                                        */
  -50.0,                               /* Computed Parameter: TransferFcn2_A
                                        * Referenced by: '<S4>/Transfer Fcn2'
                                        */
  50.0,                                /* Computed Parameter: TransferFcn2_C
                                        * Referenced by: '<S4>/Transfer Fcn2'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S34>/Gain'
                                        */
  -30.0,                               /* Computed Parameter: TransferFcn1_A
                                        * Referenced by: '<S4>/Transfer Fcn1'
                                        */
  30.0,                                /* Computed Parameter: TransferFcn1_C
                                        * Referenced by: '<S4>/Transfer Fcn1'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S36>/Gain'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S15>/Weight'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S37>/Gain'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S16>/Weight'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S35>/Gain'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S17>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S18>/Weight'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S33>/Gain'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S19>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S20>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S21>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S22>/Weight'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S31>/Gain'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S8>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S9>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S10>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S11>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S12>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S13>/Weight'
                                        */
  1.0,                                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S14>/Weight'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S5>/Zero'
                                        */
  0.5,                                 /* Expression: mean(cat(1,fis.output.range),2)
                                        * Referenced by: '<S5>/MidRange'
                                        */
  1.0,                                 /* Expression: 1
                                        * Referenced by: '<S5>/Switch'
                                        */
  4.5,                                 /* Expression: 4.5
                                        * Referenced by: '<S4>/Constant6'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S4>/Constant7'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S4>/Constant8'
                                        */
  0.3399,                              /* Expression: 0.3399
                                        * Referenced by: '<S4>/Constant1'
                                        */
  0.5864,                              /* Expression: 0.5864
                                        * Referenced by: '<S4>/Constant2'
                                        */
  -0.2826,                             /* Expression: -0.2826
                                        * Referenced by: '<S4>/Constant5'
                                        */
  2.7161,                              /* Expression: 2.7161
                                        * Referenced by: '<S4>/Constant3'
                                        */
  5.0627,                              /* Expression: 5.0627
                                        * Referenced by: '<S4>/Constant4'
                                        */
  0.024,                               /* Expression: 0.024
                                        * Referenced by: '<S4>/Constant'
                                        */
  0.5,                                 /* Expression: 0.5
                                        * Referenced by: '<Root>/Constant5'
                                        */
  -1.0,                                /* Expression: -1
                                        * Referenced by: '<Root>/Gain1'
                                        */
  7.5,                                 /* Expression: 7.5
                                        * Referenced by: '<Root>/Saturation'
                                        */
  -7.5                                 /* Expression: -7.5
                                        * Referenced by: '<Root>/Saturation'
                                        */
};
