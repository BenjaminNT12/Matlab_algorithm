/*
 * LQR_V2.c
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
#include "LQR_V2_dt.h"

/* options for Simulink Desktop Real-Time board 0 */
static double SLDRTBoardOptions0[] = {
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
};

/* list of Simulink Desktop Real-Time timers */
const int SLDRTTimerCount = 1;
const double SLDRTTimers[2] = {
  0.001, 0.0,
};

/* list of Simulink Desktop Real-Time boards */
const int SLDRTBoardCount = 1;
SLDRTBOARD SLDRTBoards[1] = {
  { "National_Instruments/PCI-6071E", 0U, 6, SLDRTBoardOptions0 },
};

/* Block signals (auto storage) */
B_LQR_V2_T LQR_V2_B;

/* Continuous states */
X_LQR_V2_T LQR_V2_X;

/* Block states (auto storage) */
DW_LQR_V2_T LQR_V2_DW;

/* Real-time model */
RT_MODEL_LQR_V2_T LQR_V2_M_;
RT_MODEL_LQR_V2_T *const LQR_V2_M = &LQR_V2_M_;

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 6;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  LQR_V2_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  LQR_V2_output();
  LQR_V2_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  LQR_V2_output();
  LQR_V2_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/*
 * Output and update for action system:
 *    '<S5>/If Action Subsystem'
 *    '<S5>/If Action Subsystem1'
 */
void LQR_V2_IfActionSubsystem(real_T rtu_In1, B_IfActionSubsystem_LQR_V2_T
  *localB)
{
  /* Inport: '<S6>/In1' */
  localB->In1 = rtu_In1;
}

