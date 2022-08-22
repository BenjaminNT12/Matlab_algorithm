/* Include files */

#include "modelInterface.h"
#include "m_14lqfvNiU50HKPCCIhdsB.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static const mxArray *eml_mx;
static const mxArray *b_eml_mx;
static emlrtRSInfo emlrtRSI = { 1,     /* lineNo */
  "arduino_SerialWrite",               /* fcnName */
  "C:\\ProgramData\\MATLAB\\SupportPackages\\R2018a\\toolbox\\target\\supportpackages\\arduinobase\\+codertarget\\+arduinobase\\+internal\\ardu"
  "ino_SerialWrite.p"                  /* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 1,   /* lineNo */
  "System",                            /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\system\\coder\\+matlab\\+system\\+coder\\System.p"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 1,   /* lineNo */
  "SystemProp",                        /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\system\\coder\\+matlab\\+system\\+coder\\SystemProp.p"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 1,   /* lineNo */
  "SystemCore",                        /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\system\\coder\\+matlab\\+system\\+coder\\SystemCore.p"/* pathName */
};

static emlrtRSInfo e_emlrtRSI = { 1,   /* lineNo */
  "Propagates",                        /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\system\\coder\\+matlab\\+system\\+mixin\\+coder\\Propagates.p"/* pathName */
};

static emlrtRSInfo f_emlrtRSI = { 1,   /* lineNo */
  "CustomIcon",                        /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\matlab\\system\\+matlab\\+system\\+mixin\\CustomIcon.p"/* pathName */
};

static emlrtRSInfo g_emlrtRSI = { 43,  /* lineNo */
  "ExternalDependency",                /* fcnName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\coder\\coder\\+coder\\ExternalDependency.m"/* pathName */
};

static emlrtRSInfo h_emlrtRSI = { 11,  /* lineNo */
  "",                                  /* fcnName */
  ""                                   /* pathName */
};

static emlrtRSInfo i_emlrtRSI = { 26,  /* lineNo */
  "",                                  /* fcnName */
  ""                                   /* pathName */
};

static emlrtRSInfo j_emlrtRSI = { 28,  /* lineNo */
  "",                                  /* fcnName */
  ""                                   /* pathName */
};

static emlrtRSInfo k_emlrtRSI = { 33,  /* lineNo */
  "",                                  /* fcnName */
  ""                                   /* pathName */
};

static emlrtMCInfo emlrtMCI = { 1,     /* lineNo */
  1,                                   /* colNo */
  "SystemCore",                        /* fName */
  "C:\\Program Files\\MATLAB\\R2018a\\toolbox\\shared\\system\\coder\\+matlab\\+system\\+coder\\SystemCore.p"/* pName */
};

/* Function Declarations */
static void cgxe_mdl_start(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance);
static void cgxe_mdl_initialize(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance);
static void cgxe_mdl_outputs(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance);
static void cgxe_mdl_update(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance);
static void cgxe_mdl_enable(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance);
static void cgxe_mdl_disable(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance);
static void cgxe_mdl_terminate(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance);
static void mw__internal__system__init__fcn(void);
static void mw__internal__call__setup(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp);
static void mw__internal__call__reset(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp);
static void mw__internal__call__step(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp);
static const mxArray *cgxe_mdl_get_sim_state
  (InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance);
static codertarget_arduinobase_internal_arduino_SerialWrite emlrt_marshallIn(
  const emlrtStack *sp, const mxArray *b_sysobj, const char_T *identifier);
static codertarget_arduinobase_internal_arduino_SerialWrite b_emlrt_marshallIn(
  const emlrtStack *sp, const mxArray *u, const emlrtMsgIdentifier *parentId);
static int32_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, cell_wrap y[1]);
static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, uint32_T y[8]);
static boolean_T f_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *b_sysobj_not_empty, const char_T *identifier);
static boolean_T g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
  const emlrtMsgIdentifier *parentId);
