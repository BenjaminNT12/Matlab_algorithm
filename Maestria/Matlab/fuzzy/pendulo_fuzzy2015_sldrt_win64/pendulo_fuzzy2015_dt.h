/*
 * pendulo_fuzzy2015_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&pendulo_fuzzy2015_B.TransferFcn3), 0, 0, 18 },

  { (char_T *)(&pendulo_fuzzy2015_B.IfActionSubsystem1.In1), 0, 0, 1 },

  { (char_T *)(&pendulo_fuzzy2015_B.IfActionSubsystem.In1), 0, 0, 1 }
  ,

  { (char_T *)(&pendulo_fuzzy2015_DW.TimeStampA), 0, 0, 8 },

  { (char_T *)(&pendulo_fuzzy2015_DW.AnalogOutput_PWORK), 11, 0, 13 },

  { (char_T *)(&pendulo_fuzzy2015_DW.If_ActiveSubsystem), 2, 0, 4 },

  { (char_T *)
    (&pendulo_fuzzy2015_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC), 2,
    0, 1 },

  { (char_T *)
    (&pendulo_fuzzy2015_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC), 2,
    0, 1 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  8U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&pendulo_fuzzy2015_P.AnalogOutput_MaxMissedTicks), 0, 0, 104 },

  { (char_T *)(&pendulo_fuzzy2015_P.AnalogOutput_Channels), 6, 0, 12 },

  { (char_T *)(&pendulo_fuzzy2015_P.Out1_Y0), 0, 0, 50 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  3U,
  rtPTransitions
};

/* [EOF] pendulo_fuzzy2015_dt.h */
