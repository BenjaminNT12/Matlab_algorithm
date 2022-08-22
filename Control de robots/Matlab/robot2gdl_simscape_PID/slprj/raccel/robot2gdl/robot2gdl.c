#include "robot2gdl.h"
#include "rtwtypes.h"
#include "mwmathutil.h"
#include <stddef.h>
#include "robot2gdl_private.h"
#include "rt_logging_mmi.h"
#include "robot2gdl_capi.h"
#include "robot2gdl_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; void
raccelForceExtModeShutdown ( boolean_T extModeStartPktReceived ) { if ( !
extModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_sim_engine.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "9.7 (R2022a) 13-Nov-2021" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const int_T gblNumRootInportBlks = 0 ; const int_T
gblNumModelInputs = 0 ; extern const char * gblInportFileName ; extern
rtInportTUtable * gblInportTUtables ; const int_T gblInportDataTypeIdx [ ] =
{ - 1 } ; const int_T gblInportDims [ ] = { - 1 } ; const int_T
gblInportComplex [ ] = { - 1 } ; const int_T gblInportInterpoFlag [ ] = { - 1
} ; const int_T gblInportContinuous [ ] = { - 1 } ; int_T enableFcnCallFlag [
] = { 1 , 1 , 1 } ; const char * raccelLoadInputsAndAperiodicHitTimes (
SimStruct * S , const char * inportFileName , int * matFileFormat ) { return
rt_RAccelReadInportsMatFile ( S , inportFileName , matFileFormat ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
#include "simtarget/slSimTgtSLExecSimBridge.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void MdlInitialize ( void ) { boolean_T tmp ; rtDW . kvbwvy2tzn =
1 ; if ( ssIsFirstInitCond ( rtS ) ) { rtX . m2udml0gyp [ 0 ] =
3.1415926535897931 ; rtX . m2udml0gyp [ 1 ] = 0.0 ; rtX . m2udml0gyp [ 2 ] =
0.0 ; rtX . m2udml0gyp [ 3 ] = 0.0 ; tmp = slIsRapidAcceleratorSimulating ( )
; if ( tmp ) { tmp = ssGetGlobalInitialStatesAvailable ( rtS ) ; rtDW .
kvbwvy2tzn = ! tmp ; } else { rtDW . kvbwvy2tzn = 1 ; } rtX . ol3vg5ewpj [ 0
] = 1.5707963267948966 ; rtX . ol3vg5ewpj [ 1 ] = 0.0 ; } rtDW . dqg3ojebiv =
1 ; if ( ssIsFirstInitCond ( rtS ) ) { tmp = slIsRapidAcceleratorSimulating (
) ; if ( tmp ) { tmp = ssGetGlobalInitialStatesAvailable ( rtS ) ; rtDW .
dqg3ojebiv = ! tmp ; } else { rtDW . dqg3ojebiv = 1 ; } } rtX . b4kagz5lea [
0 ] = rtP . Integrator_IC [ 0 ] ; rtX . b4kagz5lea [ 1 ] = rtP .
Integrator_IC [ 1 ] ; } void MdlStart ( void ) { NeModelParameters
modelParameters ; NeslSimulationData * tmp_e ; NeslSimulator * tmp ;
NeuDiagnosticManager * diagnosticManager ; NeuDiagnosticTree * diagnosticTree
; char * msg ; real_T tmp_i ; int32_T tmp_m ; boolean_T tmp_p ; boolean_T val
; { bool externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} { { { bool isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU
srcInfo ; sdiLabelU loggedName = sdiGetLabelFromChars ( "Subsystem2:5" ) ;
sdiLabelU origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Subsystem2:5" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "robot2gdl/XY" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Subsystem2:5"
) ; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . ls3qwgm12i . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "fd7cb9f6-f8a6-453b-b276-6de1d10a4933" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . ls3qwgm12i . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . ls3qwgm12i . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . ls3qwgm12i . AQHandles , "Continuous" ,
0.0 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . ls3qwgm12i .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . ls3qwgm12i . AQHandles ,
ssGetTaskTime ( rtS , 0 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
ls3qwgm12i . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
ls3qwgm12i . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . ls3qwgm12i . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "Subsystem2:6" ) ; sdiLabelU
origSigName = sdiGetLabelFromChars ( "" ) ; sdiLabelU propName =
sdiGetLabelFromChars ( "Subsystem2:6" ) ; sdiLabelU blockPath =
sdiGetLabelFromChars ( "robot2gdl/XY" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "Subsystem2:6"
) ; sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 1 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . lgbdyd0ce0 . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "4cb13b6e-47e2-415a-bed6-86db89585e53" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . lgbdyd0ce0 . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . lgbdyd0ce0 . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . lgbdyd0ce0 . AQHandles , "Continuous" ,
0.0 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . lgbdyd0ce0 .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . lgbdyd0ce0 . AQHandles ,
ssGetTaskTime ( rtS , 0 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
lgbdyd0ce0 . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
lgbdyd0ce0 . AQHandles , loggedName , origSigName , propName ) ;
sdiAsyncRepoSetBlockPathDomain ( rtDW . lgbdyd0ce0 . AQHandles ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { } } } } { { { bool
isStreamoutAlreadyRegistered = false ; { sdiSignalSourceInfoU srcInfo ;
sdiLabelU loggedName = sdiGetLabelFromChars ( "" ) ; sdiLabelU origSigName =
sdiGetLabelFromChars ( "" ) ; sdiLabelU propName = sdiGetLabelFromChars ( ""
) ; sdiLabelU blockPath = sdiGetLabelFromChars (
"robot2gdl/Subsystem2/Subsystem/Demux" ) ; sdiLabelU blockSID =
sdiGetLabelFromChars ( "" ) ; sdiLabelU subPath = sdiGetLabelFromChars ( "" )
; sdiDims sigDims ; sdiLabelU sigName = sdiGetLabelFromChars ( "" ) ;
sdiAsyncRepoDataTypeHandle hDT = sdiAsyncRepoGetBuiltInDataTypeHandle (
DATA_TYPE_DOUBLE ) ; { sdiComplexity sigComplexity = REAL ;
sdiSampleTimeContinuity stCont = SAMPLE_TIME_CONTINUOUS ; int_T sigDimsArray
[ 1 ] = { 1 } ; sigDims . nDims = 1 ; sigDims . dimensions = sigDimsArray ;
srcInfo . numBlockPathElems = 1 ; srcInfo . fullBlockPath = ( sdiFullBlkPathU
) & blockPath ; srcInfo . SID = ( sdiSignalIDU ) & blockSID ; srcInfo .
subPath = subPath ; srcInfo . portIndex = 0 + 1 ; srcInfo . signalName =
sigName ; srcInfo . sigSourceUUID = 0 ; rtDW . ergfwfpfca . AQHandles =
sdiStartAsyncioQueueCreation ( hDT , & srcInfo , rt_dataMapInfo . mmi .
InstanceMap . fullPath , "2a03baa6-d7a8-4552-b99b-6390ff82e015" ,
sigComplexity , & sigDims , DIMENSIONS_MODE_FIXED , stCont , "1" ) ;
sdiCompleteAsyncioQueueCreation ( rtDW . ergfwfpfca . AQHandles , hDT , &
srcInfo ) ; if ( rtDW . ergfwfpfca . AQHandles ) {
sdiSetSignalSampleTimeString ( rtDW . ergfwfpfca . AQHandles , "Continuous" ,
0.0 , ssGetTFinal ( rtS ) ) ; sdiSetSignalRefRate ( rtDW . ergfwfpfca .
AQHandles , 0.0 ) ; sdiSetRunStartTime ( rtDW . ergfwfpfca . AQHandles ,
ssGetTaskTime ( rtS , 1 ) ) ; sdiAsyncRepoSetSignalExportSettings ( rtDW .
ergfwfpfca . AQHandles , 1 , 0 ) ; sdiAsyncRepoSetSignalExportName ( rtDW .
ergfwfpfca . AQHandles , loggedName , origSigName , propName ) ; }
sdiFreeLabel ( sigName ) ; sdiFreeLabel ( loggedName ) ; sdiFreeLabel (
origSigName ) ; sdiFreeLabel ( propName ) ; sdiFreeLabel ( blockPath ) ;
sdiFreeLabel ( blockSID ) ; sdiFreeLabel ( subPath ) ; } } if ( !
isStreamoutAlreadyRegistered ) { } } } } rtB . prvhqlpmmh [ 0 ] = rtP .
Condicionesiniciales_Value [ 0 ] ; rtB . prvhqlpmmh [ 1 ] = rtP .
Condicionesiniciales_Value [ 1 ] ; rtB . prvhqlpmmh [ 2 ] = rtP .
Condicionesiniciales_Value [ 2 ] ; rtB . prvhqlpmmh [ 3 ] = rtP .
Condicionesiniciales_Value [ 3 ] ; rtB . nnvfcomjoj [ 0 ] = rtP .
qdeseada_Value [ 0 ] ; rtB . nnvfcomjoj [ 1 ] = rtP . qdeseada_Value [ 1 ] ;
tmp = nesl_lease_simulator ( "robot2gdl/Solver Configuration_1" , 0 , 0 ) ;
rtDW . g2csmu2jmc = ( void * ) tmp ; tmp_p = pointer_is_null ( rtDW .
g2csmu2jmc ) ; if ( tmp_p ) { robot2gdl_a151ee3d_1_gateway ( ) ; tmp =
nesl_lease_simulator ( "robot2gdl/Solver Configuration_1" , 0 , 0 ) ; rtDW .
g2csmu2jmc = ( void * ) tmp ; } slsaSaveRawMemoryForSimTargetOP ( rtS ,
"robot2gdl/Solver Configuration_100" , ( void * * ) ( & rtDW . g2csmu2jmc ) ,
0U * sizeof ( real_T ) , nesl_save_simdata , nesl_restore_simdata ) ; tmp_e =
nesl_create_simulation_data ( ) ; rtDW . btwr3wazry = ( void * ) tmp_e ;
diagnosticManager = rtw_create_diagnostics ( ) ; rtDW . hnyrqku3t2 = ( void *
) diagnosticManager ; modelParameters . mSolverType = NE_SOLVER_TYPE_DAE ;
modelParameters . mSolverTolerance = 0.001 ; modelParameters . mSolverAbsTol
= 0.001 ; modelParameters . mSolverRelTol = 0.001 ; modelParameters .
mVariableStepSolver = true ; modelParameters . mIsUsingODEN = false ;
modelParameters . mSolverModifyAbsTol = NE_MODIFY_ABS_TOL_MAYBE ;
modelParameters . mFixedStepSize = 0.001 ; modelParameters . mStartTime = 0.0
; modelParameters . mLoadInitialState = false ; modelParameters .
mUseSimState = false ; modelParameters . mLinTrimCompile = false ;
modelParameters . mLoggingMode = SSC_LOGGING_NONE ; modelParameters .
mRTWModifiedTimeStamp = 5.72241433E+8 ; modelParameters . mZcDisabled = false
; tmp_i = 0.001 ; modelParameters . mSolverTolerance = tmp_i ; tmp_i = 0.0 ;
modelParameters . mFixedStepSize = tmp_i ; tmp_p = true ; modelParameters .
mVariableStepSolver = tmp_p ; tmp_p = false ; modelParameters . mIsUsingODEN
= tmp_p ; val = false ; tmp_p = slIsRapidAcceleratorSimulating ( ) ; if (
tmp_p ) { tmp_p = ssGetGlobalInitialStatesAvailable ( rtS ) ; val = ( tmp_p
&& ssIsFirstInitCond ( rtS ) ) ; } modelParameters . mLoadInitialState = val
; modelParameters . mZcDisabled = false ; diagnosticManager = (
NeuDiagnosticManager * ) rtDW . hnyrqku3t2 ; diagnosticTree =
neu_diagnostic_manager_get_initial_tree ( diagnosticManager ) ; tmp_m =
nesl_initialize_simulator ( ( NeslSimulator * ) rtDW . g2csmu2jmc , &
modelParameters , diagnosticManager ) ; if ( tmp_m != 0 ) { tmp_p =
error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if ( tmp_p ) { msg =
rtw_diagnostics_msg ( diagnosticTree ) ; ssSetErrorStatus ( rtS , msg ) ; } }
MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { NeslSimulationData *
simulationData ; NeuDiagnosticManager * diagnosticManager ; NeuDiagnosticTree
* diagnosticTree ; char * msg ; real_T tmp [ 8 ] ; real_T C_idx_2 ; real_T
invM_idx_0 ; real_T jbjyn51fsf ; real_T nprar3qrdt ; real_T time ; real_T
time_p ; real_T x_idx_1 ; real_T x_idx_2 ; real_T x_idx_3 ; int32_T tmp_e ;
int_T tmp_p [ 3 ] ; boolean_T first_output ; if ( ssIsModeUpdateTimeStep (
rtS ) ) { if ( rtDW . kvbwvy2tzn != 0 ) { rtX . m2udml0gyp [ 0 ] = rtB .
prvhqlpmmh [ 0 ] ; rtX . m2udml0gyp [ 1 ] = rtB . prvhqlpmmh [ 1 ] ; rtX .
m2udml0gyp [ 2 ] = rtB . prvhqlpmmh [ 2 ] ; rtX . m2udml0gyp [ 3 ] = rtB .
prvhqlpmmh [ 3 ] ; } rtB . gjrlwxjmfp [ 0 ] = rtX . m2udml0gyp [ 0 ] ; rtB .
gjrlwxjmfp [ 1 ] = rtX . m2udml0gyp [ 1 ] ; rtB . gjrlwxjmfp [ 2 ] = rtX .
m2udml0gyp [ 2 ] ; rtB . gjrlwxjmfp [ 3 ] = rtX . m2udml0gyp [ 3 ] ; if (
rtDW . dqg3ojebiv != 0 ) { rtX . ol3vg5ewpj [ 0 ] = rtB . nnvfcomjoj [ 0 ] ;
rtX . ol3vg5ewpj [ 1 ] = rtB . nnvfcomjoj [ 1 ] ; } rtB . ilpz5lzbjy [ 0 ] =
rtX . ol3vg5ewpj [ 0 ] ; rtB . ilpz5lzbjy [ 1 ] = rtX . ol3vg5ewpj [ 1 ] ; }
else { rtB . gjrlwxjmfp [ 0 ] = rtX . m2udml0gyp [ 0 ] ; rtB . gjrlwxjmfp [ 1
] = rtX . m2udml0gyp [ 1 ] ; rtB . gjrlwxjmfp [ 2 ] = rtX . m2udml0gyp [ 2 ]
; rtB . gjrlwxjmfp [ 3 ] = rtX . m2udml0gyp [ 3 ] ; rtB . ilpz5lzbjy [ 0 ] =
rtX . ol3vg5ewpj [ 0 ] ; rtB . ilpz5lzbjy [ 1 ] = rtX . ol3vg5ewpj [ 1 ] ; }
rtB . pzys3c3qdq [ 0 ] = rtX . b4kagz5lea [ 0 ] ; rtB . pzys3c3qdq [ 1 ] =
rtX . b4kagz5lea [ 1 ] ; rtB . bddqbpbmnl [ 0 ] = rtB . gjrlwxjmfp [ 0 ] ;
rtB . bddqbpbmnl [ 1 ] = rtB . gjrlwxjmfp [ 2 ] ; rtB . ekoss4waox [ 0 ] =
rtB . gjrlwxjmfp [ 1 ] ; rtB . ekoss4waox [ 1 ] = rtB . gjrlwxjmfp [ 3 ] ;
rtB . peyoag2gkr [ 0 ] = rtB . ilpz5lzbjy [ 0 ] - rtB . bddqbpbmnl [ 0 ] ;
rtB . peyoag2gkr [ 1 ] = rtB . ilpz5lzbjy [ 1 ] - rtB . bddqbpbmnl [ 1 ] ;
jbjyn51fsf = muDoubleScalarSin ( rtB . gjrlwxjmfp [ 0 ] + rtB . gjrlwxjmfp [
2 ] ) * 0.1458 + 0.1933 * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 0 ] ) ;
nprar3qrdt = - 0.1933 * muDoubleScalarCos ( rtB . gjrlwxjmfp [ 0 ] ) -
muDoubleScalarCos ( rtB . gjrlwxjmfp [ 0 ] + rtB . gjrlwxjmfp [ 2 ] ) *
0.1458 ; { if ( rtDW . ls3qwgm12i . AQHandles && ssGetLogOutput ( rtS ) ) {
sdiWriteSignal ( rtDW . ls3qwgm12i . AQHandles , ssGetTaskTime ( rtS , 0 ) ,
( char * ) & jbjyn51fsf + 0 ) ; } } { if ( rtDW . lgbdyd0ce0 . AQHandles &&
ssGetLogOutput ( rtS ) ) { sdiWriteSignal ( rtDW . lgbdyd0ce0 . AQHandles ,
ssGetTaskTime ( rtS , 0 ) , ( char * ) & nprar3qrdt + 0 ) ; } } x_idx_2 = ( (
( ( rtP . Parametros_Value [ 5 ] * rtP . Parametros_Value [ 5 ] * rtP .
Parametros_Value [ 2 ] + rtP . Parametros_Value [ 0 ] * rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] ) + rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 3 ] ) + 2.0 * rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarCos (
rtB . ilpz5lzbjy [ 1 ] ) ) + rtP . Parametros_Value [ 7 ] ) + rtP .
Parametros_Value [ 8 ] ; x_idx_1 = ( rtP . Parametros_Value [ 0 ] * rtP .
Parametros_Value [ 3 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarCos (
rtB . ilpz5lzbjy [ 1 ] ) + rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 3 ] ) + rtP .
Parametros_Value [ 8 ] ; x_idx_3 = ( rtP . Parametros_Value [ 0 ] * rtP .
Parametros_Value [ 3 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarCos (
rtB . ilpz5lzbjy [ 1 ] ) + rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 3 ] ) + rtP .
Parametros_Value [ 8 ] ; invM_idx_0 = rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 3 ] + rtP .
Parametros_Value [ 8 ] ; nprar3qrdt = - rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarSin (
rtB . ilpz5lzbjy [ 1 ] ) * rtB . pzys3c3qdq [ 1 ] ; C_idx_2 = rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 6 ] * muDoubleScalarSin ( rtB . ilpz5lzbjy [ 1 ] ) * ( rtB
. pzys3c3qdq [ 0 ] + rtB . pzys3c3qdq [ 1 ] ) ; if ( muDoubleScalarAbs (
x_idx_3 ) > muDoubleScalarAbs ( x_idx_2 ) ) { jbjyn51fsf = 1.0 / ( x_idx_2 /
x_idx_3 * invM_idx_0 - x_idx_1 ) ; invM_idx_0 = invM_idx_0 / x_idx_3 *
jbjyn51fsf ; jbjyn51fsf *= - x_idx_1 / x_idx_3 ; } else { jbjyn51fsf = 1.0 /
( invM_idx_0 - x_idx_3 / x_idx_2 * x_idx_1 ) ; invM_idx_0 = invM_idx_0 /
x_idx_2 * jbjyn51fsf ; jbjyn51fsf *= - x_idx_1 / x_idx_2 ; } jbjyn51fsf = (
nprar3qrdt * rtB . pzys3c3qdq [ 0 ] + C_idx_2 * rtB . pzys3c3qdq [ 1 ] ) *
invM_idx_0 + ( nprar3qrdt * rtB . pzys3c3qdq [ 0 ] + C_idx_2 * rtB .
pzys3c3qdq [ 1 ] ) * jbjyn51fsf ; rtB . ohadjvszql [ 0 ] = jbjyn51fsf ; rtB .
ohadjvszql [ 1 ] = jbjyn51fsf ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { { if (
rtDW . ergfwfpfca . AQHandles && ssGetLogOutput ( rtS ) ) { sdiWriteSignal (
rtDW . ergfwfpfca . AQHandles , ssGetTaskTime ( rtS , 1 ) , ( char * ) & rtB
. gjrlwxjmfp [ 0 ] + 0 ) ; } } } C_idx_2 = ( ( ( ( rtP . Parametros_Value [ 5
] * rtP . Parametros_Value [ 5 ] * rtP . Parametros_Value [ 2 ] + rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 0 ] * rtP .
Parametros_Value [ 3 ] ) + rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 3 ] ) + 2.0 * rtP .
Parametros_Value [ 3 ] * rtP . Parametros_Value [ 0 ] * rtP .
Parametros_Value [ 6 ] * muDoubleScalarCos ( rtB . gjrlwxjmfp [ 2 ] ) ) + rtP
. Parametros_Value [ 7 ] ) + rtP . Parametros_Value [ 8 ] ; x_idx_2 = ( rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 6 ] * muDoubleScalarCos ( rtB . gjrlwxjmfp [ 2 ] ) + rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 3 ] ) + rtP . Parametros_Value [ 8 ] ; x_idx_1 = ( rtP .
Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 6 ] * muDoubleScalarCos ( rtB . gjrlwxjmfp [ 2 ] ) + rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 3 ] ) + rtP . Parametros_Value [ 8 ] ; x_idx_3 = rtP .
Parametros_Value [ 6 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 3 ] + rtP . Parametros_Value [ 8 ] ; jbjyn51fsf = C_idx_2
* x_idx_3 - x_idx_2 * x_idx_1 ; nprar3qrdt = ( ( ( rtP . Parametros_Value [ 2
] * rtP . Parametros_Value [ 5 ] * rtP . Parametros_Value [ 4 ] *
muDoubleScalarSin ( rtB . bddqbpbmnl [ 0 ] ) * rtB . ekoss4waox [ 0 ] + ( (
rtB . pzys3c3qdq [ 0 ] - rtB . ekoss4waox [ 0 ] ) * rtP . Kv_Value [ 0 ] +
rtP . Kp_Value [ 0 ] * rtB . peyoag2gkr [ 0 ] ) ) - - rtP . Parametros_Value
[ 3 ] * rtP . Parametros_Value [ 0 ] * rtP . Parametros_Value [ 6 ] *
muDoubleScalarSin ( rtB . gjrlwxjmfp [ 2 ] ) * rtB . gjrlwxjmfp [ 3 ] * rtB .
gjrlwxjmfp [ 1 ] ) - rtP . Parametros_Value [ 0 ] * rtP . Parametros_Value [
3 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 2
] ) * ( rtB . gjrlwxjmfp [ 1 ] + rtB . gjrlwxjmfp [ 3 ] ) * rtB . gjrlwxjmfp
[ 3 ] ) - ( ( rtP . Parametros_Value [ 2 ] * rtP . Parametros_Value [ 5 ] +
rtP . Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] ) * rtP .
Parametros_Value [ 4 ] * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 0 ] ) + rtP .
Parametros_Value [ 3 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 4 ] * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 0 ] + rtB .
gjrlwxjmfp [ 2 ] ) ) ; invM_idx_0 = ( ( ( ( rtP . Parametros_Value [ 0 ] *
rtP . Parametros_Value [ 3 ] * rtP . Parametros_Value [ 4 ] *
muDoubleScalarSin ( rtB . bddqbpbmnl [ 0 ] ) * rtB . ekoss4waox [ 0 ] + rtP .
Parametros_Value [ 3 ] * rtP . Parametros_Value [ 6 ] * muDoubleScalarSin (
rtB . bddqbpbmnl [ 0 ] + rtB . bddqbpbmnl [ 1 ] ) * ( rtB . ekoss4waox [ 0 ]
+ rtB . ekoss4waox [ 1 ] ) ) + ( ( rtB . pzys3c3qdq [ 1 ] - rtB . ekoss4waox
[ 1 ] ) * rtP . Kv_Value [ 1 ] + rtP . Kp_Value [ 1 ] * rtB . peyoag2gkr [ 1
] ) ) - rtP . Parametros_Value [ 0 ] * rtP . Parametros_Value [ 3 ] * rtP .
Parametros_Value [ 6 ] * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 2 ] ) * rtB .
gjrlwxjmfp [ 1 ] * rtB . gjrlwxjmfp [ 1 ] ) - 0.0 * rtB . gjrlwxjmfp [ 3 ] )
- rtP . Parametros_Value [ 3 ] * rtP . Parametros_Value [ 6 ] * rtP .
Parametros_Value [ 4 ] * muDoubleScalarSin ( rtB . gjrlwxjmfp [ 0 ] + rtB .
gjrlwxjmfp [ 2 ] ) ; rtB . n2etycrhhn [ 0 ] = rtB . gjrlwxjmfp [ 1 ] ; rtB .
n2etycrhhn [ 1 ] = ( x_idx_3 * nprar3qrdt - x_idx_2 * invM_idx_0 ) /
jbjyn51fsf ; rtB . n2etycrhhn [ 2 ] = rtB . gjrlwxjmfp [ 3 ] ; rtB .
n2etycrhhn [ 3 ] = ( - x_idx_1 * nprar3qrdt + C_idx_2 * invM_idx_0 ) /
jbjyn51fsf ; if ( rtDW . i5c40be312 == 0.0 ) { rtDW . i5c40be312 = 1.0 ; rtX
. mnxhcap1mz [ 0 ] = rtB . gjrlwxjmfp [ 2 ] ; rtX . mnxhcap1mz [ 1 ] = 0.0 ;
} rtB . hxp03ks2pd [ 0 ] = rtX . mnxhcap1mz [ 0 ] ; rtB . hxp03ks2pd [ 1 ] =
rtX . mnxhcap1mz [ 1 ] ; rtB . hxp03ks2pd [ 2 ] = ( ( rtB . gjrlwxjmfp [ 2 ]
- rtX . mnxhcap1mz [ 0 ] ) * 1000.0 - 2.0 * rtX . mnxhcap1mz [ 1 ] ) * 1000.0
; rtB . hxp03ks2pd [ 3 ] = 0.0 ; if ( rtDW . fg2dllg1kd == 0.0 ) { rtDW .
fg2dllg1kd = 1.0 ; rtX . cj0mzwcxoy [ 0 ] = rtB . gjrlwxjmfp [ 0 ] ; rtX .
cj0mzwcxoy [ 1 ] = 0.0 ; } rtB . ddtbqhgr2f [ 0 ] = rtX . cj0mzwcxoy [ 0 ] ;
rtB . ddtbqhgr2f [ 1 ] = rtX . cj0mzwcxoy [ 1 ] ; rtB . ddtbqhgr2f [ 2 ] = (
( rtB . gjrlwxjmfp [ 0 ] - rtX . cj0mzwcxoy [ 0 ] ) * 1000.0 - 2.0 * rtX .
cj0mzwcxoy [ 1 ] ) * 1000.0 ; rtB . ddtbqhgr2f [ 3 ] = 0.0 ; simulationData =
( NeslSimulationData * ) rtDW . btwr3wazry ; time = ssGetT ( rtS ) ;
simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData -> mTime
. mX = & time ; simulationData -> mData -> mContStates . mN = 0 ;
simulationData -> mData -> mContStates . mX = NULL ; simulationData -> mData
-> mDiscStates . mN = 0 ; simulationData -> mData -> mDiscStates . mX = &
rtDW . kqnxrnu22n ; simulationData -> mData -> mModeVector . mN = 0 ;
simulationData -> mData -> mModeVector . mX = & rtDW . mnrjqlqlym ;
first_output = ( ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS ) ->
foundContZcEvents ) ; simulationData -> mData -> mFoundZcEvents =
first_output ; simulationData -> mData -> mIsMajorTimeStep =
ssIsMajorTimeStep ( rtS ) ; first_output = ( ssGetMdlInfoPtr ( rtS ) ->
mdlFlags . solverAssertCheck == 1U ) ; simulationData -> mData ->
mIsSolverAssertCheck = first_output ; first_output = ssIsSolverCheckingCIC (
rtS ) ; simulationData -> mData -> mIsSolverCheckingCIC = first_output ;
simulationData -> mData -> mIsComputingJacobian = false ; simulationData ->
mData -> mIsEvaluatingF0 = false ; first_output = ssIsSolverRequestingReset (
rtS ) ; simulationData -> mData -> mIsSolverRequestingReset = first_output ;
simulationData -> mData -> mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep (
rtS ) ; tmp_p [ 0 ] = 0 ; tmp [ 0 ] = rtB . hxp03ks2pd [ 0 ] ; tmp [ 1 ] =
rtB . hxp03ks2pd [ 1 ] ; tmp [ 2 ] = rtB . hxp03ks2pd [ 2 ] ; tmp [ 3 ] = rtB
. hxp03ks2pd [ 3 ] ; tmp_p [ 1 ] = 4 ; tmp [ 4 ] = rtB . ddtbqhgr2f [ 0 ] ;
tmp [ 5 ] = rtB . ddtbqhgr2f [ 1 ] ; tmp [ 6 ] = rtB . ddtbqhgr2f [ 2 ] ; tmp
[ 7 ] = rtB . ddtbqhgr2f [ 3 ] ; tmp_p [ 2 ] = 8 ; simulationData -> mData ->
mInputValues . mN = 8 ; simulationData -> mData -> mInputValues . mX = & tmp
[ 0 ] ; simulationData -> mData -> mInputOffsets . mN = 3 ; simulationData ->
mData -> mInputOffsets . mX = & tmp_p [ 0 ] ; simulationData -> mData ->
mOutputs . mN = 0 ; simulationData -> mData -> mOutputs . mX = NULL ;
simulationData -> mData -> mTolerances . mN = 0 ; simulationData -> mData ->
mTolerances . mX = NULL ; simulationData -> mData -> mCstateHasChanged =
false ; time_p = ssGetTaskTime ( rtS , 0 ) ; simulationData -> mData -> mTime
. mN = 1 ; simulationData -> mData -> mTime . mX = & time_p ; simulationData
-> mData -> mSampleHits . mN = 0 ; simulationData -> mData -> mSampleHits .
mX = NULL ; simulationData -> mData -> mIsFundamentalSampleHit = false ;
diagnosticManager = ( NeuDiagnosticManager * ) rtDW . hnyrqku3t2 ;
diagnosticTree = neu_diagnostic_manager_get_initial_tree ( diagnosticManager
) ; tmp_e = ne_simulator_method ( ( NeslSimulator * ) rtDW . g2csmu2jmc ,
NESL_SIM_OUTPUTS , simulationData , diagnosticManager ) ; if ( tmp_e != 0 ) {
first_output = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if (
first_output ) { msg = rtw_diagnostics_msg ( diagnosticTree ) ;
ssSetErrorStatus ( rtS , msg ) ; } } if ( ssIsMajorTimeStep ( rtS ) &&
simulationData -> mData -> mCstateHasChanged ) {
ssSetBlockStateForSolverChangedAtMajorStep ( rtS ) ; } UNUSED_PARAMETER ( tid
) ; } void MdlOutputsTID2 ( int_T tid ) { rtB . prvhqlpmmh [ 0 ] = rtP .
Condicionesiniciales_Value [ 0 ] ; rtB . prvhqlpmmh [ 1 ] = rtP .
Condicionesiniciales_Value [ 1 ] ; rtB . prvhqlpmmh [ 2 ] = rtP .
Condicionesiniciales_Value [ 2 ] ; rtB . prvhqlpmmh [ 3 ] = rtP .
Condicionesiniciales_Value [ 3 ] ; rtB . nnvfcomjoj [ 0 ] = rtP .
qdeseada_Value [ 0 ] ; rtB . nnvfcomjoj [ 1 ] = rtP . qdeseada_Value [ 1 ] ;
UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) {
NeslSimulationData * simulationData ; NeuDiagnosticManager *
diagnosticManager ; NeuDiagnosticTree * diagnosticTree ; char * msg ; real_T
tmp_p [ 8 ] ; real_T time ; int32_T tmp_i ; int_T tmp_e [ 3 ] ; boolean_T tmp
; rtDW . kvbwvy2tzn = 0 ; rtDW . dqg3ojebiv = 0 ; simulationData = (
NeslSimulationData * ) rtDW . btwr3wazry ; time = ssGetT ( rtS ) ;
simulationData -> mData -> mTime . mN = 1 ; simulationData -> mData -> mTime
. mX = & time ; simulationData -> mData -> mContStates . mN = 0 ;
simulationData -> mData -> mContStates . mX = NULL ; simulationData -> mData
-> mDiscStates . mN = 0 ; simulationData -> mData -> mDiscStates . mX = &
rtDW . kqnxrnu22n ; simulationData -> mData -> mModeVector . mN = 0 ;
simulationData -> mData -> mModeVector . mX = & rtDW . mnrjqlqlym ; tmp = (
ssIsMajorTimeStep ( rtS ) && ssGetRTWSolverInfo ( rtS ) -> foundContZcEvents
) ; simulationData -> mData -> mFoundZcEvents = tmp ; simulationData -> mData
-> mIsMajorTimeStep = ssIsMajorTimeStep ( rtS ) ; tmp = ( ssGetMdlInfoPtr (
rtS ) -> mdlFlags . solverAssertCheck == 1U ) ; simulationData -> mData ->
mIsSolverAssertCheck = tmp ; tmp = ssIsSolverCheckingCIC ( rtS ) ;
simulationData -> mData -> mIsSolverCheckingCIC = tmp ; simulationData ->
mData -> mIsComputingJacobian = false ; simulationData -> mData ->
mIsEvaluatingF0 = false ; tmp = ssIsSolverRequestingReset ( rtS ) ;
simulationData -> mData -> mIsSolverRequestingReset = tmp ; simulationData ->
mData -> mIsModeUpdateTimeStep = ssIsModeUpdateTimeStep ( rtS ) ; tmp_e [ 0 ]
= 0 ; tmp_p [ 0 ] = rtB . hxp03ks2pd [ 0 ] ; tmp_p [ 1 ] = rtB . hxp03ks2pd [
1 ] ; tmp_p [ 2 ] = rtB . hxp03ks2pd [ 2 ] ; tmp_p [ 3 ] = rtB . hxp03ks2pd [
3 ] ; tmp_e [ 1 ] = 4 ; tmp_p [ 4 ] = rtB . ddtbqhgr2f [ 0 ] ; tmp_p [ 5 ] =
rtB . ddtbqhgr2f [ 1 ] ; tmp_p [ 6 ] = rtB . ddtbqhgr2f [ 2 ] ; tmp_p [ 7 ] =
rtB . ddtbqhgr2f [ 3 ] ; tmp_e [ 2 ] = 8 ; simulationData -> mData ->
mInputValues . mN = 8 ; simulationData -> mData -> mInputValues . mX = &
tmp_p [ 0 ] ; simulationData -> mData -> mInputOffsets . mN = 3 ;
simulationData -> mData -> mInputOffsets . mX = & tmp_e [ 0 ] ;
diagnosticManager = ( NeuDiagnosticManager * ) rtDW . hnyrqku3t2 ;
diagnosticTree = neu_diagnostic_manager_get_initial_tree ( diagnosticManager
) ; tmp_i = ne_simulator_method ( ( NeslSimulator * ) rtDW . g2csmu2jmc ,
NESL_SIM_UPDATE , simulationData , diagnosticManager ) ; if ( tmp_i != 0 ) {
tmp = error_buffer_is_empty ( ssGetErrorStatus ( rtS ) ) ; if ( tmp ) { msg =
rtw_diagnostics_msg ( diagnosticTree ) ; ssSetErrorStatus ( rtS , msg ) ; } }
UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T tid ) {
UNUSED_PARAMETER ( tid ) ; } void MdlDerivatives ( void ) { XDot * _rtXdot ;
_rtXdot = ( ( XDot * ) ssGetdX ( rtS ) ) ; _rtXdot -> m2udml0gyp [ 0 ] = rtB
. n2etycrhhn [ 0 ] ; _rtXdot -> m2udml0gyp [ 1 ] = rtB . n2etycrhhn [ 1 ] ;
_rtXdot -> m2udml0gyp [ 2 ] = rtB . n2etycrhhn [ 2 ] ; _rtXdot -> m2udml0gyp
[ 3 ] = rtB . n2etycrhhn [ 3 ] ; _rtXdot -> ol3vg5ewpj [ 0 ] = rtB .
pzys3c3qdq [ 0 ] ; _rtXdot -> b4kagz5lea [ 0 ] = rtB . ohadjvszql [ 0 ] ;
_rtXdot -> ol3vg5ewpj [ 1 ] = rtB . pzys3c3qdq [ 1 ] ; _rtXdot -> b4kagz5lea
[ 1 ] = rtB . ohadjvszql [ 1 ] ; _rtXdot -> mnxhcap1mz [ 0 ] = rtX .
mnxhcap1mz [ 1 ] ; _rtXdot -> mnxhcap1mz [ 1 ] = ( ( rtB . gjrlwxjmfp [ 2 ] -
rtX . mnxhcap1mz [ 0 ] ) * 1000.0 - 2.0 * rtX . mnxhcap1mz [ 1 ] ) * 1000.0 ;
_rtXdot -> cj0mzwcxoy [ 0 ] = rtX . cj0mzwcxoy [ 1 ] ; _rtXdot -> cj0mzwcxoy
[ 1 ] = ( ( rtB . gjrlwxjmfp [ 0 ] - rtX . cj0mzwcxoy [ 0 ] ) * 1000.0 - 2.0
* rtX . cj0mzwcxoy [ 1 ] ) * 1000.0 ; } void MdlProjection ( void ) { } void
MdlTerminate ( void ) { neu_destroy_diagnostic_manager ( (
NeuDiagnosticManager * ) rtDW . hnyrqku3t2 ) ; nesl_destroy_simulation_data (
( NeslSimulationData * ) rtDW . btwr3wazry ) ; nesl_erase_simulator (
"robot2gdl/Solver Configuration_1" ) ; nesl_destroy_registry ( ) ; { if (
rtDW . ls3qwgm12i . AQHandles ) { sdiTerminateStreaming ( & rtDW . ls3qwgm12i
. AQHandles ) ; } } { if ( rtDW . lgbdyd0ce0 . AQHandles ) {
sdiTerminateStreaming ( & rtDW . lgbdyd0ce0 . AQHandles ) ; } } { if ( rtDW .
ergfwfpfca . AQHandles ) { sdiTerminateStreaming ( & rtDW . ergfwfpfca .
AQHandles ) ; } } } static void mr_robot2gdl_cacheDataAsMxArray ( mxArray *
destArray , mwIndex i , int j , const void * srcData , size_t numBytes ) ;
static void mr_robot2gdl_cacheDataAsMxArray ( mxArray * destArray , mwIndex i
, int j , const void * srcData , size_t numBytes ) { mxArray * newArray =
mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes , mxUINT8_CLASS ,
mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , ( const uint8_T *
) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i , j , newArray )
; } static void mr_robot2gdl_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ; static void
mr_robot2gdl_restoreDataFromMxArray ( void * destData , const mxArray *
srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( ( uint8_T * )
destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber ( srcArray , i
, j ) ) , numBytes ) ; } static void mr_robot2gdl_cacheBitFieldToMxArray (
mxArray * destArray , mwIndex i , int j , uint_T bitVal ) ; static void
mr_robot2gdl_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i , int j
, uint_T bitVal ) { mxSetFieldByNumber ( destArray , i , j ,
mxCreateDoubleScalar ( ( double ) bitVal ) ) ; } static uint_T
mr_robot2gdl_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) ; static uint_T
mr_robot2gdl_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) { const uint_T varVal = ( uint_T ) mxGetScalar (
mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( ( 1u << numBits
) - 1u ) ; } static void mr_robot2gdl_cacheDataToMxArrayWithOffset ( mxArray
* destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) ; static void mr_robot2gdl_cacheDataToMxArrayWithOffset (
mxArray * destArray , mwIndex i , int j , mwIndex offset , const void *
srcData , size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_robot2gdl_restoreDataFromMxArrayWithOffset ( void * destData , const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t numBytes ) ;
static void mr_robot2gdl_restoreDataFromMxArrayWithOffset ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) { const uint8_T * varData = ( const uint8_T * ) mxGetData (
mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData ,
( const uint8_T * ) & varData [ offset * numBytes ] , numBytes ) ; } static
void mr_robot2gdl_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) ; static void
mr_robot2gdl_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) { mxSetCell (
mxGetFieldByNumber ( destArray , i , j ) , offset , mxCreateDoubleScalar ( (
double ) fieldVal ) ) ; } static uint_T
mr_robot2gdl_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ; static
uint_T mr_robot2gdl_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) { const
uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell ( mxGetFieldByNumber (
srcArray , i , j ) , offset ) ) ; return fieldVal & ( ( 1u << numBits ) - 1u
) ; } mxArray * mr_robot2gdl_GetDWork ( ) { static const char *
ssDWFieldNames [ 3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX" , } ; mxArray * ssDW
= mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_robot2gdl_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) & ( rtB ) ,
sizeof ( rtB ) ) ; { static const char * rtdwDataFieldNames [ 9 ] = {
"rtDW.ek1sjukwvj" , "rtDW.i5c40be312" , "rtDW.jpyogbw4gc" , "rtDW.fg2dllg1kd"
, "rtDW.kqnxrnu22n" , "rtDW.kvbwvy2tzn" , "rtDW.dqg3ojebiv" ,
"rtDW.mnrjqlqlym" , "rtDW.mnxor4yhos" , } ; mxArray * rtdwData =
mxCreateStructMatrix ( 1 , 1 , 9 , rtdwDataFieldNames ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 0 , ( const void * ) & (
rtDW . ek1sjukwvj ) , sizeof ( rtDW . ek1sjukwvj ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 1 , ( const void * ) & (
rtDW . i5c40be312 ) , sizeof ( rtDW . i5c40be312 ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void * ) & (
rtDW . jpyogbw4gc ) , sizeof ( rtDW . jpyogbw4gc ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 3 , ( const void * ) & (
rtDW . fg2dllg1kd ) , sizeof ( rtDW . fg2dllg1kd ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 4 , ( const void * ) & (
rtDW . kqnxrnu22n ) , sizeof ( rtDW . kqnxrnu22n ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 5 , ( const void * ) & (
rtDW . kvbwvy2tzn ) , sizeof ( rtDW . kvbwvy2tzn ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 6 , ( const void * ) & (
rtDW . dqg3ojebiv ) , sizeof ( rtDW . dqg3ojebiv ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 7 , ( const void * ) & (
rtDW . mnrjqlqlym ) , sizeof ( rtDW . mnrjqlqlym ) ) ;
mr_robot2gdl_cacheDataAsMxArray ( rtdwData , 0 , 8 , ( const void * ) & (
rtDW . mnxor4yhos ) , sizeof ( rtDW . mnxor4yhos ) ) ; mxSetFieldByNumber (
ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void mr_robot2gdl_SetDWork (
const mxArray * ssDW ) { ( void ) ssDW ; mr_robot2gdl_restoreDataFromMxArray
( ( void * ) & ( rtB ) , ssDW , 0 , 0 , sizeof ( rtB ) ) ; { const mxArray *
rtdwData = mxGetFieldByNumber ( ssDW , 0 , 1 ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . ek1sjukwvj ) ,
rtdwData , 0 , 0 , sizeof ( rtDW . ek1sjukwvj ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . i5c40be312 ) ,
rtdwData , 0 , 1 , sizeof ( rtDW . i5c40be312 ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . jpyogbw4gc ) ,
rtdwData , 0 , 2 , sizeof ( rtDW . jpyogbw4gc ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . fg2dllg1kd ) ,
rtdwData , 0 , 3 , sizeof ( rtDW . fg2dllg1kd ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . kqnxrnu22n ) ,
rtdwData , 0 , 4 , sizeof ( rtDW . kqnxrnu22n ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . kvbwvy2tzn ) ,
rtdwData , 0 , 5 , sizeof ( rtDW . kvbwvy2tzn ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . dqg3ojebiv ) ,
rtdwData , 0 , 6 , sizeof ( rtDW . dqg3ojebiv ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . mnrjqlqlym ) ,
rtdwData , 0 , 7 , sizeof ( rtDW . mnrjqlqlym ) ) ;
mr_robot2gdl_restoreDataFromMxArray ( ( void * ) & ( rtDW . mnxor4yhos ) ,
rtdwData , 0 , 8 , sizeof ( rtDW . mnxor4yhos ) ) ; } } mxArray *
mr_robot2gdl_GetSimStateDisallowedBlocks ( ) { mxArray * data =
mxCreateCellMatrix ( 6 , 3 ) ; mwIndex subs [ 2 ] , offset ; { static const
char * blockType [ 6 ] = { "Scope" , "Scope" , "Scope" , "SimscapeSinkBlock"
, "SimscapeExecutionBlock" , "SimscapeExecutionBlock" , } ; static const char
* blockPath [ 6 ] = { "robot2gdl/Error" , "robot2gdl/q" , "robot2gdl/qp" ,
"robot2gdl/Solver Configuration/EVAL_KEY/SINK_1" ,
"robot2gdl/Solver Configuration/EVAL_KEY/STATE_1" ,
"robot2gdl/Solver Configuration/EVAL_KEY/STATE_1" , } ; static const int
reason [ 6 ] = { 0 , 0 , 0 , 0 , 0 , 6 , } ; for ( subs [ 0 ] = 0 ; subs [ 0
] < 6 ; ++ ( subs [ 0 ] ) ) { subs [ 1 ] = 0 ; offset = mxCalcSingleSubscript
( data , 2 , subs ) ; mxSetCell ( data , offset , mxCreateString ( blockType
[ subs [ 0 ] ] ) ) ; subs [ 1 ] = 1 ; offset = mxCalcSingleSubscript ( data ,
2 , subs ) ; mxSetCell ( data , offset , mxCreateString ( blockPath [ subs [
0 ] ] ) ) ; subs [ 1 ] = 2 ; offset = mxCalcSingleSubscript ( data , 2 , subs
) ; mxSetCell ( data , offset , mxCreateDoubleScalar ( ( double ) reason [
subs [ 0 ] ] ) ) ; } } return data ; } void MdlInitializeSizes ( void ) {
ssSetNumContStates ( rtS , 12 ) ; ssSetNumPeriodicContStates ( rtS , 0 ) ;
ssSetNumY ( rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS
, 0 ) ; ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 51 ) ;
ssSetNumBlockIO ( rtS , 12 ) ; ssSetNumBlockParams ( rtS , 21 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.0 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 1.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 1244520336U ) ; ssSetChecksumVal ( rtS , 1 ,
2207746453U ) ; ssSetChecksumVal ( rtS , 2 , 1678397775U ) ; ssSetChecksumVal
( rtS , 3 , 651792723U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; static struct _ssBlkInfo2 blkInfo2 ;
static struct _ssBlkInfoSLSize blkInfoSLSize ; ( void ) memset ( ( char * )
rtS , 0 , sizeof ( SimStruct ) ) ; ( void ) memset ( ( char * ) & mdlInfo , 0
, sizeof ( struct _ssMdlInfo ) ) ; ( void ) memset ( ( char * ) & blkInfo2 ,
0 , sizeof ( struct _ssBlkInfo2 ) ) ; ( void ) memset ( ( char * ) &
blkInfoSLSize , 0 , sizeof ( struct _ssBlkInfoSLSize ) ) ; ssSetBlkInfo2Ptr (
rtS , & blkInfo2 ) ; ssSetBlkInfoSLSizePtr ( rtS , & blkInfoSLSize ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; ssSetExecutionInfo ( rtS ,
executionInfo ) ; slsaAllocOPModelData ( rtS ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ;
( void ) memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = (
void * ) & rtDW ; ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork ,
0 , sizeof ( DW ) ) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset (
( char_T * ) & dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS
, & dtInfo ) ; dtInfo . numDataTypes = 22 ; dtInfo . dataTypeSizes = &
rtDataTypeSizes [ 0 ] ; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ;
dtInfo . BTransTable = & rtBTransTable ; dtInfo . PTransTable = &
rtPTransTable ; dtInfo . dataTypeInfoTable = rtDataTypeInfoTable ; }
robot2gdl_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive ( rtS ,
true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "robot2gdl" ) ; ssSetPath
( rtS , "robot2gdl" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal ( rtS , 1.5 )
; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ;
} { { static int_T rt_LoggedStateWidths [ ] = { 4 , 2 , 2 , 1 , 1 , 1 , 1 , 1
, 1 , 1 , 1 } ; static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 ,
1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 } ; static int_T rt_LoggedStateDimensions [ ] =
{ 4 , 2 , 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } ;
static BuiltInDTypeId rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE
, SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ; static int_T
rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
0 } ; static RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] =
{ ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL )
, ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ; static const char_T *
rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" , "CSTATE" , "CSTATE" ,
"CSTATE" , "CSTATE" , "CSTATE" , "Discrete" , "FirstOutput" , "Discrete" ,
"FirstOutput" } ; static const char_T * rt_LoggedStateBlockNames [ ] = {
"robot2gdl/Subsystem2/Subsystem/Integrator" ,
"robot2gdl/Subsystem1/Integrator1" , "robot2gdl/Subsystem1/Integrator" ,
"robot2gdl/Simulink-PS\nConverter1" , "robot2gdl/Simulink-PS\nConverter1" ,
"robot2gdl/Simulink-PS\nConverter" , "robot2gdl/Simulink-PS\nConverter" ,
"robot2gdl/Solver\nConfiguration/EVAL_KEY/INPUT_2_1_1" ,
"robot2gdl/Solver\nConfiguration/EVAL_KEY/INPUT_2_1_1" ,
"robot2gdl/Solver\nConfiguration/EVAL_KEY/INPUT_1_1_1" ,
"robot2gdl/Solver\nConfiguration/EVAL_KEY/INPUT_1_1_1" } ; static const
char_T * rt_LoggedStateNames [ ] = { "" , "" , "" ,
"robot2gdl.Simulink_PS_Converter1.outputFiltered_2491306807_0" ,
"robot2gdl.Simulink_PS_Converter1.outputFiltered_2491306807_1" ,
"robot2gdl.Simulink_PS_Converter.outputFiltered_3554552295_0" ,
"robot2gdl.Simulink_PS_Converter.outputFiltered_3554552295_1" , "Discrete" ,
"FirstOutput" , "Discrete" , "FirstOutput" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 }
; static RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] = { { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 ,
SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static int_T
rt_LoggedStateIdxList [ ] = { 0 , 1 , 2 , 3 , 4 , 0 , 1 , 2 , 3 } ; static
RTWLogSignalInfo rt_LoggedStateSignalInfo = { 11 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 11 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . m2udml0gyp [ 0 ] ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . ol3vg5ewpj [ 0 ] ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtX . b4kagz5lea [ 0 ] ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtX . mnxhcap1mz [ 0 ] ;
rt_LoggedStateSignalPtrs [ 4 ] = ( void * ) & rtX . mnxhcap1mz [ 1 ] ;
rt_LoggedStateSignalPtrs [ 5 ] = ( void * ) & rtX . cj0mzwcxoy [ 0 ] ;
rt_LoggedStateSignalPtrs [ 6 ] = ( void * ) & rtX . cj0mzwcxoy [ 1 ] ;
rt_LoggedStateSignalPtrs [ 7 ] = ( void * ) & rtDW . ek1sjukwvj ;
rt_LoggedStateSignalPtrs [ 8 ] = ( void * ) & rtDW . i5c40be312 ;
rt_LoggedStateSignalPtrs [ 9 ] = ( void * ) & rtDW . jpyogbw4gc ;
rt_LoggedStateSignalPtrs [ 10 ] = ( void * ) & rtDW . fg2dllg1kd ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"xFinal" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 12 ] ;
static real_T absTol [ 12 ] = { 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 ,
1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 , 1.0E-6 } ; static
uint8_T absTolControl [ 12 ] = { 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U , 0U ,
0U , 0U , 0U } ; static real_T contStateJacPerturbBoundMinVec [ 12 ] ; static
real_T contStateJacPerturbBoundMaxVec [ 12 ] ; { int i ; for ( i = 0 ; i < 12
; ++ i ) { contStateJacPerturbBoundMinVec [ i ] = 0 ;
contStateJacPerturbBoundMaxVec [ i ] = rtGetInf ( ) ; } } ssSetSolverRelTol (
rtS , 0.001 ) ; ssSetStepSize ( rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 )
; ssSetMaxNumMinSteps ( rtS , - 1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ;
ssSetMaxStepSize ( rtS , 0.03 ) ; ssSetSolverMaxOrder ( rtS , - 1 ) ;
ssSetSolverRefineFactor ( rtS , 1 ) ; ssSetOutputTimes ( rtS , ( NULL ) ) ;
ssSetNumOutputTimes ( rtS , 0 ) ; ssSetOutputTimesOnly ( rtS , 0 ) ;
ssSetOutputTimesIndex ( rtS , 0 ) ; ssSetZCCacheNeedsReset ( rtS , 0 ) ;
ssSetDerivCacheNeedsReset ( rtS , 0 ) ; ssSetNumNonContDerivSigInfos ( rtS ,
0 ) ; ssSetNonContDerivSigInfos ( rtS , ( NULL ) ) ; ssSetSolverInfo ( rtS ,
& slvrInfo ) ; ssSetSolverName ( rtS , "VariableStepAuto" ) ;
ssSetVariableStepSolver ( rtS , 1 ) ; ssSetSolverConsistencyChecking ( rtS ,
0 ) ; ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ;
ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetAbsTolVector ( rtS , absTol )
; ssSetAbsTolControlVector ( rtS , absTolControl ) ;
ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 1244520336U ) ; ssSetChecksumVal ( rtS , 1 ,
2207746453U ) ; ssSetChecksumVal ( rtS , 2 , 1678397775U ) ; ssSetChecksumVal
( rtS , 3 , 651792723U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 5 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_robot2gdl_GetSimStateDisallowedBlocks ) ; slsaGetWorkFcnForSimTargetOP (
rtS , mr_robot2gdl_GetDWork ) ; slsaSetWorkFcnForSimTargetOP ( rtS ,
mr_robot2gdl_SetDWork ) ; rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if (
ssGetErrorStatus ( rtS ) ) { return rtS ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { MdlOutputsTID2 ( tid ) ; }
