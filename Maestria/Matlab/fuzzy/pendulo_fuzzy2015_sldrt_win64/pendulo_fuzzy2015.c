/*
 * pendulo_fuzzy2015.c
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
#include "pendulo_fuzzy2015_dt.h"

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
B_pendulo_fuzzy2015_T pendulo_fuzzy2015_B;

/* Continuous states */
X_pendulo_fuzzy2015_T pendulo_fuzzy2015_X;

/* Block states (auto storage) */
DW_pendulo_fuzzy2015_T pendulo_fuzzy2015_DW;

/* Real-time model */
RT_MODEL_pendulo_fuzzy2015_T pendulo_fuzzy2015_M_;
RT_MODEL_pendulo_fuzzy2015_T *const pendulo_fuzzy2015_M = &pendulo_fuzzy2015_M_;

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
  int_T nXc = 4;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  pendulo_fuzzy2015_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  pendulo_fuzzy2015_output();
  pendulo_fuzzy2015_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  pendulo_fuzzy2015_output();
  pendulo_fuzzy2015_derivatives();

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
 *    '<S54>/If Action Subsystem'
 *    '<S54>/If Action Subsystem1'
 */
void pendulo_fuzzy2015_IfActionSubsystem(real_T rtu_In1,
  B_IfActionSubsystem_pendulo_fuzzy2015_T *localB)
{
  /* Inport: '<S55>/In1' */
  localB->In1 = rtu_In1;
}