/* Model output function */
void LQR_V2_output(void)
{
  /* local block i/o variables */
  real_T rtb_ManualSwitch;
  real_T *lastU;
  real_T rtb_Fcn;
  boolean_T rtb_RelationalOperator1;
  int8_T rtAction;
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
    /* set solver stop time */
    if (!(LQR_V2_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&LQR_V2_M->solverInfo,
                            ((LQR_V2_M->Timing.clockTickH0 + 1) *
        LQR_V2_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&LQR_V2_M->solverInfo, ((LQR_V2_M->Timing.clockTick0
        + 1) * LQR_V2_M->Timing.stepSize0 + LQR_V2_M->Timing.clockTickH0 *
        LQR_V2_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(LQR_V2_M)) {
    LQR_V2_M->Timing.t[0] = rtsiGetT(&LQR_V2_M->solverInfo);
  }

  /* Reset subsysRan breadcrumbs */
  srClearBC(LQR_V2_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC);

  /* TransferFcn: '<S2>/Transfer Fcn3' */
  LQR_V2_B.TransferFcn3 = 0.0;
  LQR_V2_B.TransferFcn3 += LQR_V2_P.TransferFcn3_C *
    LQR_V2_X.TransferFcn3_CSTATE;

  /* ManualSwitch: '<Root>/Manual Switch1' incorporates:
   *  Constant: '<Root>/Constant1'
   *  SignalGenerator: '<Root>/Signal Generator1'
   */
  if (LQR_V2_P.ManualSwitch1_CurrentSetting == 1) {
    rtb_Fcn = LQR_V2_P.Constant1_Value;
  } else {
    rtb_Fcn = sin(LQR_V2_P.SignalGenerator1_Frequency * LQR_V2_M->Timing.t[0]) *
      LQR_V2_P.SignalGenerator1_Amplitude;
  }

  /* End of ManualSwitch: '<Root>/Manual Switch1' */

  /* Sum: '<Root>/Subtract1' */
  LQR_V2_B.Subtract1 = LQR_V2_B.TransferFcn3 - rtb_Fcn;

  /* TransferFcn: '<S2>/Transfer Fcn4' */
  LQR_V2_B.TransferFcn4 = 0.0;
  LQR_V2_B.TransferFcn4 += LQR_V2_P.TransferFcn4_C *
    LQR_V2_X.TransferFcn4_CSTATE;

  /* ManualSwitch: '<Root>/Manual Switch' incorporates:
   *  Constant: '<Root>/Constant'
   *  SignalGenerator: '<Root>/Signal Generator'
   */
  if (LQR_V2_P.ManualSwitch_CurrentSetting == 1) {
    rtb_Fcn = LQR_V2_P.Constant_Value_b;
  } else {
    rtb_Fcn = sin(LQR_V2_P.SignalGenerator_Frequency * LQR_V2_M->Timing.t[0]) *
      LQR_V2_P.SignalGenerator_Amplitude;
  }

  /* End of ManualSwitch: '<Root>/Manual Switch' */

  /* TransferFcn: '<S2>/Transfer Fcn2' */
  LQR_V2_B.TransferFcn2 = 0.0;
  LQR_V2_B.TransferFcn2 += LQR_V2_P.TransferFcn2_C *
    LQR_V2_X.TransferFcn2_CSTATE;

  /* Sum: '<Root>/Add1' */
  LQR_V2_B.Add1 = LQR_V2_B.TransferFcn2 - rtb_Fcn;

  /* TransferFcn: '<S2>/Transfer Fcn1' */
  LQR_V2_B.TransferFcn1 = 0.0;
  LQR_V2_B.TransferFcn1 += LQR_V2_P.TransferFcn1_C *
    LQR_V2_X.TransferFcn1_CSTATE;

  /* Sum: '<S1>/Add1' incorporates:
   *  Constant: '<S1>/Constant1'
   *  Constant: '<S1>/Constant2'
   *  Constant: '<S1>/Constant3'
   *  Constant: '<S1>/Constant4'
   *  Product: '<S1>/Product1'
   *  Product: '<S1>/Product2'
   *  Product: '<S1>/Product3'
   *  Product: '<S1>/Product4'
   *  Sum: '<Root>/Subtract'
   */
  LQR_V2_B.Add1_o = ((LQR_V2_B.Subtract1 * -LQR_V2_P.k1 + LQR_V2_B.TransferFcn4 *
                      -LQR_V2_P.k2) + LQR_V2_B.Add1 * -LQR_V2_P.k3) +
    (LQR_V2_B.TransferFcn1 - rtb_Fcn) * -LQR_V2_P.k4;

  /* Saturate: '<Root>/Saturation' */
  if (LQR_V2_B.Add1_o > LQR_V2_P.Saturation_UpperSat) {
    LQR_V2_B.Saturation = LQR_V2_P.Saturation_UpperSat;
  } else if (LQR_V2_B.Add1_o < LQR_V2_P.Saturation_LowerSat) {
    LQR_V2_B.Saturation = LQR_V2_P.Saturation_LowerSat;
  } else {
    LQR_V2_B.Saturation = LQR_V2_B.Add1_o;
  }

  /* End of Saturate: '<Root>/Saturation' */

  /* Product: '<S2>/Product4' incorporates:
   *  Constant: '<S2>/Constant6'
   */
  rtb_Fcn = LQR_V2_B.Saturation * LQR_V2_P.Constant6_Value;

  /* Saturate: '<S2>/Saturation' */
  if (rtb_Fcn > LQR_V2_P.Saturation_UpperSat_k) {
    LQR_V2_B.Saturation_j = LQR_V2_P.Saturation_UpperSat_k;
  } else if (rtb_Fcn < LQR_V2_P.Saturation_LowerSat_d) {
    LQR_V2_B.Saturation_j = LQR_V2_P.Saturation_LowerSat_d;
  } else {
    LQR_V2_B.Saturation_j = rtb_Fcn;
  }

  /* End of Saturate: '<S2>/Saturation' */

  /* RelationalOperator: '<S2>/Relational Operator' incorporates:
   *  Constant: '<S2>/Constant7'
   */
  rtb_RelationalOperator1 = (LQR_V2_B.Saturation_j > LQR_V2_P.Constant7_Value);

  /* If: '<S5>/If' */
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
    rtAction = (int8_T)!(LQR_V2_B.Saturation_j > 0.0);
    LQR_V2_DW.If_ActiveSubsystem = rtAction;
  } else {
    rtAction = LQR_V2_DW.If_ActiveSubsystem;
  }

  switch (rtAction) {
   case 0:
    /* Outputs for IfAction SubSystem: '<S5>/If Action Subsystem' incorporates:
     *  ActionPort: '<S6>/Action Port'
     */
    LQR_V2_IfActionSubsystem(LQR_V2_B.Saturation_j, &LQR_V2_B.IfActionSubsystem);
    if (rtmIsMajorTimeStep(LQR_V2_M)) {
      srUpdateBC(LQR_V2_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S5>/If Action Subsystem' */
    break;

   case 1:
    /* Outputs for IfAction SubSystem: '<S5>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S7>/Action Port'
     */
    LQR_V2_IfActionSubsystem(LQR_V2_B.Saturation_j, &LQR_V2_B.IfActionSubsystem1);
    if (rtmIsMajorTimeStep(LQR_V2_M)) {
      srUpdateBC(LQR_V2_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S5>/If Action Subsystem1' */
    break;
  }

  /* End of If: '<S5>/If' */

  /* Product: '<S2>/Product5' */
  LQR_V2_B.Product5 = (real_T)rtb_RelationalOperator1 *
    LQR_V2_B.IfActionSubsystem.In1;

  /* Product: '<S2>/Product6' incorporates:
   *  Constant: '<S2>/Constant8'
   *  Fcn: '<S5>/Fcn'
   *  RelationalOperator: '<S2>/Relational Operator1'
   */
  LQR_V2_B.Product6 = (real_T)(LQR_V2_B.Saturation_j < LQR_V2_P.Constant8_Value)
    * fabs(LQR_V2_B.IfActionSubsystem1.In1);
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
    /* S-Function Block: <S2>/Analog Output */
    {
      {
        ANALOGIOPARM parm;
        parm.mode = (RANGEMODE) LQR_V2_P.AnalogOutput_RangeMode;
        parm.rangeidx = LQR_V2_P.AnalogOutput_VoltRange;
        RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                       &LQR_V2_P.AnalogOutput_Channels, &LQR_V2_B.Product5,
                       &parm);
      }
    }

    /* S-Function Block: <S2>/Analog Output1 */
    {
      {
        ANALOGIOPARM parm;
        parm.mode = (RANGEMODE) LQR_V2_P.AnalogOutput1_RangeMode;
        parm.rangeidx = LQR_V2_P.AnalogOutput1_VoltRange;
        RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                       &LQR_V2_P.AnalogOutput1_Channels, &LQR_V2_B.Product6,
                       &parm);
      }
    }

    /* S-Function Block: <S2>/Analog Input */
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) LQR_V2_P.AnalogInput_RangeMode;
      parm.rangeidx = LQR_V2_P.AnalogInput_VoltRange;
      RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1, &LQR_V2_P.AnalogInput_Channels,
                     &rtb_ManualSwitch, &parm);
    }

    /* S-Function Block: <S2>/Analog Input1 */
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) LQR_V2_P.AnalogInput1_RangeMode;
      parm.rangeidx = LQR_V2_P.AnalogInput1_VoltRange;
      RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1, &LQR_V2_P.AnalogInput1_Channels,
                     &LQR_V2_B.AnalogInput1, &parm);
    }

    /* Sum: '<S3>/Sum of Elements4' incorporates:
     *  Constant: '<S3>/in_max'
     *  Constant: '<S3>/in_min'
     *  Constant: '<S3>/out_max'
     *  Constant: '<S3>/out_min'
     *  Product: '<S3>/Divide'
     *  Product: '<S3>/Product1'
     *  Sum: '<S3>/Sum of Elements1'
     *  Sum: '<S3>/Sum of Elements2'
     *  Sum: '<S3>/Sum of Elements3'
     */
    LQR_V2_B.SumofElements4 = (LQR_V2_P.out_max_Value - LQR_V2_P.out_min_Value) /
      (LQR_V2_P.in_max_Value - LQR_V2_P.in_min_Value) * (rtb_ManualSwitch -
      LQR_V2_P.in_min_Value) + LQR_V2_P.out_min_Value;
  }

  /* Derivative: '<S2>/Derivative2' */
  if ((LQR_V2_DW.TimeStampA >= LQR_V2_M->Timing.t[0]) && (LQR_V2_DW.TimeStampB >=
       LQR_V2_M->Timing.t[0])) {
    LQR_V2_B.Derivative2 = 0.0;
  } else {
    rtb_Fcn = LQR_V2_DW.TimeStampA;
    lastU = &LQR_V2_DW.LastUAtTimeA;
    if (LQR_V2_DW.TimeStampA < LQR_V2_DW.TimeStampB) {
      if (LQR_V2_DW.TimeStampB < LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB;
        lastU = &LQR_V2_DW.LastUAtTimeB;
      }
    } else {
      if (LQR_V2_DW.TimeStampA >= LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB;
        lastU = &LQR_V2_DW.LastUAtTimeB;
      }
    }

    LQR_V2_B.Derivative2 = (LQR_V2_B.TransferFcn2 - *lastU) /
      (LQR_V2_M->Timing.t[0] - rtb_Fcn);
  }

  /* End of Derivative: '<S2>/Derivative2' */

  /* TransferFcn: '<S2>/Transfer Fcn6' */
  LQR_V2_B.TransferFcn6 = 0.0;
  LQR_V2_B.TransferFcn6 += LQR_V2_P.TransferFcn6_C *
    LQR_V2_X.TransferFcn6_CSTATE;

  /* TransferFcn: '<S2>/Transfer Fcn5' */
  LQR_V2_B.TransferFcn5 = 0.0;
  LQR_V2_B.TransferFcn5 += LQR_V2_P.TransferFcn5_C *
    LQR_V2_X.TransferFcn5_CSTATE;
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
    /* ManualSwitch: '<S2>/Manual Switch' incorporates:
     *  Constant: '<S2>/Constant'
     *  Constant: '<S2>/Constant9'
     */
    if (LQR_V2_P.ManualSwitch_CurrentSetting_f == 1) {
      rtb_ManualSwitch = LQR_V2_P.Constant_Value;
    } else {
      rtb_ManualSwitch = LQR_V2_P.Constant9_Value;
    }

    /* End of ManualSwitch: '<S2>/Manual Switch' */

    /* Sum: '<S2>/Add' incorporates:
     *  Constant: '<S2>/Constant3'
     *  Constant: '<S2>/Constant4'
     *  Constant: '<S2>/Constant5'
     *  Product: '<S2>/Product1'
     *  Product: '<S2>/Product2'
     *  Product: '<S2>/Product3'
     *  Sum: '<S2>/Sum of Elements1'
     *  Sum: '<S2>/Sum of Elements2'
     */
    LQR_V2_B.Add = (LQR_V2_B.AnalogInput1 * LQR_V2_B.AnalogInput1 *
                    LQR_V2_P.Constant5_Value + (LQR_V2_B.AnalogInput1 *
      LQR_V2_P.Constant3_Value - LQR_V2_P.Constant4_Value)) - rtb_ManualSwitch;

    /* Sum: '<S2>/Sum of Elements5' incorporates:
     *  Constant: '<S2>/Constant10'
     *  Constant: '<S4>/in_max'
     *  Constant: '<S4>/in_min'
     *  Constant: '<S4>/out_max'
     *  Constant: '<S4>/out_min'
     *  Product: '<S4>/Divide'
     *  Product: '<S4>/Product1'
     *  Sum: '<S4>/Sum of Elements1'
     *  Sum: '<S4>/Sum of Elements2'
     *  Sum: '<S4>/Sum of Elements3'
     *  Sum: '<S4>/Sum of Elements4'
     */
    LQR_V2_B.SumofElements5 = ((LQR_V2_P.out_max_Value_j -
      LQR_V2_P.out_min_Value_f) / (LQR_V2_P.in_max_Value_o -
      LQR_V2_P.in_min_Value_g) * (LQR_V2_B.AnalogInput1 -
      LQR_V2_P.in_min_Value_g) + LQR_V2_P.out_min_Value_f) -
      LQR_V2_P.Constant10_Value;
  }

  /* Derivative: '<S2>/Derivative1' */
  if ((LQR_V2_DW.TimeStampA_f >= LQR_V2_M->Timing.t[0]) &&
      (LQR_V2_DW.TimeStampB_p >= LQR_V2_M->Timing.t[0])) {
    LQR_V2_B.Derivative1 = 0.0;
  } else {
    rtb_Fcn = LQR_V2_DW.TimeStampA_f;
    lastU = &LQR_V2_DW.LastUAtTimeA_f;
    if (LQR_V2_DW.TimeStampA_f < LQR_V2_DW.TimeStampB_p) {
      if (LQR_V2_DW.TimeStampB_p < LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB_p;
        lastU = &LQR_V2_DW.LastUAtTimeB_d;
      }
    } else {
      if (LQR_V2_DW.TimeStampA_f >= LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB_p;
        lastU = &LQR_V2_DW.LastUAtTimeB_d;
      }
    }

    LQR_V2_B.Derivative1 = (LQR_V2_B.TransferFcn5 - *lastU) /
      (LQR_V2_M->Timing.t[0] - rtb_Fcn);
  }

  /* End of Derivative: '<S2>/Derivative1' */

  /* Derivative: '<S2>/Derivative3' */
  if ((LQR_V2_DW.TimeStampA_k >= LQR_V2_M->Timing.t[0]) &&
      (LQR_V2_DW.TimeStampB_i >= LQR_V2_M->Timing.t[0])) {
    LQR_V2_B.Derivative3 = 0.0;
  } else {
    rtb_Fcn = LQR_V2_DW.TimeStampA_k;
    lastU = &LQR_V2_DW.LastUAtTimeA_m;
    if (LQR_V2_DW.TimeStampA_k < LQR_V2_DW.TimeStampB_i) {
      if (LQR_V2_DW.TimeStampB_i < LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB_i;
        lastU = &LQR_V2_DW.LastUAtTimeB_m;
      }
    } else {
      if (LQR_V2_DW.TimeStampA_k >= LQR_V2_M->Timing.t[0]) {
        rtb_Fcn = LQR_V2_DW.TimeStampB_i;
        lastU = &LQR_V2_DW.LastUAtTimeB_m;
      }
    }

    LQR_V2_B.Derivative3 = (LQR_V2_B.TransferFcn3 - *lastU) /
      (LQR_V2_M->Timing.t[0] - rtb_Fcn);
  }

  /* End of Derivative: '<S2>/Derivative3' */
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
  }
}

