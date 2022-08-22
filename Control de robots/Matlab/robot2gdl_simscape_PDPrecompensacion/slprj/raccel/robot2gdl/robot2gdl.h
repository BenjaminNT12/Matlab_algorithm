#ifndef RTW_HEADER_robot2gdl_h_
#define RTW_HEADER_robot2gdl_h_
#ifndef robot2gdl_COMMON_INCLUDES_
#define robot2gdl_COMMON_INCLUDES_
#include <stdlib.h>
#include "sl_AsyncioQueue/AsyncioQueueCAPI.h"
#include "rtwtypes.h"
#include "sigstream_rtw.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging_simtarget.h"
#include "dt_info.h"
#include "ext_work.h"
#include "nesl_rtw.h"
#include "robot2gdl_a151ee3d_1_gateway.h"
#endif
#include "robot2gdl_types.h"
#include <stddef.h>
#include "rtw_modelmap_simtarget.h"
#include "rt_defines.h"
#include <string.h>
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME robot2gdl
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (12) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (12)   
#elif NCSTATES != 12
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T gjrlwxjmfp [ 4 ] ; real_T ilpz5lzbjy [ 2 ] ; real_T
pzys3c3qdq [ 2 ] ; real_T hxp03ks2pd [ 4 ] ; real_T ddtbqhgr2f [ 4 ] ; real_T
prvhqlpmmh [ 4 ] ; real_T nnvfcomjoj [ 2 ] ; real_T n2etycrhhn [ 4 ] ; real_T
bddqbpbmnl [ 2 ] ; real_T ekoss4waox [ 2 ] ; real_T peyoag2gkr [ 2 ] ; real_T
ohadjvszql [ 2 ] ; } B ; typedef struct { real_T ek1sjukwvj ; real_T
i5c40be312 ; real_T jpyogbw4gc ; real_T fg2dllg1kd ; real_T kqnxrnu22n ;
struct { void * LoggedData ; } guuazjd4zv ; struct { void * AQHandles ; }
ls3qwgm12i ; struct { void * AQHandles ; } lgbdyd0ce0 ; struct { void *
LoggedData ; } ean4z0g0t3 ; struct { void * LoggedData ; } c4xecnvbr0 ;
struct { void * AQHandles ; } ergfwfpfca ; void * jj15wusdsp ; void *
gtieekygwa ; void * a3331alv4v ; void * g2csmu2jmc ; void * btwr3wazry ; void
* hnyrqku3t2 ; void * jdrtkcdz0q ; void * bbgbvyvpvz ; int_T kvbwvy2tzn ;
int_T dqg3ojebiv ; int_T mnrjqlqlym ; boolean_T mnxor4yhos ; } DW ; typedef
struct { real_T m2udml0gyp [ 4 ] ; real_T ol3vg5ewpj [ 2 ] ; real_T
b4kagz5lea [ 2 ] ; real_T mnxhcap1mz [ 2 ] ; real_T cj0mzwcxoy [ 2 ] ; } X ;
typedef struct { real_T m2udml0gyp [ 4 ] ; real_T ol3vg5ewpj [ 2 ] ; real_T
b4kagz5lea [ 2 ] ; real_T mnxhcap1mz [ 2 ] ; real_T cj0mzwcxoy [ 2 ] ; } XDot
; typedef struct { boolean_T m2udml0gyp [ 4 ] ; boolean_T ol3vg5ewpj [ 2 ] ;
boolean_T b4kagz5lea [ 2 ] ; boolean_T mnxhcap1mz [ 2 ] ; boolean_T
cj0mzwcxoy [ 2 ] ; } XDis ; typedef struct { real_T m2udml0gyp [ 4 ] ; real_T
ol3vg5ewpj [ 2 ] ; real_T b4kagz5lea [ 2 ] ; real_T mnxhcap1mz [ 2 ] ; real_T
cj0mzwcxoy [ 2 ] ; } CStateAbsTol ; typedef struct { real_T m2udml0gyp [ 4 ]
; real_T ol3vg5ewpj [ 2 ] ; real_T b4kagz5lea [ 2 ] ; real_T mnxhcap1mz [ 2 ]
; real_T cj0mzwcxoy [ 2 ] ; } CXPtMin ; typedef struct { real_T m2udml0gyp [
4 ] ; real_T ol3vg5ewpj [ 2 ] ; real_T b4kagz5lea [ 2 ] ; real_T mnxhcap1mz [
2 ] ; real_T cj0mzwcxoy [ 2 ] ; } CXPtMax ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T
Integrator_IC [ 2 ] ; real_T Condicionesiniciales_Value [ 4 ] ; real_T
Kp_Value [ 2 ] ; real_T Kv_Value [ 2 ] ; real_T Parametros_Value [ 9 ] ;
real_T qdeseada_Value [ 2 ] ; } ; extern const char *
RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ; extern DW rtDW ;
extern P rtP ; extern mxArray * mr_robot2gdl_GetDWork ( ) ; extern void
mr_robot2gdl_SetDWork ( const mxArray * ssDW ) ; extern mxArray *
mr_robot2gdl_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * robot2gdl_GetCAPIStaticMap ( void ) ; extern
SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern const int_T
gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern rtInportTUtable
* gblInportTUtables ; extern const char * gblInportFileName ; extern const
int_T gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern
const int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) ;
#endif