/* Model output function */
void pendulo_fuzzy2015_output(void)
{
  /* local block i/o variables */
  real_T rtb_AnalogInput;
  real_T rtb_AnalogInput1;
  real_T *lastU;
  real_T rtb_andorMethod_l;
  real_T rtb_andorMethod_a;
  real_T rtb_andorMethod;
  real_T rtb_Exponentialgaussmf;
  real_T rtb_Exponentialgaussmf_n;
  real_T rtb_Weighting;
  real_T rtb_Exponentialgaussmf_ho;
  real_T rtb_Weighting_l;
  real_T rtb_Exponentialgaussmf_p;
  real_T rtb_Weighting_jw;
  real_T rtb_Weighting_pd;
  real_T rtb_Gain1;
  real_T rtb_Weighting_c;
  real_T rtb_Weighting_gl;
  real_T rtb_Weighting_e;
  real_T rtb_Weighting_pj;
  real_T rtb_Weighting_b;
  real_T rtb_Weighting_bh;
  real_T rtb_Weighting_go;
  real_T rtb_Weighting_p;
  int8_T rtAction;
  boolean_T rtb_RelationalOperator1;
  real_T tmpForInput[16];
  int32_T i;
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    /* set solver stop time */
    if (!(pendulo_fuzzy2015_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&pendulo_fuzzy2015_M->solverInfo,
                            ((pendulo_fuzzy2015_M->Timing.clockTickH0 + 1) *
        pendulo_fuzzy2015_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&pendulo_fuzzy2015_M->solverInfo,
                            ((pendulo_fuzzy2015_M->Timing.clockTick0 + 1) *
        pendulo_fuzzy2015_M->Timing.stepSize0 +
        pendulo_fuzzy2015_M->Timing.clockTickH0 *
        pendulo_fuzzy2015_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(pendulo_fuzzy2015_M)) {
    pendulo_fuzzy2015_M->Timing.t[0] = rtsiGetT(&pendulo_fuzzy2015_M->solverInfo);
  }

  /* Reset subsysRan breadcrumbs */
  srClearBC(pendulo_fuzzy2015_DW.ActionOne_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(pendulo_fuzzy2015_DW.Actionu1_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(pendulo_fuzzy2015_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC);

  /* TransferFcn: '<S4>/Transfer Fcn3' */
  pendulo_fuzzy2015_B.TransferFcn3 = 0.0;
  pendulo_fuzzy2015_B.TransferFcn3 += pendulo_fuzzy2015_P.TransferFcn3_C *
    pendulo_fuzzy2015_X.TransferFcn3_CSTATE;

  /* Product: '<S30>/Product (gaussmf)' incorporates:
   *  Constant: '<S30>/mu'
   *  Constant: '<S30>/sigma'
   *  Sum: '<S30>/Sum'
   */
  rtb_andorMethod_l = (pendulo_fuzzy2015_B.TransferFcn3 -
                       pendulo_fuzzy2015_P.mf1_mu) /
    pendulo_fuzzy2015_P.mf1_sigma;

  /* Math: '<S30>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S30>/Gain'
   *  Math: '<S30>/Squaring (gaussmf)'
   *
   * About '<S30>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_andorMethod_l = exp(rtb_andorMethod_l * rtb_andorMethod_l *
    pendulo_fuzzy2015_P.Gain_Gain);

  /* TransferFcn: '<S4>/Transfer Fcn4' */
  pendulo_fuzzy2015_B.TransferFcn4 = 0.0;
  pendulo_fuzzy2015_B.TransferFcn4 += pendulo_fuzzy2015_P.TransferFcn4_C *
    pendulo_fuzzy2015_X.TransferFcn4_CSTATE;

  /* Product: '<S32>/Product (gaussmf)' incorporates:
   *  Constant: '<S32>/mu'
   *  Constant: '<S32>/sigma'
   *  Sum: '<S32>/Sum'
   */
  rtb_andorMethod_a = (pendulo_fuzzy2015_B.TransferFcn4 -
                       pendulo_fuzzy2015_P.mf1_mu_f) /
    pendulo_fuzzy2015_P.mf1_sigma_i;

  /* Math: '<S32>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S32>/Gain'
   *  Math: '<S32>/Squaring (gaussmf)'
   *
   * About '<S32>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_andorMethod_a = exp(rtb_andorMethod_a * rtb_andorMethod_a *
    pendulo_fuzzy2015_P.Gain_Gain_a);

  /* TransferFcn: '<S4>/Transfer Fcn2' */
  pendulo_fuzzy2015_B.TransferFcn2 = 0.0;
  pendulo_fuzzy2015_B.TransferFcn2 += pendulo_fuzzy2015_P.TransferFcn2_C *
    pendulo_fuzzy2015_X.TransferFcn2_CSTATE;

  /* Product: '<S34>/Product (gaussmf)' incorporates:
   *  Constant: '<S34>/mu'
   *  Constant: '<S34>/sigma'
   *  Sum: '<S34>/Sum'
   */
  rtb_andorMethod = (pendulo_fuzzy2015_B.TransferFcn2 -
                     pendulo_fuzzy2015_P.mf1_mu_a) /
    pendulo_fuzzy2015_P.mf1_sigma_c;

  /* Math: '<S34>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S34>/Gain'
   *  Math: '<S34>/Squaring (gaussmf)'
   *
   * About '<S34>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_andorMethod = exp(rtb_andorMethod * rtb_andorMethod *
                        pendulo_fuzzy2015_P.Gain_Gain_p);

  /* TransferFcn: '<S4>/Transfer Fcn1' */
  pendulo_fuzzy2015_B.TransferFcn1 = 0.0;
  pendulo_fuzzy2015_B.TransferFcn1 += pendulo_fuzzy2015_P.TransferFcn1_C *
    pendulo_fuzzy2015_X.TransferFcn1_CSTATE;

  /* Product: '<S36>/Product (gaussmf)' incorporates:
   *  Constant: '<S36>/mu'
   *  Constant: '<S36>/sigma'
   *  Sum: '<S36>/Sum'
   */
  rtb_Exponentialgaussmf = (pendulo_fuzzy2015_B.TransferFcn1 -
    pendulo_fuzzy2015_P.mf1_mu_k) / pendulo_fuzzy2015_P.mf1_sigma_f;

  /* Math: '<S36>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S36>/Gain'
   *  Math: '<S36>/Squaring (gaussmf)'
   *
   * About '<S36>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_Exponentialgaussmf = exp(rtb_Exponentialgaussmf * rtb_Exponentialgaussmf *
    pendulo_fuzzy2015_P.Gain_Gain_f);

  /* Product: '<S7>/Weighting' incorporates:
   *  Constant: '<S7>/Weight'
   *  Product: '<S7>/andorMethod'
   */
  rtb_Weighting = rtb_andorMethod_l * rtb_andorMethod_a * rtb_andorMethod *
    rtb_Exponentialgaussmf * pendulo_fuzzy2015_P.Weight_Value;

  /* Product: '<S37>/Product (gaussmf)' incorporates:
   *  Constant: '<S37>/mu'
   *  Constant: '<S37>/sigma'
   *  Sum: '<S37>/Sum'
   */
  rtb_Exponentialgaussmf_n = (pendulo_fuzzy2015_B.TransferFcn1 -
    pendulo_fuzzy2015_P.mf2_mu) / pendulo_fuzzy2015_P.mf2_sigma;

  /* Math: '<S37>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S37>/Gain'
   *  Math: '<S37>/Squaring (gaussmf)'
   *
   * About '<S37>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_Exponentialgaussmf_n = exp(rtb_Exponentialgaussmf_n *
    rtb_Exponentialgaussmf_n * pendulo_fuzzy2015_P.Gain_Gain_o);

  /* Product: '<S15>/Weighting' incorporates:
   *  Constant: '<S15>/Weight'
   *  Product: '<S15>/andorMethod'
   */
  rtb_Weighting_l = rtb_andorMethod_l * rtb_andorMethod_a * rtb_andorMethod *
    rtb_Exponentialgaussmf_n * pendulo_fuzzy2015_P.Weight_Value_n;

  /* Product: '<S35>/Product (gaussmf)' incorporates:
   *  Constant: '<S35>/mu'
   *  Constant: '<S35>/sigma'
   *  Sum: '<S35>/Sum'
   */
  rtb_Exponentialgaussmf_ho = (pendulo_fuzzy2015_B.TransferFcn2 -
    pendulo_fuzzy2015_P.mf2_mu_h) / pendulo_fuzzy2015_P.mf2_sigma_b;

  /* Math: '<S35>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S35>/Gain'
   *  Math: '<S35>/Squaring (gaussmf)'
   *
   * About '<S35>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_Exponentialgaussmf_ho = exp(rtb_Exponentialgaussmf_ho *
    rtb_Exponentialgaussmf_ho * pendulo_fuzzy2015_P.Gain_Gain_fc);

  /* Product: '<S16>/Weighting' incorporates:
   *  Constant: '<S16>/Weight'
   *  Product: '<S16>/andorMethod'
   */
  rtb_Weighting_jw = rtb_andorMethod_l * rtb_andorMethod_a *
    rtb_Exponentialgaussmf_ho * rtb_Exponentialgaussmf *
    pendulo_fuzzy2015_P.Weight_Value_l;

  /* Product: '<S17>/Weighting' incorporates:
   *  Constant: '<S17>/Weight'
   *  Product: '<S17>/andorMethod'
   */
  rtb_Weighting_pd = rtb_andorMethod_l * rtb_andorMethod_a *
    rtb_Exponentialgaussmf_ho * rtb_Exponentialgaussmf_n *
    pendulo_fuzzy2015_P.Weight_Value_g;

  /* Product: '<S33>/Product (gaussmf)' incorporates:
   *  Constant: '<S33>/mu'
   *  Constant: '<S33>/sigma'
   *  Sum: '<S33>/Sum'
   */
  rtb_Exponentialgaussmf_p = (pendulo_fuzzy2015_B.TransferFcn4 -
    pendulo_fuzzy2015_P.mf2_mu_f) / pendulo_fuzzy2015_P.mf2_sigma_o;

  /* Math: '<S33>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S33>/Gain'
   *  Math: '<S33>/Squaring (gaussmf)'
   *
   * About '<S33>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_Exponentialgaussmf_p = exp(rtb_Exponentialgaussmf_p *
    rtb_Exponentialgaussmf_p * pendulo_fuzzy2015_P.Gain_Gain_i);

  /* Product: '<S18>/Weighting' incorporates:
   *  Constant: '<S18>/Weight'
   *  Product: '<S18>/andorMethod'
   */
  rtb_Weighting_c = rtb_andorMethod_l * rtb_Exponentialgaussmf_p *
    rtb_andorMethod * rtb_Exponentialgaussmf *
    pendulo_fuzzy2015_P.Weight_Value_e;

  /* Product: '<S19>/Weighting' incorporates:
   *  Constant: '<S19>/Weight'
   *  Product: '<S19>/andorMethod'
   */
  rtb_Weighting_gl = rtb_andorMethod_l * rtb_Exponentialgaussmf_p *
    rtb_andorMethod * rtb_Exponentialgaussmf_n *
    pendulo_fuzzy2015_P.Weight_Value_ed;

  /* Product: '<S20>/Weighting' incorporates:
   *  Constant: '<S20>/Weight'
   *  Product: '<S20>/andorMethod'
   */
  rtb_Weighting_e = rtb_andorMethod_l * rtb_Exponentialgaussmf_p *
    rtb_Exponentialgaussmf_ho * rtb_Exponentialgaussmf *
    pendulo_fuzzy2015_P.Weight_Value_i;

  /* Product: '<S21>/andorMethod' */
  rtb_andorMethod_l *= rtb_Exponentialgaussmf_p;
  rtb_andorMethod_l *= rtb_Exponentialgaussmf_ho;
  rtb_andorMethod_l *= rtb_Exponentialgaussmf_n;

  /* Product: '<S21>/Weighting' incorporates:
   *  Constant: '<S21>/Weight'
   */
  rtb_Weighting_pj = pendulo_fuzzy2015_P.Weight_Value_h * rtb_andorMethod_l;

  /* Product: '<S31>/Product (gaussmf)' incorporates:
   *  Constant: '<S31>/mu'
   *  Constant: '<S31>/sigma'
   *  Sum: '<S31>/Sum'
   */
  rtb_Gain1 = (pendulo_fuzzy2015_B.TransferFcn3 - pendulo_fuzzy2015_P.mf2_mu_n) /
    pendulo_fuzzy2015_P.mf2_sigma_j;

  /* Math: '<S31>/Exponential (gaussmf)' incorporates:
   *  Gain: '<S31>/Gain'
   *  Math: '<S31>/Squaring (gaussmf)'
   *
   * About '<S31>/Exponential (gaussmf)':
   *  Operator: exp
   */
  rtb_Gain1 = exp(rtb_Gain1 * rtb_Gain1 * pendulo_fuzzy2015_P.Gain_Gain_od);

  /* Product: '<S22>/Weighting' incorporates:
   *  Constant: '<S22>/Weight'
   *  Product: '<S22>/andorMethod'
   */
  rtb_Weighting_b = rtb_Gain1 * rtb_andorMethod_a * rtb_andorMethod *
    rtb_Exponentialgaussmf * pendulo_fuzzy2015_P.Weight_Value_b;

  /* Product: '<S8>/Weighting' incorporates:
   *  Constant: '<S8>/Weight'
   *  Product: '<S8>/andorMethod'
   */
  rtb_Weighting_bh = rtb_Gain1 * rtb_andorMethod_a * rtb_andorMethod *
    rtb_Exponentialgaussmf_n * pendulo_fuzzy2015_P.Weight_Value_gk;

  /* Product: '<S9>/Weighting' incorporates:
   *  Constant: '<S9>/Weight'
   *  Product: '<S9>/andorMethod'
   */
  rtb_Weighting_go = rtb_Gain1 * rtb_andorMethod_a * rtb_Exponentialgaussmf_ho *
    rtb_Exponentialgaussmf * pendulo_fuzzy2015_P.Weight_Value_k;

  /* Product: '<S10>/Weighting' incorporates:
   *  Constant: '<S10>/Weight'
   *  Product: '<S10>/andorMethod'
   */
  rtb_andorMethod_l = rtb_Gain1 * rtb_andorMethod_a * rtb_Exponentialgaussmf_ho *
    rtb_Exponentialgaussmf_n * pendulo_fuzzy2015_P.Weight_Value_m;

  /* Product: '<S11>/Weighting' incorporates:
   *  Constant: '<S11>/Weight'
   *  Product: '<S11>/andorMethod'
   */
  rtb_Weighting_p = rtb_Gain1 * rtb_Exponentialgaussmf_p * rtb_andorMethod *
    rtb_Exponentialgaussmf * pendulo_fuzzy2015_P.Weight_Value_k4;

  /* Product: '<S12>/Weighting' incorporates:
   *  Constant: '<S12>/Weight'
   *  Product: '<S12>/andorMethod'
   */
  rtb_andorMethod_a = rtb_Gain1 * rtb_Exponentialgaussmf_p * rtb_andorMethod *
    rtb_Exponentialgaussmf_n * pendulo_fuzzy2015_P.Weight_Value_nw;

  /* Product: '<S13>/Weighting' incorporates:
   *  Constant: '<S13>/Weight'
   *  Product: '<S13>/andorMethod'
   */
  rtb_andorMethod = rtb_Gain1 * rtb_Exponentialgaussmf_p *
    rtb_Exponentialgaussmf_ho * rtb_Exponentialgaussmf *
    pendulo_fuzzy2015_P.Weight_Value_gz;

  /* Product: '<S14>/andorMethod' */
  rtb_Gain1 *= rtb_Exponentialgaussmf_p;
  rtb_Gain1 *= rtb_Exponentialgaussmf_ho;
  rtb_Gain1 *= rtb_Exponentialgaussmf_n;

  /* Product: '<S14>/Weighting' incorporates:
   *  Constant: '<S14>/Weight'
   */
  rtb_Exponentialgaussmf_n = pendulo_fuzzy2015_P.Weight_Value_ew * rtb_Gain1;

  /* Sum: '<S5>/Total Firing Strength' */
  rtb_Exponentialgaussmf_ho = ((((((((((((((rtb_Weighting + rtb_Weighting_l) +
    rtb_Weighting_jw) + rtb_Weighting_pd) + rtb_Weighting_c) + rtb_Weighting_gl)
    + rtb_Weighting_e) + rtb_Weighting_pj) + rtb_Weighting_b) + rtb_Weighting_bh)
    + rtb_Weighting_go) + rtb_andorMethod_l) + rtb_Weighting_p) +
    rtb_andorMethod_a) + rtb_andorMethod) + rtb_Exponentialgaussmf_n;

  /* If: '<S6>/If' incorporates:
   *  Constant: '<S28>/One'
   *  Inport: '<S29>/u1'
   */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    rtAction = (int8_T)!(rtb_Exponentialgaussmf_ho < 0.0);
    pendulo_fuzzy2015_DW.If_ActiveSubsystem = rtAction;
  } else {
    rtAction = pendulo_fuzzy2015_DW.If_ActiveSubsystem;
  }

  switch (rtAction) {
   case 0:
    /* Outputs for IfAction SubSystem: '<S6>/Action: One' incorporates:
     *  ActionPort: '<S28>/Action Port'
     */
    if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
      pendulo_fuzzy2015_B.Merge = pendulo_fuzzy2015_P.One_Value;
    }

    if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
      srUpdateBC(pendulo_fuzzy2015_DW.ActionOne_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S6>/Action: One' */
    break;

   case 1:
    /* Outputs for IfAction SubSystem: '<S6>/Action: u1' incorporates:
     *  ActionPort: '<S29>/Action Port'
     */
    pendulo_fuzzy2015_B.Merge = rtb_Exponentialgaussmf_ho;
    if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
      srUpdateBC(pendulo_fuzzy2015_DW.Actionu1_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S6>/Action: u1' */
    break;
  }

  /* End of If: '<S6>/If' */

  /* Switch: '<S5>/Switch' incorporates:
   *  Constant: '<S5>/MidRange'
   *  Constant: '<S5>/Zero'
   *  Product: '<S6>/Product'
   *  RelationalOperator: '<S5>/Zero Firing Strength?'
   */
  if ((rtb_Exponentialgaussmf_ho > pendulo_fuzzy2015_P.Zero_Value) >=
      pendulo_fuzzy2015_P.Switch_Threshold) {
    /* Product: '<S7>/impMethod' incorporates:
     *  Constant: '<S38>/Constant Coeff'
     *  Constant: '<S38>/Linear Coeff'
     *  Product: '<S38>/Prod1'
     *  Sum: '<S38>/Sum1'
     *  Sum: '<S38>/Sum_1'
     */
    rtb_Weighting *= (((pendulo_fuzzy2015_P.mf1_a[0] *
                        pendulo_fuzzy2015_B.TransferFcn3 +
                        pendulo_fuzzy2015_P.mf1_a[1] *
                        pendulo_fuzzy2015_B.TransferFcn4) +
                       pendulo_fuzzy2015_P.mf1_a[2] *
                       pendulo_fuzzy2015_B.TransferFcn2) +
                      pendulo_fuzzy2015_P.mf1_a[3] *
                      pendulo_fuzzy2015_B.TransferFcn1) +
      pendulo_fuzzy2015_P.mf1_b;

    /* Sum: '<S6>/Sum1' incorporates:
     *  Constant: '<S39>/Constant Coeff'
     *  Constant: '<S39>/Linear Coeff'
     *  Constant: '<S40>/Constant Coeff'
     *  Constant: '<S40>/Linear Coeff'
     *  Constant: '<S41>/Constant Coeff'
     *  Constant: '<S41>/Linear Coeff'
     *  Constant: '<S42>/Constant Coeff'
     *  Constant: '<S42>/Linear Coeff'
     *  Constant: '<S43>/Constant Coeff'
     *  Constant: '<S43>/Linear Coeff'
     *  Constant: '<S44>/Constant Coeff'
     *  Constant: '<S44>/Linear Coeff'
     *  Constant: '<S45>/Constant Coeff'
     *  Constant: '<S45>/Linear Coeff'
     *  Constant: '<S46>/Constant Coeff'
     *  Constant: '<S46>/Linear Coeff'
     *  Constant: '<S47>/Constant Coeff'
     *  Constant: '<S47>/Linear Coeff'
     *  Constant: '<S48>/Constant Coeff'
     *  Constant: '<S48>/Linear Coeff'
     *  Constant: '<S49>/Constant Coeff'
     *  Constant: '<S49>/Linear Coeff'
     *  Constant: '<S50>/Constant Coeff'
     *  Constant: '<S50>/Linear Coeff'
     *  Constant: '<S51>/Constant Coeff'
     *  Constant: '<S51>/Linear Coeff'
     *  Constant: '<S52>/Constant Coeff'
     *  Constant: '<S52>/Linear Coeff'
     *  Constant: '<S53>/Constant Coeff'
     *  Constant: '<S53>/Linear Coeff'
     *  Product: '<S10>/impMethod'
     *  Product: '<S11>/impMethod'
     *  Product: '<S12>/impMethod'
     *  Product: '<S13>/impMethod'
     *  Product: '<S14>/impMethod'
     *  Product: '<S15>/impMethod'
     *  Product: '<S16>/impMethod'
     *  Product: '<S17>/impMethod'
     *  Product: '<S18>/impMethod'
     *  Product: '<S19>/impMethod'
     *  Product: '<S20>/impMethod'
     *  Product: '<S21>/impMethod'
     *  Product: '<S22>/impMethod'
     *  Product: '<S39>/Prod1'
     *  Product: '<S40>/Prod1'
     *  Product: '<S41>/Prod1'
     *  Product: '<S42>/Prod1'
     *  Product: '<S43>/Prod1'
     *  Product: '<S44>/Prod1'
     *  Product: '<S45>/Prod1'
     *  Product: '<S46>/Prod1'
     *  Product: '<S47>/Prod1'
     *  Product: '<S48>/Prod1'
     *  Product: '<S49>/Prod1'
     *  Product: '<S50>/Prod1'
     *  Product: '<S51>/Prod1'
     *  Product: '<S52>/Prod1'
     *  Product: '<S53>/Prod1'
     *  Product: '<S8>/impMethod'
     *  Product: '<S9>/impMethod'
     *  Sum: '<S39>/Sum1'
     *  Sum: '<S39>/Sum_1'
     *  Sum: '<S40>/Sum1'
     *  Sum: '<S40>/Sum_1'
     *  Sum: '<S41>/Sum1'
     *  Sum: '<S41>/Sum_1'
     *  Sum: '<S42>/Sum1'
     *  Sum: '<S42>/Sum_1'
     *  Sum: '<S43>/Sum1'
     *  Sum: '<S43>/Sum_1'
     *  Sum: '<S44>/Sum1'
     *  Sum: '<S44>/Sum_1'
     *  Sum: '<S45>/Sum1'
     *  Sum: '<S45>/Sum_1'
     *  Sum: '<S46>/Sum1'
     *  Sum: '<S46>/Sum_1'
     *  Sum: '<S47>/Sum1'
     *  Sum: '<S47>/Sum_1'
     *  Sum: '<S48>/Sum1'
     *  Sum: '<S48>/Sum_1'
     *  Sum: '<S49>/Sum1'
     *  Sum: '<S49>/Sum_1'
     *  Sum: '<S50>/Sum1'
     *  Sum: '<S50>/Sum_1'
     *  Sum: '<S51>/Sum1'
     *  Sum: '<S51>/Sum_1'
     *  Sum: '<S52>/Sum1'
     *  Sum: '<S52>/Sum_1'
     *  Sum: '<S53>/Sum1'
     *  Sum: '<S53>/Sum_1'
     */
    tmpForInput[0] = rtb_Weighting;
    tmpForInput[1] = ((((pendulo_fuzzy2015_P.mf2_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf2_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf2_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf2_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf2_b) * rtb_Weighting_l;
    tmpForInput[2] = ((((pendulo_fuzzy2015_P.mf3_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf3_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf3_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf3_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf3_b) * rtb_Weighting_jw;
    tmpForInput[3] = ((((pendulo_fuzzy2015_P.mf4_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf4_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf4_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf4_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf4_b) * rtb_Weighting_pd;
    tmpForInput[4] = ((((pendulo_fuzzy2015_P.mf5_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf5_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf5_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf5_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf5_b) * rtb_Weighting_c;
    tmpForInput[5] = ((((pendulo_fuzzy2015_P.mf6_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf6_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf6_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf6_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf6_b) * rtb_Weighting_gl;
    tmpForInput[6] = ((((pendulo_fuzzy2015_P.mf7_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf7_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf7_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf7_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf7_b) * rtb_Weighting_e;
    tmpForInput[7] = ((((pendulo_fuzzy2015_P.mf8_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf8_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf8_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf8_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf8_b) * rtb_Weighting_pj;
    tmpForInput[8] = ((((pendulo_fuzzy2015_P.mf9_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf9_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf9_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf9_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf9_b) * rtb_Weighting_b;
    tmpForInput[9] = ((((pendulo_fuzzy2015_P.mf10_a[0] *
                         pendulo_fuzzy2015_B.TransferFcn3 +
                         pendulo_fuzzy2015_P.mf10_a[1] *
                         pendulo_fuzzy2015_B.TransferFcn4) +
                        pendulo_fuzzy2015_P.mf10_a[2] *
                        pendulo_fuzzy2015_B.TransferFcn2) +
                       pendulo_fuzzy2015_P.mf10_a[3] *
                       pendulo_fuzzy2015_B.TransferFcn1) +
                      pendulo_fuzzy2015_P.mf10_b) * rtb_Weighting_bh;
    tmpForInput[10] = ((((pendulo_fuzzy2015_P.mf11_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf11_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf11_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf11_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf11_b) * rtb_Weighting_go;
    tmpForInput[11] = ((((pendulo_fuzzy2015_P.mf12_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf12_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf12_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf12_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf12_b) * rtb_andorMethod_l;
    tmpForInput[12] = ((((pendulo_fuzzy2015_P.mf13_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf13_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf13_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf13_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf13_b) * rtb_Weighting_p;
    tmpForInput[13] = ((((pendulo_fuzzy2015_P.mf14_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf14_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf14_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf14_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf14_b) * rtb_andorMethod_a;
    tmpForInput[14] = ((((pendulo_fuzzy2015_P.mf15_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf15_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf15_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf15_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf15_b) * rtb_andorMethod;
    tmpForInput[15] = ((((pendulo_fuzzy2015_P.mf16_a[0] *
                          pendulo_fuzzy2015_B.TransferFcn3 +
                          pendulo_fuzzy2015_P.mf16_a[1] *
                          pendulo_fuzzy2015_B.TransferFcn4) +
                         pendulo_fuzzy2015_P.mf16_a[2] *
                         pendulo_fuzzy2015_B.TransferFcn2) +
                        pendulo_fuzzy2015_P.mf16_a[3] *
                        pendulo_fuzzy2015_B.TransferFcn1) +
                       pendulo_fuzzy2015_P.mf16_b) * rtb_Exponentialgaussmf_n;
    for (i = 0; i < 15; i++) {
      rtb_Weighting += tmpForInput[i + 1];
    }

    /* End of Sum: '<S6>/Sum1' */
    pendulo_fuzzy2015_B.Switch = rtb_Weighting / pendulo_fuzzy2015_B.Merge;
  } else {
    pendulo_fuzzy2015_B.Switch = pendulo_fuzzy2015_P.MidRange_Value;
  }

  /* End of Switch: '<S5>/Switch' */

  /* Product: '<S4>/Product4' incorporates:
   *  Constant: '<S4>/Constant6'
   */
  pendulo_fuzzy2015_B.Product4 = pendulo_fuzzy2015_B.Switch *
    pendulo_fuzzy2015_P.Constant6_Value;

  /* RelationalOperator: '<S4>/Relational Operator' incorporates:
   *  Constant: '<S4>/Constant7'
   */
  rtb_RelationalOperator1 = (pendulo_fuzzy2015_B.Product4 >
    pendulo_fuzzy2015_P.Constant7_Value);

  /* If: '<S54>/If' */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    rtAction = (int8_T)!(pendulo_fuzzy2015_B.Product4 > 0.0);
    pendulo_fuzzy2015_DW.If_ActiveSubsystem_f = rtAction;
  } else {
    rtAction = pendulo_fuzzy2015_DW.If_ActiveSubsystem_f;
  }

  switch (rtAction) {
   case 0:
    /* Outputs for IfAction SubSystem: '<S54>/If Action Subsystem' incorporates:
     *  ActionPort: '<S55>/Action Port'
     */
    pendulo_fuzzy2015_IfActionSubsystem(pendulo_fuzzy2015_B.Product4,
      &pendulo_fuzzy2015_B.IfActionSubsystem);
    if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
      srUpdateBC
        (pendulo_fuzzy2015_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S54>/If Action Subsystem' */
    break;

   case 1:
    /* Outputs for IfAction SubSystem: '<S54>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S56>/Action Port'
     */
    pendulo_fuzzy2015_IfActionSubsystem(pendulo_fuzzy2015_B.Product4,
      &pendulo_fuzzy2015_B.IfActionSubsystem1);
    if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
      srUpdateBC
        (pendulo_fuzzy2015_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S54>/If Action Subsystem1' */
    break;
  }

  /* End of If: '<S54>/If' */

  /* Product: '<S4>/Product5' */
  pendulo_fuzzy2015_B.Product5 = (real_T)rtb_RelationalOperator1 *
    pendulo_fuzzy2015_B.IfActionSubsystem.In1;

  /* Product: '<S4>/Product6' incorporates:
   *  Constant: '<S4>/Constant8'
   *  Fcn: '<S54>/Fcn'
   *  RelationalOperator: '<S4>/Relational Operator1'
   */
  pendulo_fuzzy2015_B.Product6 = (real_T)(pendulo_fuzzy2015_B.Product4 <
    pendulo_fuzzy2015_P.Constant8_Value) * fabs
    (pendulo_fuzzy2015_B.IfActionSubsystem1.In1);
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    /* S-Function Block: <S4>/Analog Output */
    {
      {
        ANALOGIOPARM parm;
        parm.mode = (RANGEMODE) pendulo_fuzzy2015_P.AnalogOutput_RangeMode;
        parm.rangeidx = pendulo_fuzzy2015_P.AnalogOutput_VoltRange;
        RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                       &pendulo_fuzzy2015_P.AnalogOutput_Channels,
                       &pendulo_fuzzy2015_B.Product5, &parm);
      }
    }

    /* S-Function Block: <S4>/Analog Output1 */
    {
      {
        ANALOGIOPARM parm;
        parm.mode = (RANGEMODE) pendulo_fuzzy2015_P.AnalogOutput1_RangeMode;
        parm.rangeidx = pendulo_fuzzy2015_P.AnalogOutput1_VoltRange;
        RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1,
                       &pendulo_fuzzy2015_P.AnalogOutput1_Channels,
                       &pendulo_fuzzy2015_B.Product6, &parm);
      }
    }

    /* S-Function Block: <S4>/Analog Input */
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) pendulo_fuzzy2015_P.AnalogInput_RangeMode;
      parm.rangeidx = pendulo_fuzzy2015_P.AnalogInput_VoltRange;
      RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1,
                     &pendulo_fuzzy2015_P.AnalogInput_Channels, &rtb_AnalogInput,
                     &parm);
    }

    /* S-Function Block: <S4>/Analog Input1 */
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) pendulo_fuzzy2015_P.AnalogInput1_RangeMode;
      parm.rangeidx = pendulo_fuzzy2015_P.AnalogInput1_VoltRange;
      RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1,
                     &pendulo_fuzzy2015_P.AnalogInput1_Channels,
                     &rtb_AnalogInput1, &parm);
    }

    /* Sum: '<S4>/Sum of Elements' incorporates:
     *  Constant: '<S4>/Constant1'
     *  Constant: '<S4>/Constant2'
     *  Product: '<S4>/Product'
     */
    pendulo_fuzzy2015_B.SumofElements = rtb_AnalogInput *
      pendulo_fuzzy2015_P.Constant1_Value - pendulo_fuzzy2015_P.Constant2_Value;
  }

  /* Derivative: '<S4>/Derivative2' */
  if ((pendulo_fuzzy2015_DW.TimeStampA >= pendulo_fuzzy2015_M->Timing.t[0]) &&
      (pendulo_fuzzy2015_DW.TimeStampB >= pendulo_fuzzy2015_M->Timing.t[0])) {
    pendulo_fuzzy2015_B.Derivative2 = 0.0;
  } else {
    rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampA;
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA;
    if (pendulo_fuzzy2015_DW.TimeStampA < pendulo_fuzzy2015_DW.TimeStampB) {
      if (pendulo_fuzzy2015_DW.TimeStampB < pendulo_fuzzy2015_M->Timing.t[0]) {
        rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampB;
        lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB;
      }
    } else {
      if (pendulo_fuzzy2015_DW.TimeStampA >= pendulo_fuzzy2015_M->Timing.t[0]) {
        rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampB;
        lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB;
      }
    }

    pendulo_fuzzy2015_B.Derivative2 = (pendulo_fuzzy2015_B.TransferFcn2 - *lastU)
      / (pendulo_fuzzy2015_M->Timing.t[0] - rtb_Weighting_l);
  }

  /* End of Derivative: '<S4>/Derivative2' */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    /* Sum: '<S4>/Add' incorporates:
     *  Constant: '<S4>/Constant'
     *  Constant: '<S4>/Constant3'
     *  Constant: '<S4>/Constant4'
     *  Constant: '<S4>/Constant5'
     *  Product: '<S4>/Product1'
     *  Product: '<S4>/Product2'
     *  Product: '<S4>/Product3'
     *  Sum: '<S4>/Sum of Elements1'
     *  Sum: '<S4>/Sum of Elements2'
     */
    pendulo_fuzzy2015_B.Add = (rtb_AnalogInput1 * rtb_AnalogInput1 *
      pendulo_fuzzy2015_P.Constant5_Value + (rtb_AnalogInput1 *
      pendulo_fuzzy2015_P.Constant3_Value - pendulo_fuzzy2015_P.Constant4_Value))
      - pendulo_fuzzy2015_P.Constant_Value;
  }

  /* Derivative: '<S4>/Derivative3' */
  if ((pendulo_fuzzy2015_DW.TimeStampA_k >= pendulo_fuzzy2015_M->Timing.t[0]) &&
      (pendulo_fuzzy2015_DW.TimeStampB_i >= pendulo_fuzzy2015_M->Timing.t[0])) {
    pendulo_fuzzy2015_B.Derivative3 = 0.0;
  } else {
    rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampA_k;
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA_m;
    if (pendulo_fuzzy2015_DW.TimeStampA_k < pendulo_fuzzy2015_DW.TimeStampB_i) {
      if (pendulo_fuzzy2015_DW.TimeStampB_i < pendulo_fuzzy2015_M->Timing.t[0])
      {
        rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampB_i;
        lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB_m;
      }
    } else {
      if (pendulo_fuzzy2015_DW.TimeStampA_k >= pendulo_fuzzy2015_M->Timing.t[0])
      {
        rtb_Weighting_l = pendulo_fuzzy2015_DW.TimeStampB_i;
        lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB_m;
      }
    }

    pendulo_fuzzy2015_B.Derivative3 = (pendulo_fuzzy2015_B.TransferFcn3 - *lastU)
      / (pendulo_fuzzy2015_M->Timing.t[0] - rtb_Weighting_l);
  }

  /* End of Derivative: '<S4>/Derivative3' */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    /* MATLAB Function: '<Root>/MATLAB Function1' */
    pendulo_fuzzy2015_B.kf[0] = -60.1155;
    pendulo_fuzzy2015_B.kf[1] = -15.6512;
    pendulo_fuzzy2015_B.kf[2] = -6.3246;
    pendulo_fuzzy2015_B.kf[3] = -10.4452;

    /* MATLAB Function 'MATLAB Function1': '<S2>:1' */
    /* kf=[-60.1155,-15.6512,-6.3246,-10.4452]; */
    /* '<S2>:1:4' */
  }

  /* Gain: '<Root>/Gain1' incorporates:
   *  Product: '<S3>/Product1'
   *  Product: '<S3>/Product2'
   *  Product: '<S3>/Product3'
   *  Product: '<S3>/Product4'
   *  Sum: '<S3>/Add1'
   */
  rtb_andorMethod_l = (((pendulo_fuzzy2015_B.TransferFcn3 *
    pendulo_fuzzy2015_B.kf[0] + pendulo_fuzzy2015_B.TransferFcn4 *
    pendulo_fuzzy2015_B.kf[1]) + pendulo_fuzzy2015_B.TransferFcn2 *
                        pendulo_fuzzy2015_B.kf[2]) +
                       pendulo_fuzzy2015_B.TransferFcn1 *
                       pendulo_fuzzy2015_B.kf[3]) *
    pendulo_fuzzy2015_P.Gain1_Gain;

  /* Saturate: '<Root>/Saturation' */
  if (rtb_andorMethod_l > pendulo_fuzzy2015_P.Saturation_UpperSat) {
    pendulo_fuzzy2015_B.Saturation = pendulo_fuzzy2015_P.Saturation_UpperSat;
  } else if (rtb_andorMethod_l < pendulo_fuzzy2015_P.Saturation_LowerSat) {
    pendulo_fuzzy2015_B.Saturation = pendulo_fuzzy2015_P.Saturation_LowerSat;
  } else {
    pendulo_fuzzy2015_B.Saturation = rtb_andorMethod_l;
  }

  /* End of Saturate: '<Root>/Saturation' */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
  }
}

/* Model update function */
void pendulo_fuzzy2015_update(void)
{
  real_T *lastU;

  /* Update for Derivative: '<S4>/Derivative2' */
  if (pendulo_fuzzy2015_DW.TimeStampA == (rtInf)) {
    pendulo_fuzzy2015_DW.TimeStampA = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA;
  } else if (pendulo_fuzzy2015_DW.TimeStampB == (rtInf)) {
    pendulo_fuzzy2015_DW.TimeStampB = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB;
  } else if (pendulo_fuzzy2015_DW.TimeStampA < pendulo_fuzzy2015_DW.TimeStampB)
  {
    pendulo_fuzzy2015_DW.TimeStampA = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA;
  } else {
    pendulo_fuzzy2015_DW.TimeStampB = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB;
  }

  *lastU = pendulo_fuzzy2015_B.TransferFcn2;

  /* End of Update for Derivative: '<S4>/Derivative2' */

  /* Update for Derivative: '<S4>/Derivative3' */
  if (pendulo_fuzzy2015_DW.TimeStampA_k == (rtInf)) {
    pendulo_fuzzy2015_DW.TimeStampA_k = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA_m;
  } else if (pendulo_fuzzy2015_DW.TimeStampB_i == (rtInf)) {
    pendulo_fuzzy2015_DW.TimeStampB_i = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB_m;
  } else if (pendulo_fuzzy2015_DW.TimeStampA_k <
             pendulo_fuzzy2015_DW.TimeStampB_i) {
    pendulo_fuzzy2015_DW.TimeStampA_k = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeA_m;
  } else {
    pendulo_fuzzy2015_DW.TimeStampB_i = pendulo_fuzzy2015_M->Timing.t[0];
    lastU = &pendulo_fuzzy2015_DW.LastUAtTimeB_m;
  }

  *lastU = pendulo_fuzzy2015_B.TransferFcn3;

  /* End of Update for Derivative: '<S4>/Derivative3' */
  if (rtmIsMajorTimeStep(pendulo_fuzzy2015_M)) {
    rt_ertODEUpdateContinuousStates(&pendulo_fuzzy2015_M->solverInfo);
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
  if (!(++pendulo_fuzzy2015_M->Timing.clockTick0)) {
    ++pendulo_fuzzy2015_M->Timing.clockTickH0;
  }

  pendulo_fuzzy2015_M->Timing.t[0] = rtsiGetSolverStopTime
    (&pendulo_fuzzy2015_M->solverInfo);

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
    if (!(++pendulo_fuzzy2015_M->Timing.clockTick1)) {
      ++pendulo_fuzzy2015_M->Timing.clockTickH1;
    }

    pendulo_fuzzy2015_M->Timing.t[1] = pendulo_fuzzy2015_M->Timing.clockTick1 *
      pendulo_fuzzy2015_M->Timing.stepSize1 +
      pendulo_fuzzy2015_M->Timing.clockTickH1 *
      pendulo_fuzzy2015_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Derivatives for root system: '<Root>' */
void pendulo_fuzzy2015_derivatives(void)
{
  XDot_pendulo_fuzzy2015_T *_rtXdot;
  _rtXdot = ((XDot_pendulo_fuzzy2015_T *) pendulo_fuzzy2015_M->ModelData.derivs);

  /* Derivatives for TransferFcn: '<S4>/Transfer Fcn3' */
  _rtXdot->TransferFcn3_CSTATE = 0.0;
  _rtXdot->TransferFcn3_CSTATE += pendulo_fuzzy2015_P.TransferFcn3_A *
    pendulo_fuzzy2015_X.TransferFcn3_CSTATE;
  _rtXdot->TransferFcn3_CSTATE += pendulo_fuzzy2015_B.Add;

  /* Derivatives for TransferFcn: '<S4>/Transfer Fcn4' */
  _rtXdot->TransferFcn4_CSTATE = 0.0;
  _rtXdot->TransferFcn4_CSTATE += pendulo_fuzzy2015_P.TransferFcn4_A *
    pendulo_fuzzy2015_X.TransferFcn4_CSTATE;
  _rtXdot->TransferFcn4_CSTATE += pendulo_fuzzy2015_B.Derivative3;

  /* Derivatives for TransferFcn: '<S4>/Transfer Fcn2' */
  _rtXdot->TransferFcn2_CSTATE = 0.0;
  _rtXdot->TransferFcn2_CSTATE += pendulo_fuzzy2015_P.TransferFcn2_A *
    pendulo_fuzzy2015_X.TransferFcn2_CSTATE;
  _rtXdot->TransferFcn2_CSTATE += pendulo_fuzzy2015_B.SumofElements;

  /* Derivatives for TransferFcn: '<S4>/Transfer Fcn1' */
  _rtXdot->TransferFcn1_CSTATE = 0.0;
  _rtXdot->TransferFcn1_CSTATE += pendulo_fuzzy2015_P.TransferFcn1_A *
    pendulo_fuzzy2015_X.TransferFcn1_CSTATE;
  _rtXdot->TransferFcn1_CSTATE += pendulo_fuzzy2015_B.Derivative2;
}

/* Model initialize function */
void pendulo_fuzzy2015_initialize(void)
{
  /* Start for If: '<S6>/If' */
  pendulo_fuzzy2015_DW.If_ActiveSubsystem = -1;

  /* Start for If: '<S54>/If' */
  pendulo_fuzzy2015_DW.If_ActiveSubsystem_f = -1;

  /* S-Function Block: <S4>/Analog Output */

  /* no initial value should be set */

  /* S-Function Block: <S4>/Analog Output1 */

  /* no initial value should be set */

  /* InitializeConditions for TransferFcn: '<S4>/Transfer Fcn3' */
  pendulo_fuzzy2015_X.TransferFcn3_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S4>/Transfer Fcn4' */
  pendulo_fuzzy2015_X.TransferFcn4_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S4>/Transfer Fcn2' */
  pendulo_fuzzy2015_X.TransferFcn2_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S4>/Transfer Fcn1' */
  pendulo_fuzzy2015_X.TransferFcn1_CSTATE = 0.0;

  /* InitializeConditions for Derivative: '<S4>/Derivative2' */
  pendulo_fuzzy2015_DW.TimeStampA = (rtInf);
  pendulo_fuzzy2015_DW.TimeStampB = (rtInf);

  /* InitializeConditions for Derivative: '<S4>/Derivative3' */
  pendulo_fuzzy2015_DW.TimeStampA_k = (rtInf);
  pendulo_fuzzy2015_DW.TimeStampB_i = (rtInf);

  /* SystemInitialize for IfAction SubSystem: '<S6>/Action: One' */
  /* SystemInitialize for Outport: '<S28>/Out1' */
  pendulo_fuzzy2015_B.Merge = pendulo_fuzzy2015_P.Out1_Y0;

  /* End of SystemInitialize for SubSystem: '<S6>/Action: One' */
}

/* Model terminate function */
void pendulo_fuzzy2015_terminate(void)
{
  /* S-Function Block: <S4>/Analog Output */

  /* no final value should be set */

  /* S-Function Block: <S4>/Analog Output1 */

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
  pendulo_fuzzy2015_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  pendulo_fuzzy2015_update();
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
  pendulo_fuzzy2015_initialize();
}

void MdlTerminate(void)
{
  pendulo_fuzzy2015_terminate();
}

/* Registration function */
RT_MODEL_pendulo_fuzzy2015_T *pendulo_fuzzy2015(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)pendulo_fuzzy2015_M, 0,
                sizeof(RT_MODEL_pendulo_fuzzy2015_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&pendulo_fuzzy2015_M->solverInfo,
                          &pendulo_fuzzy2015_M->Timing.simTimeStep);
    rtsiSetTPtr(&pendulo_fuzzy2015_M->solverInfo, &rtmGetTPtr
                (pendulo_fuzzy2015_M));
    rtsiSetStepSizePtr(&pendulo_fuzzy2015_M->solverInfo,
                       &pendulo_fuzzy2015_M->Timing.stepSize0);
    rtsiSetdXPtr(&pendulo_fuzzy2015_M->solverInfo,
                 &pendulo_fuzzy2015_M->ModelData.derivs);
    rtsiSetContStatesPtr(&pendulo_fuzzy2015_M->solverInfo, (real_T **)
                         &pendulo_fuzzy2015_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&pendulo_fuzzy2015_M->solverInfo,
      &pendulo_fuzzy2015_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&pendulo_fuzzy2015_M->solverInfo,
      &pendulo_fuzzy2015_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&pendulo_fuzzy2015_M->solverInfo,
      &pendulo_fuzzy2015_M->ModelData.periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&pendulo_fuzzy2015_M->solverInfo,
      &pendulo_fuzzy2015_M->ModelData.periodicContStateRanges);
    rtsiSetErrorStatusPtr(&pendulo_fuzzy2015_M->solverInfo, (&rtmGetErrorStatus
      (pendulo_fuzzy2015_M)));
    rtsiSetRTModelPtr(&pendulo_fuzzy2015_M->solverInfo, pendulo_fuzzy2015_M);
  }

  rtsiSetSimTimeStep(&pendulo_fuzzy2015_M->solverInfo, MAJOR_TIME_STEP);
  pendulo_fuzzy2015_M->ModelData.intgData.y =
    pendulo_fuzzy2015_M->ModelData.odeY;
  pendulo_fuzzy2015_M->ModelData.intgData.f[0] =
    pendulo_fuzzy2015_M->ModelData.odeF[0];
  pendulo_fuzzy2015_M->ModelData.intgData.f[1] =
    pendulo_fuzzy2015_M->ModelData.odeF[1];
  pendulo_fuzzy2015_M->ModelData.intgData.f[2] =
    pendulo_fuzzy2015_M->ModelData.odeF[2];
  pendulo_fuzzy2015_M->ModelData.contStates = ((real_T *) &pendulo_fuzzy2015_X);
  rtsiSetSolverData(&pendulo_fuzzy2015_M->solverInfo, (void *)
                    &pendulo_fuzzy2015_M->ModelData.intgData);
  rtsiSetSolverName(&pendulo_fuzzy2015_M->solverInfo,"ode3");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = pendulo_fuzzy2015_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    pendulo_fuzzy2015_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    pendulo_fuzzy2015_M->Timing.sampleTimes =
      (&pendulo_fuzzy2015_M->Timing.sampleTimesArray[0]);
    pendulo_fuzzy2015_M->Timing.offsetTimes =
      (&pendulo_fuzzy2015_M->Timing.offsetTimesArray[0]);

    /* task periods */
    pendulo_fuzzy2015_M->Timing.sampleTimes[0] = (0.0);
    pendulo_fuzzy2015_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
    pendulo_fuzzy2015_M->Timing.offsetTimes[0] = (0.0);
    pendulo_fuzzy2015_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(pendulo_fuzzy2015_M, &pendulo_fuzzy2015_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = pendulo_fuzzy2015_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    pendulo_fuzzy2015_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(pendulo_fuzzy2015_M, -1);
  pendulo_fuzzy2015_M->Timing.stepSize0 = 0.001;
  pendulo_fuzzy2015_M->Timing.stepSize1 = 0.001;

  /* External mode info */
  pendulo_fuzzy2015_M->Sizes.checksums[0] = (1222529345U);
  pendulo_fuzzy2015_M->Sizes.checksums[1] = (318638355U);
  pendulo_fuzzy2015_M->Sizes.checksums[2] = (2040392141U);
  pendulo_fuzzy2015_M->Sizes.checksums[3] = (941031672U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[7];
    pendulo_fuzzy2015_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = (sysRanDType *)&pendulo_fuzzy2015_DW.ActionOne_SubsysRanBC;
    systemRan[3] = (sysRanDType *)&pendulo_fuzzy2015_DW.Actionu1_SubsysRanBC;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = (sysRanDType *)
      &pendulo_fuzzy2015_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC;
    systemRan[6] = (sysRanDType *)
      &pendulo_fuzzy2015_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC;
    rteiSetModelMappingInfoPtr(pendulo_fuzzy2015_M->extModeInfo,
      &pendulo_fuzzy2015_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(pendulo_fuzzy2015_M->extModeInfo,
                        pendulo_fuzzy2015_M->Sizes.checksums);
    rteiSetTPtr(pendulo_fuzzy2015_M->extModeInfo, rtmGetTPtr(pendulo_fuzzy2015_M));
  }

  pendulo_fuzzy2015_M->solverInfoPtr = (&pendulo_fuzzy2015_M->solverInfo);
  pendulo_fuzzy2015_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&pendulo_fuzzy2015_M->solverInfo, 0.001);
  rtsiSetSolverMode(&pendulo_fuzzy2015_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  pendulo_fuzzy2015_M->ModelData.blockIO = ((void *) &pendulo_fuzzy2015_B);
  (void) memset(((void *) &pendulo_fuzzy2015_B), 0,
                sizeof(B_pendulo_fuzzy2015_T));

  /* parameters */
  pendulo_fuzzy2015_M->ModelData.defaultParam = ((real_T *)&pendulo_fuzzy2015_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &pendulo_fuzzy2015_X;
    pendulo_fuzzy2015_M->ModelData.contStates = (x);
    (void) memset((void *)&pendulo_fuzzy2015_X, 0,
                  sizeof(X_pendulo_fuzzy2015_T));
  }

  /* states (dwork) */
  pendulo_fuzzy2015_M->ModelData.dwork = ((void *) &pendulo_fuzzy2015_DW);
  (void) memset((void *)&pendulo_fuzzy2015_DW, 0,
                sizeof(DW_pendulo_fuzzy2015_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    pendulo_fuzzy2015_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  pendulo_fuzzy2015_M->Sizes.numContStates = (4);/* Number of continuous states */
  pendulo_fuzzy2015_M->Sizes.numPeriodicContStates = (0);/* Number of periodic continuous states */
  pendulo_fuzzy2015_M->Sizes.numY = (0);/* Number of model outputs */
  pendulo_fuzzy2015_M->Sizes.numU = (0);/* Number of model inputs */
  pendulo_fuzzy2015_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  pendulo_fuzzy2015_M->Sizes.numSampTimes = (2);/* Number of sample times */
  pendulo_fuzzy2015_M->Sizes.numBlocks = (277);/* Number of blocks */
  pendulo_fuzzy2015_M->Sizes.numBlockIO = (17);/* Number of block outputs */
  pendulo_fuzzy2015_M->Sizes.numBlockPrms = (166);/* Sum of parameter "widths" */
  return pendulo_fuzzy2015_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