static void cgxe_mdl_set_sim_state(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const mxArray *st);
static const mxArray *message(const emlrtStack *sp, const mxArray *b, const
  mxArray *c, emlrtMCInfo *location);
static const mxArray *getString(const emlrtStack *sp, const mxArray *b,
  emlrtMCInfo *location);
static void error(const emlrtStack *sp, const mxArray *b, const mxArray *c,
                  emlrtMCInfo *location);
static int32_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId);
static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, uint32_T ret[8]);
static boolean_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId);
static void init_simulink_io_address(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance);

/* Function Definitions */
static void cgxe_mdl_start(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  init_simulink_io_address(moduleInstance);
  st.tls = moduleInstance->emlrtRootTLSGlobal;
  cgxertSetGcb(moduleInstance->S, -1, -1);
  mw__internal__system__init__fcn();
  mw__internal__call__setup(moduleInstance, &st);
  cgxertRestoreGcb(moduleInstance->S, -1, -1);
}

static void cgxe_mdl_initialize(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = moduleInstance->emlrtRootTLSGlobal;
  cgxertSetGcb(moduleInstance->S, -1, -1);
  mw__internal__call__reset(moduleInstance, &st);
  cgxertRestoreGcb(moduleInstance->S, -1, -1);
}

static void cgxe_mdl_outputs(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = moduleInstance->emlrtRootTLSGlobal;
  cgxertSetGcb(moduleInstance->S, -1, -1);
  mw__internal__call__step(moduleInstance, &st);
  cgxertRestoreGcb(moduleInstance->S, -1, -1);
}

static void cgxe_mdl_update(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance)
{
  (void)moduleInstance;
}

static void cgxe_mdl_enable(InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance)
{
  (void)moduleInstance;
}

static void cgxe_mdl_disable(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance)
{
  (void)moduleInstance;
}

static void cgxe_mdl_terminate(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance)
{
  emlrtDestroyArray(&b_eml_mx);
  emlrtDestroyArray(&eml_mx);
  cgxertSetGcb(moduleInstance->S, -1, -1);
  cgxertRestoreGcb(moduleInstance->S, -1, -1);
}

static void mw__internal__system__init__fcn(void)
{
  const mxArray *m0;
  static const int32_T iv0[2] = { 0, 0 };

  static const int32_T iv1[2] = { 0, 0 };

  m0 = emlrtCreateNumericArray(2, iv0, mxDOUBLE_CLASS, mxREAL);
  emlrtAssignP(&b_eml_mx, m0);
  m0 = emlrtCreateCharArray(2, iv1);
  emlrtAssignP(&eml_mx, m0);
}