/* Model update function */
void LQR_V2_update(void)
{
  real_T *lastU;

  /* Update for Derivative: '<S2>/Derivative2' */
  if (LQR_V2_DW.TimeStampA == (rtInf)) {
    LQR_V2_DW.TimeStampA = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA;
  } else if (LQR_V2_DW.TimeStampB == (rtInf)) {
    LQR_V2_DW.TimeStampB = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB;
  } else if (LQR_V2_DW.TimeStampA < LQR_V2_DW.TimeStampB) {
    LQR_V2_DW.TimeStampA = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA;
  } else {
    LQR_V2_DW.TimeStampB = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB;
  }

  *lastU = LQR_V2_B.TransferFcn2;

  /* End of Update for Derivative: '<S2>/Derivative2' */

  /* Update for Derivative: '<S2>/Derivative1' */
  if (LQR_V2_DW.TimeStampA_f == (rtInf)) {
    LQR_V2_DW.TimeStampA_f = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA_f;
  } else if (LQR_V2_DW.TimeStampB_p == (rtInf)) {
    LQR_V2_DW.TimeStampB_p = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB_d;
  } else if (LQR_V2_DW.TimeStampA_f < LQR_V2_DW.TimeStampB_p) {
    LQR_V2_DW.TimeStampA_f = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA_f;
  } else {
    LQR_V2_DW.TimeStampB_p = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB_d;
  }

  *lastU = LQR_V2_B.TransferFcn5;

  /* End of Update for Derivative: '<S2>/Derivative1' */

  /* Update for Derivative: '<S2>/Derivative3' */
  if (LQR_V2_DW.TimeStampA_k == (rtInf)) {
    LQR_V2_DW.TimeStampA_k = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA_m;
  } else if (LQR_V2_DW.TimeStampB_i == (rtInf)) {
    LQR_V2_DW.TimeStampB_i = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB_m;
  } else if (LQR_V2_DW.TimeStampA_k < LQR_V2_DW.TimeStampB_i) {
    LQR_V2_DW.TimeStampA_k = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeA_m;
  } else {
    LQR_V2_DW.TimeStampB_i = LQR_V2_M->Timing.t[0];
    lastU = &LQR_V2_DW.LastUAtTimeB_m;
  }

  *lastU = LQR_V2_B.TransferFcn3;

  /* End of Update for Derivative: '<S2>/Derivative3' */
  if (rtmIsMajorTimeStep(LQR_V2_M)) {
    rt_ertODEUpdateContinuousStates(&LQR_V2_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++LQR_V2_M->Timing.clockTick0)) {
    ++LQR_V2_M->Timing.clockTickH0;
  }

  LQR_V2_M->Timing.t[0] = rtsiGetSolverStopTime(&LQR_V2_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++LQR_V2_M->Timing.clockTick1)) {
      ++LQR_V2_M->Timing.clockTickH1;
    }

    LQR_V2_M->Timing.t[1] = LQR_V2_M->Timing.clockTick1 *
      LQR_V2_M->Timing.stepSize1 + LQR_V2_M->Timing.clockTickH1 *
      LQR_V2_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Derivatives for root system: '<Root>' */
