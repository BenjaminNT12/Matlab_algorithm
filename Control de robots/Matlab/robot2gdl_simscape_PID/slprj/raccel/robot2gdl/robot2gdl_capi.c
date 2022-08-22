#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "robot2gdl_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)
#ifndef SS_UINT64
#define SS_UINT64 17
#endif
#ifndef SS_INT64
#define SS_INT64 18
#endif
#else
#include "builtin_typeid_types.h"
#include "robot2gdl.h"
#include "robot2gdl_capi.h"
#include "robot2gdl_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST
#define TARGET_STRING(s)               ((NULL))
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 0 , TARGET_STRING (
"robot2gdl/Condiciones iniciales " ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 ,
0 } , { 1 , 0 , TARGET_STRING ( "robot2gdl/q deseada" ) , TARGET_STRING ( ""
) , 0 , 0 , 1 , 0 , 0 } , { 2 , 1 , TARGET_STRING (
"robot2gdl/Subsystem1/MATLAB Function2" ) , TARGET_STRING ( "" ) , 0 , 0 , 2
, 0 , 1 } , { 3 , 0 , TARGET_STRING ( "robot2gdl/Subsystem1/Integrator" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 1 } , { 4 , 0 , TARGET_STRING (
"robot2gdl/Subsystem1/Integrator1" ) , TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 ,
1 } , { 5 , 2 , TARGET_STRING ( "robot2gdl/Subsystem2/MATLAB Function" ) ,
TARGET_STRING ( "" ) , 1 , 0 , 2 , 0 , 1 } , { 6 , 0 , TARGET_STRING (
"robot2gdl/Solver Configuration/EVAL_KEY/INPUT_1_1_1" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 1 } , { 7 , 0 , TARGET_STRING (
"robot2gdl/Solver Configuration/EVAL_KEY/INPUT_2_1_1" ) , TARGET_STRING ( ""
) , 0 , 0 , 0 , 0 , 1 } , { 8 , 4 , TARGET_STRING (
"robot2gdl/Subsystem2/Subsystem/MATLAB Function" ) , TARGET_STRING ( "" ) , 0
, 0 , 3 , 0 , 1 } , { 9 , 0 , TARGET_STRING (
"robot2gdl/Subsystem2/Subsystem/Integrator" ) , TARGET_STRING ( "" ) , 0 , 0
, 0 , 0 , 1 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 10 ,
TARGET_STRING ( "robot2gdl/Condiciones iniciales " ) , TARGET_STRING (
"Value" ) , 0 , 4 , 0 } , { 11 , TARGET_STRING ( "robot2gdl/Kp" ) ,
TARGET_STRING ( "Value" ) , 0 , 5 , 0 } , { 12 , TARGET_STRING (
"robot2gdl/Kv" ) , TARGET_STRING ( "Value" ) , 0 , 5 , 0 } , { 13 ,
TARGET_STRING ( "robot2gdl/Parametros" ) , TARGET_STRING ( "Value" ) , 0 , 6
, 0 } , { 14 , TARGET_STRING ( "robot2gdl/q deseada" ) , TARGET_STRING (
"Value" ) , 0 , 5 , 0 } , { 15 , TARGET_STRING (
"robot2gdl/Subsystem1/Integrator" ) , TARGET_STRING ( "InitialCondition" ) ,
0 , 5 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 } } ; static int_T
rt_LoggedStateIdxList [ ] = { - 1 } ; static const rtwCAPI_Signals
rtRootInputs [ ] = { { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } } ;
static const rtwCAPI_Signals rtRootOutputs [ ] = { { 0 , 0 , ( NULL ) , (
NULL ) , 0 , 0 , 0 , 0 , 0 } } ; static const rtwCAPI_ModelParameters
rtModelParameters [ ] = { { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . prvhqlpmmh [ 0 ] , & rtB .
nnvfcomjoj [ 0 ] , & rtB . ohadjvszql [ 0 ] , & rtB . pzys3c3qdq [ 0 ] , &
rtB . ilpz5lzbjy [ 0 ] , & rtB . peyoag2gkr [ 0 ] , & rtB . ddtbqhgr2f [ 0 ]
, & rtB . hxp03ks2pd [ 0 ] , & rtB . n2etycrhhn [ 0 ] , & rtB . gjrlwxjmfp [
0 ] , & rtP . Condicionesiniciales_Value [ 0 ] , & rtP . Kp_Value [ 0 ] , &
rtP . Kv_Value [ 0 ] , & rtP . Parametros_Value [ 0 ] , & rtP .
qdeseada_Value [ 0 ] , & rtP . Integrator_IC [ 0 ] , } ; static int32_T *
rtVarDimsAddrMap [ ] = { ( NULL ) } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , ( uint8_T ) SS_DOUBLE , 0 , 0 , 0 } }
;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_VECTOR , 0 , 2 , 0 } , { rtwCAPI_VECTOR , 2 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 4 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 6 , 2 ,
0 } , { rtwCAPI_VECTOR , 6 , 2 , 0 } , { rtwCAPI_VECTOR , 4 , 2 , 0 } , {
rtwCAPI_VECTOR , 8 , 2 , 0 } } ; static const uint_T rtDimensionArray [ ] = {
4 , 1 , 2 , 1 , 1 , 2 , 1 , 4 , 1 , 9 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.0 } ; static const rtwCAPI_FixPtMap rtFixPtMap [
] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , ( boolean_T ) 0
} , } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( NULL )
, ( NULL ) , 2 , 0 } , { ( const void * ) & rtcapiStoredFloats [ 0 ] , (
const void * ) & rtcapiStoredFloats [ 0 ] , ( int8_T ) 0 , ( uint8_T ) 0 } }
; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { { rtBlockSignals , 10 ,
rtRootInputs , 0 , rtRootOutputs , 0 } , { rtBlockParameters , 6 ,
rtModelParameters , 0 } , { ( NULL ) , 0 } , { rtDataTypeMap , rtDimensionMap
, rtFixPtMap , rtElementMap , rtSampleTimeMap , rtDimensionArray } , "float"
, { 1244520336U , 2207746453U , 1678397775U , 651792723U } , ( NULL ) , 0 , (
boolean_T ) 0 , rt_LoggedStateIdxList } ; const
rtwCAPI_ModelMappingStaticInfo * robot2gdl_GetCAPIStaticMap ( void ) { return
& mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void robot2gdl_InitializeDataMapInfo ( void ) { rtwCAPI_SetVersion ( ( *
rt_dataMapInfoPtr ) . mmi , 1 ) ; rtwCAPI_SetStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ; rtwCAPI_SetLoggingStaticMap ( ( *
rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ; rtwCAPI_SetDataAddressMap ( ( *
rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ; rtwCAPI_SetVarDimsAddressMap (
( * rt_dataMapInfoPtr ) . mmi , rtVarDimsAddrMap ) ;
rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi , 0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void robot2gdl_host_InitializeDataMapInfo ( robot2gdl_host_DataMapInfo_T *
dataMap , const char * path ) { rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ;
rtwCAPI_SetStaticMap ( dataMap -> mmi , & mmiStatic ) ;
rtwCAPI_SetDataAddressMap ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , ( NULL ) ) ; rtwCAPI_SetPath
( dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , ( NULL ) )
; rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