static void mw__internal__call__setup(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp)
{
  emlrtStack st;
  emlrtStack b_st;
  codertarget_arduinobase_internal_arduino_SerialWrite *obj;
  emlrtStack c_st;
  char_T u[51];
  emlrtStack d_st;
  int32_T i0;
  cell_wrap varSizes[1];
  const mxArray *y;
  static char_T b_u[51] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 's', 'y', 's',
    't', 'e', 'm', ':', 'm', 'e', 't', 'h', 'o', 'd', 'C', 'a', 'l', 'l', 'e',
    'd', 'W', 'h', 'e', 'n', 'L', 'o', 'c', 'k', 'e', 'd', 'R', 'e', 'l', 'e',
    'a', 's', 'e', 'd', 'C', 'o', 'd', 'e', 'g', 'e', 'n' };

  const mxArray *m1;
  static const int32_T iv2[2] = { 1, 51 };

  static int8_T iv3[8] = { 2, 1, 1, 1, 1, 1, 1, 1 };

  const mxArray *b_y;
  static const int32_T iv4[2] = { 1, 51 };

  char_T c_u[5];
  const mxArray *c_y;
  static char_T d_u[5] = { 's', 'e', 't', 'u', 'p' };

  static const int32_T iv5[2] = { 1, 5 };

  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if (!moduleInstance->sysobj_not_empty) {
    st.site = &h_emlrtRSI;
    obj = &moduleInstance->sysobj;
    b_st.site = &emlrtRSI;
    c_st.site = &b_emlrtRSI;
    d_st.site = &c_emlrtRSI;
    c_st.site = &b_emlrtRSI;
    obj->isInitialized = 0;
    d_st.site = &d_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &e_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &f_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &g_emlrtRSI;
    moduleInstance->sysobj_not_empty = true;
  }

  st.site = &i_emlrtRSI;
  obj = &moduleInstance->sysobj;
  if (moduleInstance->sysobj.isInitialized != 0) {
    for (i0 = 0; i0 < 51; i0++) {
      u[i0] = b_u[i0];
    }

    y = NULL;
    m1 = emlrtCreateCharArray(2, iv2);
    emlrtInitCharArrayR2013a(&st, 51, m1, &u[0]);
    emlrtAssign(&y, m1);
    for (i0 = 0; i0 < 51; i0++) {
      u[i0] = b_u[i0];
    }

    b_y = NULL;
    m1 = emlrtCreateCharArray(2, iv4);
    emlrtInitCharArrayR2013a(&st, 51, m1, &u[0]);
    emlrtAssign(&b_y, m1);
    for (i0 = 0; i0 < 5; i0++) {
      c_u[i0] = d_u[i0];
    }

    c_y = NULL;
    m1 = emlrtCreateCharArray(2, iv5);
    emlrtInitCharArrayR2013a(&st, 5, m1, &c_u[0]);
    emlrtAssign(&c_y, m1);
    b_st.site = &d_emlrtRSI;
    error(&b_st, y, getString(&b_st, message(&b_st, b_y, c_y, &emlrtMCI),
           &emlrtMCI), &emlrtMCI);
  }

  obj->isInitialized = 1;
  b_st.site = &d_emlrtRSI;
  for (i0 = 0; i0 < 8; i0++) {
    varSizes[0].f1[i0] = (uint32_T)iv3[i0];
  }

  obj->inputVarSize[0] = varSizes[0];
}

static void mw__internal__call__reset(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp)
{
  emlrtStack st;
  emlrtStack b_st;
  codertarget_arduinobase_internal_arduino_SerialWrite *obj;
  char_T u[45];
  emlrtStack c_st;
  int32_T i1;
  emlrtStack d_st;
  const mxArray *y;
  static char_T b_u[45] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 's', 'y', 's',
    't', 'e', 'm', ':', 'm', 'e', 't', 'h', 'o', 'd', 'C', 'a', 'l', 'l', 'e',
    'd', 'W', 'h', 'e', 'n', 'R', 'e', 'l', 'e', 'a', 's', 'e', 'd', 'C', 'o',
    'd', 'e', 'g', 'e', 'n' };

  const mxArray *m2;
  static const int32_T iv6[2] = { 1, 45 };

  const mxArray *b_y;
  static const int32_T iv7[2] = { 1, 45 };

  char_T c_u[5];
  const mxArray *c_y;
  static char_T d_u[5] = { 'r', 'e', 's', 'e', 't' };

  static const int32_T iv8[2] = { 1, 5 };

  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  if (!moduleInstance->sysobj_not_empty) {
    st.site = &h_emlrtRSI;
    obj = &moduleInstance->sysobj;
    b_st.site = &emlrtRSI;
    c_st.site = &b_emlrtRSI;
    d_st.site = &c_emlrtRSI;
    c_st.site = &b_emlrtRSI;
    obj->isInitialized = 0;
    d_st.site = &d_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &e_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &f_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &g_emlrtRSI;
    moduleInstance->sysobj_not_empty = true;
  }

  st.site = &j_emlrtRSI;
  if (moduleInstance->sysobj.isInitialized == 2) {
    for (i1 = 0; i1 < 45; i1++) {
      u[i1] = b_u[i1];
    }

    y = NULL;
    m2 = emlrtCreateCharArray(2, iv6);
    emlrtInitCharArrayR2013a(&st, 45, m2, &u[0]);
    emlrtAssign(&y, m2);
    for (i1 = 0; i1 < 45; i1++) {
      u[i1] = b_u[i1];
    }

    b_y = NULL;
    m2 = emlrtCreateCharArray(2, iv7);
    emlrtInitCharArrayR2013a(&st, 45, m2, &u[0]);
    emlrtAssign(&b_y, m2);
    for (i1 = 0; i1 < 5; i1++) {
      c_u[i1] = d_u[i1];
    }

    c_y = NULL;
    m2 = emlrtCreateCharArray(2, iv8);
    emlrtInitCharArrayR2013a(&st, 5, m2, &c_u[0]);
    emlrtAssign(&c_y, m2);
    b_st.site = &d_emlrtRSI;
    error(&b_st, y, getString(&b_st, message(&b_st, b_y, c_y, &emlrtMCI),
           &emlrtMCI), &emlrtMCI);
  }
}