void LQR_V2_derivatives(void)
{
  XDot_LQR_V2_T *_rtXdot;
  _rtXdot = ((XDot_LQR_V2_T *) LQR_V2_M->ModelData.derivs);

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn3' */
  _rtXdot->TransferFcn3_CSTATE = 0.0;
  _rtXdot->TransferFcn3_CSTATE += LQR_V2_P.TransferFcn3_A *
    LQR_V2_X.TransferFcn3_CSTATE;
  _rtXdot->TransferFcn3_CSTATE += LQR_V2_B.Add;

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn4' */
  _rtXdot->TransferFcn4_CSTATE = 0.0;
  _rtXdot->TransferFcn4_CSTATE += LQR_V2_P.TransferFcn4_A *
    LQR_V2_X.TransferFcn4_CSTATE;
  _rtXdot->TransferFcn4_CSTATE += LQR_V2_B.Derivative3;

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn2' */
  _rtXdot->TransferFcn2_CSTATE = 0.0;
  _rtXdot->TransferFcn2_CSTATE += LQR_V2_P.TransferFcn2_A *
    LQR_V2_X.TransferFcn2_CSTATE;
  _rtXdot->TransferFcn2_CSTATE += LQR_V2_B.SumofElements4;

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn1' */
  _rtXdot->TransferFcn1_CSTATE = 0.0;
  _rtXdot->TransferFcn1_CSTATE += LQR_V2_P.TransferFcn1_A *
    LQR_V2_X.TransferFcn1_CSTATE;
  _rtXdot->TransferFcn1_CSTATE += LQR_V2_B.Derivative2;

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn6' */
  _rtXdot->TransferFcn6_CSTATE = 0.0;
  _rtXdot->TransferFcn6_CSTATE += LQR_V2_P.TransferFcn6_A *
    LQR_V2_X.TransferFcn6_CSTATE;
  _rtXdot->TransferFcn6_CSTATE += LQR_V2_B.Derivative1;

  /* Derivatives for TransferFcn: '<S2>/Transfer Fcn5' */
  _rtXdot->TransferFcn5_CSTATE = 0.0;
  _rtXdot->TransferFcn5_CSTATE += LQR_V2_P.TransferFcn5_A *
    LQR_V2_X.TransferFcn5_CSTATE;
  _rtXdot->TransferFcn5_CSTATE += LQR_V2_B.SumofElements5;
}

/* Model initialize function */
void LQR_V2_initialize(void)
{
  /* Start for If: '<S5>/If' */
  LQR_V2_DW.If_ActiveSubsystem = -1;

  /* S-Function Block: <S2>/Analog Output */

  /* no initial value should be set */

  /* S-Function Block: <S2>/Analog Output1 */

  /* no initial value should be set */

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn3' */
  LQR_V2_X.TransferFcn3_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn4' */
  LQR_V2_X.TransferFcn4_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn2' */
  LQR_V2_X.TransferFcn2_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn1' */
  LQR_V2_X.TransferFcn1_CSTATE = 0.0;

  /* InitializeConditions for Derivative: '<S2>/Derivative2' */
  LQR_V2_DW.TimeStampA = (rtInf);
  LQR_V2_DW.TimeStampB = (rtInf);

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn6' */
  LQR_V2_X.TransferFcn6_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S2>/Transfer Fcn5' */
  LQR_V2_X.TransferFcn5_CSTATE = 0.0;

  /* InitializeConditions for Derivative: '<S2>/Derivative1' */
  LQR_V2_DW.TimeStampA_f = (rtInf);
  LQR_V2_DW.TimeStampB_p = (rtInf);

  /* InitializeConditions for Derivative: '<S2>/Derivative3' */
  LQR_V2_DW.TimeStampA_k = (rtInf);
  LQR_V2_DW.TimeStampB_i = (rtInf);
}