static void mw__internal__call__step(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const emlrtStack *sp)
{
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  codertarget_arduinobase_internal_arduino_SerialWrite *obj;
  char_T u[45];
  int32_T k;
  const mxArray *y;
  static char_T b_u[45] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 's', 'y', 's',
    't', 'e', 'm', ':', 'm', 'e', 't', 'h', 'o', 'd', 'C', 'a', 'l', 'l', 'e',
    'd', 'W', 'h', 'e', 'n', 'R', 'e', 'l', 'e', 'a', 's', 'e', 'd', 'C', 'o',
    'd', 'e', 'g', 'e', 'n' };

  boolean_T exitg1;
  char_T c_u[51];
  const mxArray *m3;
  static const int32_T iv9[2] = { 1, 45 };

  static int8_T inSize[8] = { 2, 1, 1, 1, 1, 1, 1, 1 };

  cell_wrap varSizes[1];
  static char_T d_u[51] = { 'M', 'A', 'T', 'L', 'A', 'B', ':', 's', 'y', 's',
    't', 'e', 'm', ':', 'm', 'e', 't', 'h', 'o', 'd', 'C', 'a', 'l', 'l', 'e',
    'd', 'W', 'h', 'e', 'n', 'L', 'o', 'c', 'k', 'e', 'd', 'R', 'e', 'l', 'e',
    'a', 's', 'e', 'd', 'C', 'o', 'd', 'e', 'g', 'e', 'n' };

  static const int32_T iv10[2] = { 1, 51 };

  const mxArray *b_y;
  static const int32_T iv11[2] = { 1, 45 };

  char_T e_u[4];
  static const int32_T iv12[2] = { 1, 51 };

  const mxArray *c_y;
  static char_T f_u[4] = { 's', 't', 'e', 'p' };

  char_T g_u[5];
  static const int32_T iv13[2] = { 1, 4 };

  static char_T h_u[5] = { 's', 'e', 't', 'u', 'p' };

  static const int32_T iv14[2] = { 1, 5 };

  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  if (!moduleInstance->sysobj_not_empty) {
    st.site = &h_emlrtRSI;
    obj = &moduleInstance->sysobj;
    b_st.site = &emlrtRSI;
    c_st.site = &b_emlrtRSI;
    d_st.site = &c_emlrtRSI;
    c_st.site = &b_emlrtRSI;
    obj->isInitialized = 0;
    d_st.site = &d_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &e_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &f_emlrtRSI;
    b_st.site = &emlrtRSI;
    c_st.site = &g_emlrtRSI;
    moduleInstance->sysobj_not_empty = true;
  }

  st.site = &k_emlrtRSI;
  obj = &moduleInstance->sysobj;
  if (moduleInstance->sysobj.isInitialized == 2) {
    for (k = 0; k < 45; k++) {
      u[k] = b_u[k];
    }

    y = NULL;
    m3 = emlrtCreateCharArray(2, iv9);
    emlrtInitCharArrayR2013a(&st, 45, m3, &u[0]);
    emlrtAssign(&y, m3);
    for (k = 0; k < 45; k++) {
      u[k] = b_u[k];
    }

    b_y = NULL;
    m3 = emlrtCreateCharArray(2, iv11);
    emlrtInitCharArrayR2013a(&st, 45, m3, &u[0]);
    emlrtAssign(&b_y, m3);
    for (k = 0; k < 4; k++) {
      e_u[k] = f_u[k];
    }

    c_y = NULL;
    m3 = emlrtCreateCharArray(2, iv13);
    emlrtInitCharArrayR2013a(&st, 4, m3, &e_u[0]);
    emlrtAssign(&c_y, m3);
    b_st.site = &d_emlrtRSI;
    error(&b_st, y, getString(&b_st, message(&b_st, b_y, c_y, &emlrtMCI),
           &emlrtMCI), &emlrtMCI);
  }

  if (obj->isInitialized != 1) {
    b_st.site = &d_emlrtRSI;
    c_st.site = &d_emlrtRSI;
    if (obj->isInitialized != 0) {
      for (k = 0; k < 51; k++) {
        c_u[k] = d_u[k];
      }

      y = NULL;
      m3 = emlrtCreateCharArray(2, iv10);
      emlrtInitCharArrayR2013a(&c_st, 51, m3, &c_u[0]);
      emlrtAssign(&y, m3);
      for (k = 0; k < 51; k++) {
        c_u[k] = d_u[k];
      }

      b_y = NULL;
      m3 = emlrtCreateCharArray(2, iv12);
      emlrtInitCharArrayR2013a(&c_st, 51, m3, &c_u[0]);
      emlrtAssign(&b_y, m3);
      for (k = 0; k < 5; k++) {
        g_u[k] = h_u[k];
      }

      c_y = NULL;
      m3 = emlrtCreateCharArray(2, iv14);
      emlrtInitCharArrayR2013a(&c_st, 5, m3, &g_u[0]);
      emlrtAssign(&c_y, m3);
      d_st.site = &d_emlrtRSI;
      error(&d_st, y, getString(&d_st, message(&d_st, b_y, c_y, &emlrtMCI),
             &emlrtMCI), &emlrtMCI);
    }

    obj->isInitialized = 1;
    d_st.site = &d_emlrtRSI;
    for (k = 0; k < 8; k++) {
      varSizes[0].f1[k] = (uint32_T)inSize[k];
    }

    obj->inputVarSize[0] = varSizes[0];
  }

  b_st.site = &d_emlrtRSI;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 8)) {
    if (obj->inputVarSize[0].f1[k] != (uint32_T)inSize[k]) {
      for (k = 0; k < 8; k++) {
        obj->inputVarSize[0].f1[k] = (uint32_T)inSize[k];
      }

      exitg1 = true;
    } else {
      k++;
    }
  }
}

static const mxArray *cgxe_mdl_get_sim_state
  (InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance)
{
  const mxArray *st;
  const mxArray *y;
  const mxArray *b_y;
  static const char * sv0[2] = { "isInitialized", "inputVarSize" };

  const mxArray *c_y;
  const mxArray *m4;
  cell_wrap u[1];
  int32_T iv15[1];
  static const char * sv1[1] = { "f1" };

  const cell_wrap *r0;
  uint32_T b_u[8];
  int32_T i2;
  const mxArray *d_y;
  static const int32_T iv16[2] = { 1, 8 };

  uint32_T *pData;
  int32_T i;
  st = NULL;
  y = NULL;
  emlrtAssign(&y, emlrtCreateCellMatrix(2, 1));
  b_y = NULL;
  emlrtAssign(&b_y, emlrtCreateStructMatrix(1, 1, 2, sv0));
  c_y = NULL;
  m4 = emlrtCreateNumericMatrix(1, 1, mxINT32_CLASS, mxREAL);
  *(int32_T *)emlrtMxGetData(m4) = moduleInstance->sysobj.isInitialized;
  emlrtAssign(&c_y, m4);
  emlrtSetFieldR2017b(b_y, 0, "isInitialized", c_y, 0);
  u[0] = moduleInstance->sysobj.inputVarSize[0];
  c_y = NULL;
  iv15[0] = 1;
  emlrtAssign(&c_y, emlrtCreateStructArray(1, iv15, 1, sv1));
  r0 = &u[0];
  for (i2 = 0; i2 < 8; i2++) {
    b_u[i2] = r0->f1[i2];
  }

  d_y = NULL;
  m4 = emlrtCreateNumericArray(2, iv16, mxUINT32_CLASS, mxREAL);
  pData = (uint32_T *)emlrtMxGetData(m4);
  i2 = 0;
  for (i = 0; i < 8; i++) {
    pData[i2] = b_u[i];
    i2++;
  }

  emlrtAssign(&d_y, m4);
  emlrtSetFieldR2017b(c_y, 0, "f1", d_y, 0);
  emlrtSetFieldR2017b(b_y, 0, "inputVarSize", c_y, 1);
  emlrtSetCell(y, 0, b_y);
  b_y = NULL;
  m4 = emlrtCreateLogicalScalar(moduleInstance->sysobj_not_empty);
  emlrtAssign(&b_y, m4);
  emlrtSetCell(y, 1, b_y);
  emlrtAssign(&st, y);
  return st;
}