/* Model terminate function */
void LQR_V2_terminate(void)
{
  /* S-Function Block: <S2>/Analog Output */

  /* no final value should be set */

  /* S-Function Block: <S2>/Analog Output1 */

  /* no final value should be set */
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  LQR_V2_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  LQR_V2_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  LQR_V2_initialize();
}

void MdlTerminate(void)
{
  LQR_V2_terminate();
}

/* Registration function */
RT_MODEL_LQR_V2_T *LQR_V2(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)LQR_V2_M, 0,
                sizeof(RT_MODEL_LQR_V2_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&LQR_V2_M->solverInfo, &LQR_V2_M->Timing.simTimeStep);
    rtsiSetTPtr(&LQR_V2_M->solverInfo, &rtmGetTPtr(LQR_V2_M));
    rtsiSetStepSizePtr(&LQR_V2_M->solverInfo, &LQR_V2_M->Timing.stepSize0);
    rtsiSetdXPtr(&LQR_V2_M->solverInfo, &LQR_V2_M->ModelData.derivs);
    rtsiSetContStatesPtr(&LQR_V2_M->solverInfo, (real_T **)
                         &LQR_V2_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&LQR_V2_M->solverInfo,
      &LQR_V2_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&LQR_V2_M->solverInfo,
      &LQR_V2_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&LQR_V2_M->solverInfo,
      &LQR_V2_M->ModelData.periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&LQR_V2_M->solverInfo,
      &LQR_V2_M->ModelData.periodicContStateRanges);
    rtsiSetErrorStatusPtr(&LQR_V2_M->solverInfo, (&rtmGetErrorStatus(LQR_V2_M)));
    rtsiSetRTModelPtr(&LQR_V2_M->solverInfo, LQR_V2_M);
  }

  rtsiSetSimTimeStep(&LQR_V2_M->solverInfo, MAJOR_TIME_STEP);
  LQR_V2_M->ModelData.intgData.y = LQR_V2_M->ModelData.odeY;
  LQR_V2_M->ModelData.intgData.f[0] = LQR_V2_M->ModelData.odeF[0];
  LQR_V2_M->ModelData.intgData.f[1] = LQR_V2_M->ModelData.odeF[1];
  LQR_V2_M->ModelData.intgData.f[2] = LQR_V2_M->ModelData.odeF[2];
  LQR_V2_M->ModelData.contStates = ((real_T *) &LQR_V2_X);
  rtsiSetSolverData(&LQR_V2_M->solverInfo, (void *)&LQR_V2_M->ModelData.intgData);
  rtsiSetSolverName(&LQR_V2_M->solverInfo,"ode3");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = LQR_V2_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    LQR_V2_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    LQR_V2_M->Timing.sampleTimes = (&LQR_V2_M->Timing.sampleTimesArray[0]);
    LQR_V2_M->Timing.offsetTimes = (&LQR_V2_M->Timing.offsetTimesArray[0]);

    /* task periods */
    LQR_V2_M->Timing.sampleTimes[0] = (0.0);
    LQR_V2_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
    LQR_V2_M->Timing.offsetTimes[0] = (0.0);
    LQR_V2_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(LQR_V2_M, &LQR_V2_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = LQR_V2_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    LQR_V2_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(LQR_V2_M, -1);
  LQR_V2_M->Timing.stepSize0 = 0.001;
  LQR_V2_M->Timing.stepSize1 = 0.001;

  /* External mode info */
  LQR_V2_M->Sizes.checksums[0] = (3116982799U);
  LQR_V2_M->Sizes.checksums[1] = (608063096U);
  LQR_V2_M->Sizes.checksums[2] = (964152682U);
  LQR_V2_M->Sizes.checksums[3] = (2580546118U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[5];
    LQR_V2_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = (sysRanDType *)
      &LQR_V2_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC;
    systemRan[4] = (sysRanDType *)
      &LQR_V2_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC;
    rteiSetModelMappingInfoPtr(LQR_V2_M->extModeInfo,
      &LQR_V2_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(LQR_V2_M->extModeInfo, LQR_V2_M->Sizes.checksums);
    rteiSetTPtr(LQR_V2_M->extModeInfo, rtmGetTPtr(LQR_V2_M));
  }

  LQR_V2_M->solverInfoPtr = (&LQR_V2_M->solverInfo);
  LQR_V2_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&LQR_V2_M->solverInfo, 0.001);
  rtsiSetSolverMode(&LQR_V2_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  LQR_V2_M->ModelData.blockIO = ((void *) &LQR_V2_B);
  (void) memset(((void *) &LQR_V2_B), 0,
                sizeof(B_LQR_V2_T));

  /* parameters */
  LQR_V2_M->ModelData.defaultParam = ((real_T *)&LQR_V2_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &LQR_V2_X;
    LQR_V2_M->ModelData.contStates = (x);
    (void) memset((void *)&LQR_V2_X, 0,
                  sizeof(X_LQR_V2_T));
  }

  /* states (dwork) */
  LQR_V2_M->ModelData.dwork = ((void *) &LQR_V2_DW);
  (void) memset((void *)&LQR_V2_DW, 0,
                sizeof(DW_LQR_V2_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    LQR_V2_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  LQR_V2_M->Sizes.numContStates = (6); /* Number of continuous states */
  LQR_V2_M->Sizes.numPeriodicContStates = (0);/* Number of periodic continuous states */
  LQR_V2_M->Sizes.numY = (0);          /* Number of model outputs */
  LQR_V2_M->Sizes.numU = (0);          /* Number of model inputs */
  LQR_V2_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  LQR_V2_M->Sizes.numSampTimes = (2);  /* Number of sample times */
  LQR_V2_M->Sizes.numBlocks = (115);   /* Number of blocks */
  LQR_V2_M->Sizes.numBlockIO = (22);   /* Number of block outputs */
  LQR_V2_M->Sizes.numBlockPrms = (66); /* Sum of parameter "widths" */
  return LQR_V2_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