static codertarget_arduinobase_internal_arduino_SerialWrite emlrt_marshallIn(
  const emlrtStack *sp, const mxArray *b_sysobj, const char_T *identifier)
{
  codertarget_arduinobase_internal_arduino_SerialWrite y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(b_sysobj), &thisId);
  emlrtDestroyArray(&b_sysobj);
  return y;
}

static codertarget_arduinobase_internal_arduino_SerialWrite b_emlrt_marshallIn(
  const emlrtStack *sp, const mxArray *u, const emlrtMsgIdentifier *parentId)
{
  codertarget_arduinobase_internal_arduino_SerialWrite y;
  emlrtMsgIdentifier thisId;
  static const char * fieldNames[2] = { "isInitialized", "inputVarSize" };

  static const int32_T dims = 0;
  thisId.fParent = parentId;
  thisId.bParentIsCell = false;
  emlrtCheckStructR2012b(sp, parentId, u, 2, fieldNames, 0U, &dims);
  thisId.fIdentifier = "isInitialized";
  y.isInitialized = c_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u,
    0, 0, "isInitialized")), &thisId);
  thisId.fIdentifier = "inputVarSize";
  d_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 1,
    "inputVarSize")), &thisId, y.inputVarSize);
  emlrtDestroyArray(&u);
  return y;
}

static int32_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  int32_T y;
  y = h_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, cell_wrap y[1])
{
  emlrtMsgIdentifier thisId;
  static const char * fieldNames[1] = { "f1" };

  static const int32_T dims[1] = { 1 };

  thisId.fParent = parentId;
  thisId.bParentIsCell = false;
  emlrtCheckStructR2012b(sp, parentId, u, 1, fieldNames, 1U, dims);
  thisId.fIdentifier = "f1";
  e_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 0, "f1")),
                     &thisId, y[0].f1);
  emlrtDestroyArray(&u);
}

static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, uint32_T y[8])
{
  i_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static boolean_T f_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *b_sysobj_not_empty, const char_T *identifier)
{
  boolean_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = g_emlrt_marshallIn(sp, emlrtAlias(b_sysobj_not_empty), &thisId);
  emlrtDestroyArray(&b_sysobj_not_empty);
  return y;
}

static boolean_T g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
  const emlrtMsgIdentifier *parentId)
{
  boolean_T y;
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void cgxe_mdl_set_sim_state(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance, const mxArray *st)
{
  emlrtStack b_st = { NULL,            /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  const mxArray *u;
  b_st.tls = moduleInstance->emlrtRootTLSGlobal;
  u = emlrtAlias(st);
  moduleInstance->sysobj = emlrt_marshallIn(&b_st, emlrtAlias(emlrtGetCell(&b_st,
    "sysobj", u, 0)), "sysobj");
  moduleInstance->sysobj_not_empty = f_emlrt_marshallIn(&b_st, emlrtAlias
    (emlrtGetCell(&b_st, "sysobj_not_empty", u, 1)), "sysobj_not_empty");
  emlrtDestroyArray(&u);
  emlrtDestroyArray(&st);
}

static const mxArray *message(const emlrtStack *sp, const mxArray *b, const
  mxArray *c, emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  const mxArray *m5;
  pArrays[0] = b;
  pArrays[1] = c;
  return emlrtCallMATLABR2012b(sp, 1, &m5, 2, pArrays, "message", true, location);
}

static const mxArray *getString(const emlrtStack *sp, const mxArray *b,
  emlrtMCInfo *location)
{
  const mxArray *pArray;
  const mxArray *m6;
  pArray = b;
  return emlrtCallMATLABR2012b(sp, 1, &m6, 1, &pArray, "getString", true,
    location);
}

static void error(const emlrtStack *sp, const mxArray *b, const mxArray *c,
                  emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  pArrays[0] = b;
  pArrays[1] = c;
  emlrtCallMATLABR2012b(sp, 0, NULL, 2, pArrays, "error", true, location);
}

static int32_T h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId)
{
  int32_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "int32", false, 0U, &dims);
  ret = *(int32_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, uint32_T ret[8])
{
  static const int32_T dims[2] = { 1, 8 };

  int32_T i3;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "uint32", false, 2U, dims);
  for (i3 = 0; i3 < 8; i3++) {
    ret[i3] = (*(uint32_T (*)[8])emlrtMxGetData(src))[i3];
  }

  emlrtDestroyArray(&src);
}

static boolean_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId)
{
  boolean_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "logical", false, 0U, &dims);
  ret = *emlrtMxGetLogicals(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void init_simulink_io_address(InstanceStruct_14lqfvNiU50HKPCCIhdsB
  *moduleInstance)
{
  moduleInstance->emlrtRootTLSGlobal = (void *)cgxertGetEMLRTCtx
    (moduleInstance->S);
  moduleInstance->u0 = (uint8_T (*)[2])cgxertGetInputPortSignal
    (moduleInstance->S, 0);
}

/* CGXE Glue Code */
static void mdlOutputs_14lqfvNiU50HKPCCIhdsB(SimStruct *S, int_T tid)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_outputs(moduleInstance);
}

static void mdlInitialize_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_initialize(moduleInstance);
}

static void mdlUpdate_14lqfvNiU50HKPCCIhdsB(SimStruct *S, int_T tid)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_update(moduleInstance);
}

static mxArray* getSimState_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  mxArray* mxSS;
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  mxSS = (mxArray *) cgxe_mdl_get_sim_state(moduleInstance);
  return mxSS;
}

static void setSimState_14lqfvNiU50HKPCCIhdsB(SimStruct *S, const mxArray *ss)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_set_sim_state(moduleInstance, emlrtAlias(ss));
}

static void mdlTerminate_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_terminate(moduleInstance);
  free((void *)moduleInstance);
}

static void mdlEnable_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_enable(moduleInstance);
}

static void mdlDisable_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)cgxertGetRuntimeInstance(S);
  cgxe_mdl_disable(moduleInstance);
}

static void mdlStart_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
  InstanceStruct_14lqfvNiU50HKPCCIhdsB *moduleInstance =
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB *)calloc(1, sizeof
    (InstanceStruct_14lqfvNiU50HKPCCIhdsB));
  moduleInstance->S = S;
  cgxertSetRuntimeInstance(S, (void *)moduleInstance);
  ssSetmdlOutputs(S, mdlOutputs_14lqfvNiU50HKPCCIhdsB);
  ssSetmdlInitializeConditions(S, mdlInitialize_14lqfvNiU50HKPCCIhdsB);
  ssSetmdlUpdate(S, mdlUpdate_14lqfvNiU50HKPCCIhdsB);
  ssSetmdlTerminate(S, mdlTerminate_14lqfvNiU50HKPCCIhdsB);
  ssSetmdlEnable(S, mdlEnable_14lqfvNiU50HKPCCIhdsB);
  ssSetmdlDisable(S, mdlDisable_14lqfvNiU50HKPCCIhdsB);
  cgxe_mdl_start(moduleInstance);

  {
    uint_T options = ssGetOptions(S);
    options |= SS_OPTION_RUNTIME_EXCEPTION_FREE_CODE;
    ssSetOptions(S, options);
  }
}

static void mdlProcessParameters_14lqfvNiU50HKPCCIhdsB(SimStruct *S)
{
}

void method_dispatcher_14lqfvNiU50HKPCCIhdsB(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_14lqfvNiU50HKPCCIhdsB(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_14lqfvNiU50HKPCCIhdsB(S);
    break;

   case SS_CALL_MDL_GET_SIM_STATE:
    *((mxArray**) data) = getSimState_14lqfvNiU50HKPCCIhdsB(S);
    break;

   case SS_CALL_MDL_SET_SIM_STATE:
    setSimState_14lqfvNiU50HKPCCIhdsB(S, (const mxArray *) data);
    break;

   default:
    /* Unhandled method */
    /*
       sf_mex_error_message("Stateflow Internal Error:\n"
       "Error calling method dispatcher for module: 14lqfvNiU50HKPCCIhdsB.\n"
       "Can't handle method %d.\n", method);
     */
    break;
  }
}

mxArray *cgxe_14lqfvNiU50HKPCCIhdsB_BuildInfoUpdate(void)
{
  mxArray * mxBIArgs;
  mxArray * elem_1;
  mxArray * elem_2;
  mxArray * elem_3;
  mxArray * elem_4;
  mxArray * elem_5;
  mxArray * elem_6;
  mxArray * elem_7;
  mxArray * elem_8;
  mxArray * elem_9;
  mxArray * elem_10;
  mxArray * elem_11;
  mxArray * elem_12;
  mxArray * elem_13;
  mxArray * elem_14;
  mxBIArgs = mxCreateCellMatrix(1,3);
  elem_1 = mxCreateCellMatrix(1,6);
  elem_2 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,0,elem_2);
  elem_3 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,1,elem_3);
  elem_4 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,2,elem_4);
  elem_5 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,3,elem_5);
  elem_6 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,4,elem_6);
  elem_7 = mxCreateCellMatrix(0,0);
  mxSetCell(elem_1,5,elem_7);
  mxSetCell(mxBIArgs,0,elem_1);
  elem_8 = mxCreateCellMatrix(1,1);
  elem_9 = mxCreateString("codertarget.arduinobase.internal.arduino_SerialWrite");
  mxSetCell(elem_8,0,elem_9);
  mxSetCell(mxBIArgs,1,elem_8);
  elem_10 = mxCreateCellMatrix(1,1);
  elem_11 = mxCreateCellMatrix(1,2);
  elem_12 = mxCreateString("addDefines");
  mxSetCell(elem_11,0,elem_12);
  elem_13 = mxCreateCellMatrix(1,1);
  elem_14 = mxCreateString("_RTT_USE_SERIAL0_");
  mxSetCell(elem_13,0,elem_14);
  mxSetCell(elem_11,1,elem_13);
  mxSetCell(elem_10,0,elem_11);
  mxSetCell(mxBIArgs,2,elem_10);
  return mxBIArgs;
}

mxArray *cgxe_14lqfvNiU50HKPCCIhdsB_fallback_info(void)
{
  const char* fallbackInfoFields[] = { "fallbackType", "incompatiableSymbol" };

  mxArray* fallbackInfoStruct = mxCreateStructMatrix(1, 1, 2, fallbackInfoFields);
  mxArray* fallbackType = mxCreateString("thirdPartyLibs");
  mxArray* incompatibleSymbol = mxCreateString(
    "codertarget.arduinobase.internal.arduino_SerialWrite");
  mxSetFieldByNumber(fallbackInfoStruct, 0, 0, fallbackType);
  mxSetFieldByNumber(fallbackInfoStruct, 0, 1, incompatibleSymbol);
  return fallbackInfoStruct;
}
