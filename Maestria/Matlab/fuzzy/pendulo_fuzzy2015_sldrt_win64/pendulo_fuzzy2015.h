/*
 * pendulo_fuzzy2015.h
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

#ifndef RTW_HEADER_pendulo_fuzzy2015_h_
#define RTW_HEADER_pendulo_fuzzy2015_h_
#include <math.h>
#include <string.h>
#ifndef pendulo_fuzzy2015_COMMON_INCLUDES_
# define pendulo_fuzzy2015_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "zero_crossing_types.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "dt_info.h"
#include "ext_work.h"
#include "sldrtdef.h"
#endif                                 /* pendulo_fuzzy2015_COMMON_INCLUDES_ */

#include "pendulo_fuzzy2015_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetBlkStateChangeFlag
# define rtmGetBlkStateChangeFlag(rtm) ((rtm)->ModelData.blkStateChange)
#endif

#ifndef rtmSetBlkStateChangeFlag
# define rtmSetBlkStateChangeFlag(rtm, val) ((rtm)->ModelData.blkStateChange = (val))
#endif

#ifndef rtmGetBlockIO
# define rtmGetBlockIO(rtm)            ((rtm)->ModelData.blockIO)
#endif

#ifndef rtmSetBlockIO
# define rtmSetBlockIO(rtm, val)       ((rtm)->ModelData.blockIO = (val))
#endif

#ifndef rtmGetChecksums
# define rtmGetChecksums(rtm)          ((rtm)->Sizes.checksums)
#endif

#ifndef rtmSetChecksums
# define rtmSetChecksums(rtm, val)     ((rtm)->Sizes.checksums = (val))
#endif

#ifndef rtmGetConstBlockIO
# define rtmGetConstBlockIO(rtm)       ((rtm)->ModelData.constBlockIO)
#endif

#ifndef rtmSetConstBlockIO
# define rtmSetConstBlockIO(rtm, val)  ((rtm)->ModelData.constBlockIO = (val))
#endif

#ifndef rtmGetContStateDisabled
# define rtmGetContStateDisabled(rtm)  ((rtm)->ModelData.contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
# define rtmSetContStateDisabled(rtm, val) ((rtm)->ModelData.contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
# define rtmGetContStates(rtm)         ((rtm)->ModelData.contStates)
#endif

#ifndef rtmSetContStates
# define rtmSetContStates(rtm, val)    ((rtm)->ModelData.contStates = (val))
#endif

#ifndef rtmGetDataMapInfo
# define rtmGetDataMapInfo(rtm)        ()
#endif

#ifndef rtmSetDataMapInfo
# define rtmSetDataMapInfo(rtm, val)   ()
#endif

#ifndef rtmGetDefaultParam
# define rtmGetDefaultParam(rtm)       ((rtm)->ModelData.defaultParam)
#endif

#ifndef rtmSetDefaultParam
# define rtmSetDefaultParam(rtm, val)  ((rtm)->ModelData.defaultParam = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
# define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->ModelData.derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
# define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->ModelData.derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetDirectFeedThrough
# define rtmGetDirectFeedThrough(rtm)  ((rtm)->Sizes.sysDirFeedThru)
#endif

#ifndef rtmSetDirectFeedThrough
# define rtmSetDirectFeedThrough(rtm, val) ((rtm)->Sizes.sysDirFeedThru = (val))
#endif

#ifndef rtmGetErrorStatusFlag
# define rtmGetErrorStatusFlag(rtm)    ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatusFlag
# define rtmSetErrorStatusFlag(rtm, val) ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmSetFinalTime
# define rtmSetFinalTime(rtm, val)     ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetFirstInitCondFlag
# define rtmGetFirstInitCondFlag(rtm)  ()
#endif

#ifndef rtmSetFirstInitCondFlag
# define rtmSetFirstInitCondFlag(rtm, val) ()
#endif

#ifndef rtmGetIntgData
# define rtmGetIntgData(rtm)           ((rtm)->ModelData.intgData)
#endif

#ifndef rtmSetIntgData
# define rtmSetIntgData(rtm, val)      ((rtm)->ModelData.intgData = (val))
#endif

#ifndef rtmGetMdlRefGlobalTID
# define rtmGetMdlRefGlobalTID(rtm)    ()
#endif

#ifndef rtmSetMdlRefGlobalTID
# define rtmSetMdlRefGlobalTID(rtm, val) ()
#endif

#ifndef rtmGetMdlRefTriggerTID
# define rtmGetMdlRefTriggerTID(rtm)   ()
#endif

#ifndef rtmSetMdlRefTriggerTID
# define rtmSetMdlRefTriggerTID(rtm, val) ()
#endif

#ifndef rtmGetModelMappingInfo
# define rtmGetModelMappingInfo(rtm)   ((rtm)->SpecialInfo.mappingInfo)
#endif

#ifndef rtmSetModelMappingInfo
# define rtmSetModelMappingInfo(rtm, val) ((rtm)->SpecialInfo.mappingInfo = (val))
#endif

#ifndef rtmGetModelName
# define rtmGetModelName(rtm)          ((rtm)->modelName)
#endif

#ifndef rtmSetModelName
# define rtmSetModelName(rtm, val)     ((rtm)->modelName = (val))
#endif

#ifndef rtmGetNonInlinedSFcns
# define rtmGetNonInlinedSFcns(rtm)    ()
#endif

#ifndef rtmSetNonInlinedSFcns
# define rtmSetNonInlinedSFcns(rtm, val) ()
#endif

#ifndef rtmGetNumBlockIO
# define rtmGetNumBlockIO(rtm)         ((rtm)->Sizes.numBlockIO)
#endif

#ifndef rtmSetNumBlockIO
# define rtmSetNumBlockIO(rtm, val)    ((rtm)->Sizes.numBlockIO = (val))
#endif

#ifndef rtmGetNumBlockParams
# define rtmGetNumBlockParams(rtm)     ((rtm)->Sizes.numBlockPrms)
#endif

#ifndef rtmSetNumBlockParams
# define rtmSetNumBlockParams(rtm, val) ((rtm)->Sizes.numBlockPrms = (val))
#endif

#ifndef rtmGetNumBlocks
# define rtmGetNumBlocks(rtm)          ((rtm)->Sizes.numBlocks)
#endif

#ifndef rtmSetNumBlocks
# define rtmSetNumBlocks(rtm, val)     ((rtm)->Sizes.numBlocks = (val))
#endif

#ifndef rtmGetNumContStates
# define rtmGetNumContStates(rtm)      ((rtm)->Sizes.numContStates)
#endif

#ifndef rtmSetNumContStates
# define rtmSetNumContStates(rtm, val) ((rtm)->Sizes.numContStates = (val))
#endif

#ifndef rtmGetNumDWork
# define rtmGetNumDWork(rtm)           ((rtm)->Sizes.numDwork)
#endif

#ifndef rtmSetNumDWork
# define rtmSetNumDWork(rtm, val)      ((rtm)->Sizes.numDwork = (val))
#endif

#ifndef rtmGetNumInputPorts
# define rtmGetNumInputPorts(rtm)      ((rtm)->Sizes.numIports)
#endif

#ifndef rtmSetNumInputPorts
# define rtmSetNumInputPorts(rtm, val) ((rtm)->Sizes.numIports = (val))
#endif

#ifndef rtmGetNumNonSampledZCs
# define rtmGetNumNonSampledZCs(rtm)   ((rtm)->Sizes.numNonSampZCs)
#endif

#ifndef rtmSetNumNonSampledZCs
# define rtmSetNumNonSampledZCs(rtm, val) ((rtm)->Sizes.numNonSampZCs = (val))
#endif

#ifndef rtmGetNumOutputPorts
# define rtmGetNumOutputPorts(rtm)     ((rtm)->Sizes.numOports)
#endif

#ifndef rtmSetNumOutputPorts
# define rtmSetNumOutputPorts(rtm, val) ((rtm)->Sizes.numOports = (val))
#endif

#ifndef rtmGetNumPeriodicContStates
# define rtmGetNumPeriodicContStates(rtm) ((rtm)->Sizes.numPeriodicContStates)
#endif

#ifndef rtmSetNumPeriodicContStates
# define rtmSetNumPeriodicContStates(rtm, val) ((rtm)->Sizes.numPeriodicContStates = (val))
#endif

#ifndef rtmGetNumSFcnParams
# define rtmGetNumSFcnParams(rtm)      ((rtm)->Sizes.numSFcnPrms)
#endif

#ifndef rtmSetNumSFcnParams
# define rtmSetNumSFcnParams(rtm, val) ((rtm)->Sizes.numSFcnPrms = (val))
#endif

#ifndef rtmGetNumSFunctions
# define rtmGetNumSFunctions(rtm)      ((rtm)->Sizes.numSFcns)
#endif

#ifndef rtmSetNumSFunctions
# define rtmSetNumSFunctions(rtm, val) ((rtm)->Sizes.numSFcns = (val))
#endif

#ifndef rtmGetNumSampleTimes
# define rtmGetNumSampleTimes(rtm)     ((rtm)->Sizes.numSampTimes)
#endif

#ifndef rtmSetNumSampleTimes
# define rtmSetNumSampleTimes(rtm, val) ((rtm)->Sizes.numSampTimes = (val))
#endif

#ifndef rtmGetNumU
# define rtmGetNumU(rtm)               ((rtm)->Sizes.numU)
#endif

#ifndef rtmSetNumU
# define rtmSetNumU(rtm, val)          ((rtm)->Sizes.numU = (val))
#endif

#ifndef rtmGetNumY
# define rtmGetNumY(rtm)               ((rtm)->Sizes.numY)
#endif

#ifndef rtmSetNumY
# define rtmSetNumY(rtm, val)          ((rtm)->Sizes.numY = (val))
#endif

#ifndef rtmGetOdeF
# define rtmGetOdeF(rtm)               ((rtm)->ModelData.odeF)
#endif

#ifndef rtmSetOdeF
# define rtmSetOdeF(rtm, val)          ((rtm)->ModelData.odeF = (val))
#endif

#ifndef rtmGetOdeY
# define rtmGetOdeY(rtm)               ((rtm)->ModelData.odeY)
#endif

#ifndef rtmSetOdeY
# define rtmSetOdeY(rtm, val)          ((rtm)->ModelData.odeY = (val))
#endif

#ifndef rtmGetOffsetTimeArray
# define rtmGetOffsetTimeArray(rtm)    ((rtm)->Timing.offsetTimesArray)
#endif

#ifndef rtmSetOffsetTimeArray
# define rtmSetOffsetTimeArray(rtm, val) ((rtm)->Timing.offsetTimesArray = (val))
#endif

#ifndef rtmGetOffsetTimePtr
# define rtmGetOffsetTimePtr(rtm)      ((rtm)->Timing.offsetTimes)
#endif

#ifndef rtmSetOffsetTimePtr
# define rtmSetOffsetTimePtr(rtm, val) ((rtm)->Timing.offsetTimes = (val))
#endif

#ifndef rtmGetOptions
# define rtmGetOptions(rtm)            ((rtm)->Sizes.options)
#endif

#ifndef rtmSetOptions
# define rtmSetOptions(rtm, val)       ((rtm)->Sizes.options = (val))
#endif

#ifndef rtmGetParamIsMalloced
# define rtmGetParamIsMalloced(rtm)    ()
#endif

#ifndef rtmSetParamIsMalloced
# define rtmSetParamIsMalloced(rtm, val) ()
#endif

#ifndef rtmGetPath
# define rtmGetPath(rtm)               ((rtm)->path)
#endif

#ifndef rtmSetPath
# define rtmSetPath(rtm, val)          ((rtm)->path = (val))
#endif

#ifndef rtmGetPerTaskSampleHits
# define rtmGetPerTaskSampleHits(rtm)  ()
#endif

#ifndef rtmSetPerTaskSampleHits
# define rtmSetPerTaskSampleHits(rtm, val) ()
#endif

#ifndef rtmGetPerTaskSampleHitsArray
# define rtmGetPerTaskSampleHitsArray(rtm) ((rtm)->Timing.perTaskSampleHitsArray)
#endif

#ifndef rtmSetPerTaskSampleHitsArray
# define rtmSetPerTaskSampleHitsArray(rtm, val) ((rtm)->Timing.perTaskSampleHitsArray = (val))
#endif

#ifndef rtmGetPerTaskSampleHitsPtr
# define rtmGetPerTaskSampleHitsPtr(rtm) ((rtm)->Timing.perTaskSampleHits)
#endif

#ifndef rtmSetPerTaskSampleHitsPtr
# define rtmSetPerTaskSampleHitsPtr(rtm, val) ((rtm)->Timing.perTaskSampleHits = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
# define rtmGetPeriodicContStateIndices(rtm) ((rtm)->ModelData.periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
# define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->ModelData.periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
# define rtmGetPeriodicContStateRanges(rtm) ((rtm)->ModelData.periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
# define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->ModelData.periodicContStateRanges = (val))
#endif

#ifndef rtmGetPrevZCSigState
# define rtmGetPrevZCSigState(rtm)     ((rtm)->ModelData.prevZCSigState)
#endif

#ifndef rtmSetPrevZCSigState
# define rtmSetPrevZCSigState(rtm, val) ((rtm)->ModelData.prevZCSigState = (val))
#endif

#ifndef rtmGetRTWExtModeInfo
# define rtmGetRTWExtModeInfo(rtm)     ((rtm)->extModeInfo)
#endif

#ifndef rtmSetRTWExtModeInfo
# define rtmSetRTWExtModeInfo(rtm, val) ((rtm)->extModeInfo = (val))
#endif

#ifndef rtmGetRTWGeneratedSFcn
# define rtmGetRTWGeneratedSFcn(rtm)   ((rtm)->Sizes.rtwGenSfcn)
#endif

#ifndef rtmSetRTWGeneratedSFcn
# define rtmSetRTWGeneratedSFcn(rtm, val) ((rtm)->Sizes.rtwGenSfcn = (val))
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ()
#endif

#ifndef rtmSetRTWLogInfo
# define rtmSetRTWLogInfo(rtm, val)    ()
#endif

#ifndef rtmGetRTWRTModelMethodsInfo
# define rtmGetRTWRTModelMethodsInfo(rtm) ()
#endif

#ifndef rtmSetRTWRTModelMethodsInfo
# define rtmSetRTWRTModelMethodsInfo(rtm, val) ()
#endif

#ifndef rtmGetRTWSfcnInfo
# define rtmGetRTWSfcnInfo(rtm)        ((rtm)->sfcnInfo)
#endif

#ifndef rtmSetRTWSfcnInfo
# define rtmSetRTWSfcnInfo(rtm, val)   ((rtm)->sfcnInfo = (val))
#endif

#ifndef rtmGetRTWSolverInfo
# define rtmGetRTWSolverInfo(rtm)      ((rtm)->solverInfo)
#endif

#ifndef rtmSetRTWSolverInfo
# define rtmSetRTWSolverInfo(rtm, val) ((rtm)->solverInfo = (val))
#endif

#ifndef rtmGetRTWSolverInfoPtr
# define rtmGetRTWSolverInfoPtr(rtm)   ((rtm)->solverInfoPtr)
#endif

#ifndef rtmSetRTWSolverInfoPtr
# define rtmSetRTWSolverInfoPtr(rtm, val) ((rtm)->solverInfoPtr = (val))
#endif

#ifndef rtmGetReservedForXPC
# define rtmGetReservedForXPC(rtm)     ((rtm)->SpecialInfo.xpcData)
#endif

#ifndef rtmSetReservedForXPC
# define rtmSetReservedForXPC(rtm, val) ((rtm)->SpecialInfo.xpcData = (val))
#endif

#ifndef rtmGetRootDWork
# define rtmGetRootDWork(rtm)          ((rtm)->ModelData.dwork)
#endif

#ifndef rtmSetRootDWork
# define rtmSetRootDWork(rtm, val)     ((rtm)->ModelData.dwork = (val))
#endif

#ifndef rtmGetSFunctions
# define rtmGetSFunctions(rtm)         ((rtm)->childSfunctions)
#endif

#ifndef rtmSetSFunctions
# define rtmSetSFunctions(rtm, val)    ((rtm)->childSfunctions = (val))
#endif

#ifndef rtmGetSampleHitArray
# define rtmGetSampleHitArray(rtm)     ((rtm)->Timing.sampleHitArray)
#endif

#ifndef rtmSetSampleHitArray
# define rtmSetSampleHitArray(rtm, val) ((rtm)->Timing.sampleHitArray = (val))
#endif

#ifndef rtmGetSampleHitPtr
# define rtmGetSampleHitPtr(rtm)       ((rtm)->Timing.sampleHits)
#endif

#ifndef rtmSetSampleHitPtr
# define rtmSetSampleHitPtr(rtm, val)  ((rtm)->Timing.sampleHits = (val))
#endif

#ifndef rtmGetSampleTimeArray
# define rtmGetSampleTimeArray(rtm)    ((rtm)->Timing.sampleTimesArray)
#endif

#ifndef rtmSetSampleTimeArray
# define rtmSetSampleTimeArray(rtm, val) ((rtm)->Timing.sampleTimesArray = (val))
#endif

#ifndef rtmGetSampleTimePtr
# define rtmGetSampleTimePtr(rtm)      ((rtm)->Timing.sampleTimes)
#endif

#ifndef rtmSetSampleTimePtr
# define rtmSetSampleTimePtr(rtm, val) ((rtm)->Timing.sampleTimes = (val))
#endif

#ifndef rtmGetSampleTimeTaskIDArray
# define rtmGetSampleTimeTaskIDArray(rtm) ((rtm)->Timing.sampleTimeTaskIDArray)
#endif

#ifndef rtmSetSampleTimeTaskIDArray
# define rtmSetSampleTimeTaskIDArray(rtm, val) ((rtm)->Timing.sampleTimeTaskIDArray = (val))
#endif

#ifndef rtmGetSampleTimeTaskIDPtr
# define rtmGetSampleTimeTaskIDPtr(rtm) ((rtm)->Timing.sampleTimeTaskIDPtr)
#endif

#ifndef rtmSetSampleTimeTaskIDPtr
# define rtmSetSampleTimeTaskIDPtr(rtm, val) ((rtm)->Timing.sampleTimeTaskIDPtr = (val))
#endif

#ifndef rtmGetSimMode
# define rtmGetSimMode(rtm)            ((rtm)->simMode)
#endif

#ifndef rtmSetSimMode
# define rtmSetSimMode(rtm, val)       ((rtm)->simMode = (val))
#endif

#ifndef rtmGetSimTimeStep
# define rtmGetSimTimeStep(rtm)        ((rtm)->Timing.simTimeStep)
#endif

#ifndef rtmSetSimTimeStep
# define rtmSetSimTimeStep(rtm, val)   ((rtm)->Timing.simTimeStep = (val))
#endif

#ifndef rtmGetStartTime
# define rtmGetStartTime(rtm)          ((rtm)->Timing.tStart)
#endif

#ifndef rtmSetStartTime
# define rtmSetStartTime(rtm, val)     ((rtm)->Timing.tStart = (val))
#endif

#ifndef rtmGetStepSize
# define rtmGetStepSize(rtm)           ((rtm)->Timing.stepSize)
#endif

#ifndef rtmSetStepSize
# define rtmSetStepSize(rtm, val)      ((rtm)->Timing.stepSize = (val))
#endif

#ifndef rtmGetStopRequestedFlag
# define rtmGetStopRequestedFlag(rtm)  ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequestedFlag
# define rtmSetStopRequestedFlag(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetTaskCounters
# define rtmGetTaskCounters(rtm)       ()
#endif

#ifndef rtmSetTaskCounters
# define rtmSetTaskCounters(rtm, val)  ()
#endif

#ifndef rtmGetTaskTimeArray
# define rtmGetTaskTimeArray(rtm)      ((rtm)->Timing.tArray)
#endif

#ifndef rtmSetTaskTimeArray
# define rtmSetTaskTimeArray(rtm, val) ((rtm)->Timing.tArray = (val))
#endif

#ifndef rtmGetTimePtr
# define rtmGetTimePtr(rtm)            ((rtm)->Timing.t)
#endif

#ifndef rtmSetTimePtr
# define rtmSetTimePtr(rtm, val)       ((rtm)->Timing.t = (val))
#endif

#ifndef rtmGetTimingData
# define rtmGetTimingData(rtm)         ((rtm)->Timing.timingData)
#endif

#ifndef rtmSetTimingData
# define rtmSetTimingData(rtm, val)    ((rtm)->Timing.timingData = (val))
#endif

#ifndef rtmGetU
# define rtmGetU(rtm)                  ((rtm)->ModelData.inputs)
#endif

#ifndef rtmSetU
# define rtmSetU(rtm, val)             ((rtm)->ModelData.inputs = (val))
#endif

#ifndef rtmGetVarNextHitTimesListPtr
# define rtmGetVarNextHitTimesListPtr(rtm) ((rtm)->Timing.varNextHitTimesList)
#endif

#ifndef rtmSetVarNextHitTimesListPtr
# define rtmSetVarNextHitTimesListPtr(rtm, val) ((rtm)->Timing.varNextHitTimesList = (val))
#endif

#ifndef rtmGetY
# define rtmGetY(rtm)                  ((rtm)->ModelData.outputs)
#endif

#ifndef rtmSetY
# define rtmSetY(rtm, val)             ((rtm)->ModelData.outputs = (val))
#endif

#ifndef rtmGetZCCacheNeedsReset
# define rtmGetZCCacheNeedsReset(rtm)  ((rtm)->ModelData.zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
# define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->ModelData.zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetZCSignalValues
# define rtmGetZCSignalValues(rtm)     ((rtm)->ModelData.zcSignalValues)
#endif

#ifndef rtmSetZCSignalValues
# define rtmSetZCSignalValues(rtm, val) ((rtm)->ModelData.zcSignalValues = (val))
#endif

#ifndef rtmGet_TimeOfLastOutput
# define rtmGet_TimeOfLastOutput(rtm)  ((rtm)->Timing.timeOfLastOutput)
#endif

#ifndef rtmSet_TimeOfLastOutput
# define rtmSet_TimeOfLastOutput(rtm, val) ((rtm)->Timing.timeOfLastOutput = (val))
#endif

#ifndef rtmGetdX
# define rtmGetdX(rtm)                 ((rtm)->ModelData.derivs)
#endif

#ifndef rtmSetdX
# define rtmSetdX(rtm, val)            ((rtm)->ModelData.derivs = (val))
#endif

#ifndef rtmGetChecksumVal
# define rtmGetChecksumVal(rtm, idx)   ((rtm)->Sizes.checksums[idx])
#endif

#ifndef rtmSetChecksumVal
# define rtmSetChecksumVal(rtm, idx, val) ((rtm)->Sizes.checksums[idx] = (val))
#endif

#ifndef rtmGetDWork
# define rtmGetDWork(rtm, idx)         ((rtm)->ModelData.dwork[idx])
#endif

#ifndef rtmSetDWork
# define rtmSetDWork(rtm, idx, val)    ((rtm)->ModelData.dwork[idx] = (val))
#endif

#ifndef rtmGetOffsetTime
# define rtmGetOffsetTime(rtm, idx)    ((rtm)->Timing.offsetTimes[idx])
#endif

#ifndef rtmSetOffsetTime
# define rtmSetOffsetTime(rtm, idx, val) ((rtm)->Timing.offsetTimes[idx] = (val))
#endif

#ifndef rtmGetSFunction
# define rtmGetSFunction(rtm, idx)     ((rtm)->childSfunctions[idx])
#endif

#ifndef rtmSetSFunction
# define rtmSetSFunction(rtm, idx, val) ((rtm)->childSfunctions[idx] = (val))
#endif

#ifndef rtmGetSampleTime
# define rtmGetSampleTime(rtm, idx)    ((rtm)->Timing.sampleTimes[idx])
#endif

#ifndef rtmSetSampleTime
# define rtmSetSampleTime(rtm, idx, val) ((rtm)->Timing.sampleTimes[idx] = (val))
#endif

#ifndef rtmGetSampleTimeTaskID
# define rtmGetSampleTimeTaskID(rtm, idx) ((rtm)->Timing.sampleTimeTaskIDPtr[idx])
#endif

#ifndef rtmSetSampleTimeTaskID
# define rtmSetSampleTimeTaskID(rtm, idx, val) ((rtm)->Timing.sampleTimeTaskIDPtr[idx] = (val))
#endif

#ifndef rtmGetVarNextHitTimeList
# define rtmGetVarNextHitTimeList(rtm, idx) ((rtm)->Timing.varNextHitTimesList[idx])
#endif

#ifndef rtmSetVarNextHitTimeList
# define rtmSetVarNextHitTimeList(rtm, idx, val) ((rtm)->Timing.varNextHitTimesList[idx] = (val))
#endif

#ifndef rtmIsContinuousTask
# define rtmIsContinuousTask(rtm, tid) ((tid) == 0)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmIsMajorTimeStep
# define rtmIsMajorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
# define rtmIsMinorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmIsSampleHit
# define rtmIsSampleHit(rtm, sti, tid) ((rtmIsMajorTimeStep((rtm)) && (rtm)->Timing.sampleHits[(rtm)->Timing.sampleTimeTaskIDPtr[sti]]))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmSetT
# define rtmSetT(rtm, val)                                       /* Do Nothing */
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

#ifndef rtmSetTPtr
# define rtmSetTPtr(rtm, val)          ((rtm)->Timing.t = (val))
#endif

#ifndef rtmGetTStart
# define rtmGetTStart(rtm)             ((rtm)->Timing.tStart)
#endif

#ifndef rtmSetTStart
# define rtmSetTStart(rtm, val)        ((rtm)->Timing.tStart = (val))
#endif

#ifndef rtmGetTaskTime
# define rtmGetTaskTime(rtm, sti)      (rtmGetTPtr((rtm))[(rtm)->Timing.sampleTimeTaskIDPtr[sti]])
#endif

#ifndef rtmSetTaskTime
# define rtmSetTaskTime(rtm, sti, val) (rtmGetTPtr((rtm))[sti] = (val))
#endif

#ifndef rtmGetTimeOfLastOutput
# define rtmGetTimeOfLastOutput(rtm)   ((rtm)->Timing.timeOfLastOutput)
#endif

#ifdef rtmGetRTWSolverInfo
#undef rtmGetRTWSolverInfo
#endif

#define rtmGetRTWSolverInfo(rtm)       &((rtm)->solverInfo)

/* Definition for use in the target main file */
#define pendulo_fuzzy2015_rtModel      RT_MODEL_pendulo_fuzzy2015_T

/* Block signals for system '<S54>/If Action Subsystem' */
typedef struct {
  real_T In1;                          /* '<S55>/In1' */
} B_IfActionSubsystem_pendulo_fuzzy2015_T;

/* Block states (auto storage) for system '<S54>/If Action Subsystem' */
typedef struct {
  int8_T IfActionSubsystem_SubsysRanBC;/* '<S54>/If Action Subsystem' */
} DW_IfActionSubsystem_pendulo_fuzzy2015_T;

/* Block signals (auto storage) */
typedef struct {
  real_T TransferFcn3;                 /* '<S4>/Transfer Fcn3' */
  real_T TransferFcn4;                 /* '<S4>/Transfer Fcn4' */
  real_T TransferFcn2;                 /* '<S4>/Transfer Fcn2' */
  real_T TransferFcn1;                 /* '<S4>/Transfer Fcn1' */
  real_T Merge;                        /* '<S6>/Merge' */
  real_T Switch;                       /* '<S5>/Switch' */
  real_T Product4;                     /* '<S4>/Product4' */
  real_T Product5;                     /* '<S4>/Product5' */
  real_T Product6;                     /* '<S4>/Product6' */
  real_T SumofElements;                /* '<S4>/Sum of Elements' */
  real_T Derivative2;                  /* '<S4>/Derivative2' */
  real_T Add;                          /* '<S4>/Add' */
  real_T Derivative3;                  /* '<S4>/Derivative3' */
  real_T Saturation;                   /* '<Root>/Saturation' */
  real_T kf[4];                        /* '<Root>/MATLAB Function1' */
  B_IfActionSubsystem_pendulo_fuzzy2015_T IfActionSubsystem1;/* '<S54>/If Action Subsystem1' */
  B_IfActionSubsystem_pendulo_fuzzy2015_T IfActionSubsystem;/* '<S54>/If Action Subsystem' */
} B_pendulo_fuzzy2015_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  real_T TimeStampA;                   /* '<S4>/Derivative2' */
  real_T LastUAtTimeA;                 /* '<S4>/Derivative2' */
  real_T TimeStampB;                   /* '<S4>/Derivative2' */
  real_T LastUAtTimeB;                 /* '<S4>/Derivative2' */
  real_T TimeStampA_k;                 /* '<S4>/Derivative3' */
  real_T LastUAtTimeA_m;               /* '<S4>/Derivative3' */
  real_T TimeStampB_i;                 /* '<S4>/Derivative3' */
  real_T LastUAtTimeB_m;               /* '<S4>/Derivative3' */
  void *AnalogOutput_PWORK;            /* '<S4>/Analog Output' */
  void *AnalogOutput1_PWORK;           /* '<S4>/Analog Output1' */
  void *AnalogInput_PWORK;             /* '<S4>/Analog Input' */
  void *AnalogInput1_PWORK;            /* '<S4>/Analog Input1' */
  struct {
    void *LoggedData;
  } Scope2_PWORK;                      /* '<S4>/Scope2' */

  struct {
    void *LoggedData;
  } Scope3_PWORK;                      /* '<S4>/Scope3' */

  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<S4>/Scope' */

  struct {
    void *LoggedData[4];
  } Et2_PWORK;                         /* '<Root>/E(t)2' */

  struct {
    void *LoggedData[2];
  } Et3_PWORK;                         /* '<Root>/E(t)3' */

  int8_T If_ActiveSubsystem;           /* '<S6>/If' */
  int8_T ActionOne_SubsysRanBC;        /* '<S6>/Action: One' */
  int8_T Actionu1_SubsysRanBC;         /* '<S6>/Action: u1' */
  int8_T If_ActiveSubsystem_f;         /* '<S54>/If' */
  DW_IfActionSubsystem_pendulo_fuzzy2015_T IfActionSubsystem1;/* '<S54>/If Action Subsystem1' */
  DW_IfActionSubsystem_pendulo_fuzzy2015_T IfActionSubsystem;/* '<S54>/If Action Subsystem' */
} DW_pendulo_fuzzy2015_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T TransferFcn3_CSTATE;          /* '<S4>/Transfer Fcn3' */
  real_T TransferFcn4_CSTATE;          /* '<S4>/Transfer Fcn4' */
  real_T TransferFcn2_CSTATE;          /* '<S4>/Transfer Fcn2' */
  real_T TransferFcn1_CSTATE;          /* '<S4>/Transfer Fcn1' */
} X_pendulo_fuzzy2015_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T TransferFcn3_CSTATE;          /* '<S4>/Transfer Fcn3' */
  real_T TransferFcn4_CSTATE;          /* '<S4>/Transfer Fcn4' */
  real_T TransferFcn2_CSTATE;          /* '<S4>/Transfer Fcn2' */
  real_T TransferFcn1_CSTATE;          /* '<S4>/Transfer Fcn1' */
} XDot_pendulo_fuzzy2015_T;

/* State disabled  */
typedef struct {
  boolean_T TransferFcn3_CSTATE;       /* '<S4>/Transfer Fcn3' */
  boolean_T TransferFcn4_CSTATE;       /* '<S4>/Transfer Fcn4' */
  boolean_T TransferFcn2_CSTATE;       /* '<S4>/Transfer Fcn2' */
  boolean_T TransferFcn1_CSTATE;       /* '<S4>/Transfer Fcn1' */
} XDis_pendulo_fuzzy2015_T;

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
} ODE3_IntgData;

#endif

/* Backward compatible GRT Identifiers */
#define rtB                            pendulo_fuzzy2015_B
#define BlockIO                        B_pendulo_fuzzy2015_T
#define rtX                            pendulo_fuzzy2015_X
#define ContinuousStates               X_pendulo_fuzzy2015_T
#define rtXdot                         pendulo_fuzzy2015_XDot
#define StateDerivatives               XDot_pendulo_fuzzy2015_T
#define tXdis                          pendulo_fuzzy2015_XDis
#define StateDisabled                  XDis_pendulo_fuzzy2015_T
#define rtP                            pendulo_fuzzy2015_P
#define Parameters                     P_pendulo_fuzzy2015_T
#define rtDWork                        pendulo_fuzzy2015_DW
#define D_Work                         DW_pendulo_fuzzy2015_T

/* Parameters (auto storage) */
struct P_pendulo_fuzzy2015_T_ {
  real_T AnalogOutput_MaxMissedTicks;  /* Mask Parameter: AnalogOutput_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  real_T AnalogOutput1_MaxMissedTicks; /* Mask Parameter: AnalogOutput1_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  real_T AnalogInput_MaxMissedTicks;   /* Mask Parameter: AnalogInput_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  real_T AnalogInput1_MaxMissedTicks;  /* Mask Parameter: AnalogInput1_MaxMissedTicks
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  real_T AnalogOutput_YieldWhenWaiting;/* Mask Parameter: AnalogOutput_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  real_T AnalogOutput1_YieldWhenWaiting;/* Mask Parameter: AnalogOutput1_YieldWhenWaiting
                                         * Referenced by: '<S4>/Analog Output1'
                                         */
  real_T AnalogInput_YieldWhenWaiting; /* Mask Parameter: AnalogInput_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  real_T AnalogInput1_YieldWhenWaiting;/* Mask Parameter: AnalogInput1_YieldWhenWaiting
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  real_T mf1_a[4];                     /* Mask Parameter: mf1_a
                                        * Referenced by: '<S38>/Linear Coeff'
                                        */
  real_T mf2_a[4];                     /* Mask Parameter: mf2_a
                                        * Referenced by: '<S46>/Linear Coeff'
                                        */
  real_T mf3_a[4];                     /* Mask Parameter: mf3_a
                                        * Referenced by: '<S47>/Linear Coeff'
                                        */
  real_T mf4_a[4];                     /* Mask Parameter: mf4_a
                                        * Referenced by: '<S48>/Linear Coeff'
                                        */
  real_T mf5_a[4];                     /* Mask Parameter: mf5_a
                                        * Referenced by: '<S49>/Linear Coeff'
                                        */
  real_T mf6_a[4];                     /* Mask Parameter: mf6_a
                                        * Referenced by: '<S50>/Linear Coeff'
                                        */
  real_T mf7_a[4];                     /* Mask Parameter: mf7_a
                                        * Referenced by: '<S51>/Linear Coeff'
                                        */
  real_T mf8_a[4];                     /* Mask Parameter: mf8_a
                                        * Referenced by: '<S52>/Linear Coeff'
                                        */
  real_T mf9_a[4];                     /* Mask Parameter: mf9_a
                                        * Referenced by: '<S53>/Linear Coeff'
                                        */
  real_T mf10_a[4];                    /* Mask Parameter: mf10_a
                                        * Referenced by: '<S39>/Linear Coeff'
                                        */
  real_T mf11_a[4];                    /* Mask Parameter: mf11_a
                                        * Referenced by: '<S40>/Linear Coeff'
                                        */
  real_T mf12_a[4];                    /* Mask Parameter: mf12_a
                                        * Referenced by: '<S41>/Linear Coeff'
                                        */
  real_T mf13_a[4];                    /* Mask Parameter: mf13_a
                                        * Referenced by: '<S42>/Linear Coeff'
                                        */
  real_T mf14_a[4];                    /* Mask Parameter: mf14_a
                                        * Referenced by: '<S43>/Linear Coeff'
                                        */
  real_T mf15_a[4];                    /* Mask Parameter: mf15_a
                                        * Referenced by: '<S44>/Linear Coeff'
                                        */
  real_T mf16_a[4];                    /* Mask Parameter: mf16_a
                                        * Referenced by: '<S45>/Linear Coeff'
                                        */
  real_T mf1_b;                        /* Mask Parameter: mf1_b
                                        * Referenced by: '<S38>/Constant Coeff'
                                        */
  real_T mf2_b;                        /* Mask Parameter: mf2_b
                                        * Referenced by: '<S46>/Constant Coeff'
                                        */
  real_T mf3_b;                        /* Mask Parameter: mf3_b
                                        * Referenced by: '<S47>/Constant Coeff'
                                        */
  real_T mf4_b;                        /* Mask Parameter: mf4_b
                                        * Referenced by: '<S48>/Constant Coeff'
                                        */
  real_T mf5_b;                        /* Mask Parameter: mf5_b
                                        * Referenced by: '<S49>/Constant Coeff'
                                        */
  real_T mf6_b;                        /* Mask Parameter: mf6_b
                                        * Referenced by: '<S50>/Constant Coeff'
                                        */
  real_T mf7_b;                        /* Mask Parameter: mf7_b
                                        * Referenced by: '<S51>/Constant Coeff'
                                        */
  real_T mf8_b;                        /* Mask Parameter: mf8_b
                                        * Referenced by: '<S52>/Constant Coeff'
                                        */
  real_T mf9_b;                        /* Mask Parameter: mf9_b
                                        * Referenced by: '<S53>/Constant Coeff'
                                        */
  real_T mf10_b;                       /* Mask Parameter: mf10_b
                                        * Referenced by: '<S39>/Constant Coeff'
                                        */
  real_T mf11_b;                       /* Mask Parameter: mf11_b
                                        * Referenced by: '<S40>/Constant Coeff'
                                        */
  real_T mf12_b;                       /* Mask Parameter: mf12_b
                                        * Referenced by: '<S41>/Constant Coeff'
                                        */
  real_T mf13_b;                       /* Mask Parameter: mf13_b
                                        * Referenced by: '<S42>/Constant Coeff'
                                        */
  real_T mf14_b;                       /* Mask Parameter: mf14_b
                                        * Referenced by: '<S43>/Constant Coeff'
                                        */
  real_T mf15_b;                       /* Mask Parameter: mf15_b
                                        * Referenced by: '<S44>/Constant Coeff'
                                        */
  real_T mf16_b;                       /* Mask Parameter: mf16_b
                                        * Referenced by: '<S45>/Constant Coeff'
                                        */
  real_T mf1_mu;                       /* Mask Parameter: mf1_mu
                                        * Referenced by: '<S30>/mu'
                                        */
  real_T mf1_mu_f;                     /* Mask Parameter: mf1_mu_f
                                        * Referenced by: '<S32>/mu'
                                        */
  real_T mf1_mu_a;                     /* Mask Parameter: mf1_mu_a
                                        * Referenced by: '<S34>/mu'
                                        */
  real_T mf1_mu_k;                     /* Mask Parameter: mf1_mu_k
                                        * Referenced by: '<S36>/mu'
                                        */
  real_T mf2_mu;                       /* Mask Parameter: mf2_mu
                                        * Referenced by: '<S37>/mu'
                                        */
  real_T mf2_mu_h;                     /* Mask Parameter: mf2_mu_h
                                        * Referenced by: '<S35>/mu'
                                        */
  real_T mf2_mu_f;                     /* Mask Parameter: mf2_mu_f
                                        * Referenced by: '<S33>/mu'
                                        */
  real_T mf2_mu_n;                     /* Mask Parameter: mf2_mu_n
                                        * Referenced by: '<S31>/mu'
                                        */
  real_T mf1_sigma;                    /* Mask Parameter: mf1_sigma
                                        * Referenced by: '<S30>/sigma'
                                        */
  real_T mf1_sigma_i;                  /* Mask Parameter: mf1_sigma_i
                                        * Referenced by: '<S32>/sigma'
                                        */
  real_T mf1_sigma_c;                  /* Mask Parameter: mf1_sigma_c
                                        * Referenced by: '<S34>/sigma'
                                        */
  real_T mf1_sigma_f;                  /* Mask Parameter: mf1_sigma_f
                                        * Referenced by: '<S36>/sigma'
                                        */
  real_T mf2_sigma;                    /* Mask Parameter: mf2_sigma
                                        * Referenced by: '<S37>/sigma'
                                        */
  real_T mf2_sigma_b;                  /* Mask Parameter: mf2_sigma_b
                                        * Referenced by: '<S35>/sigma'
                                        */
  real_T mf2_sigma_o;                  /* Mask Parameter: mf2_sigma_o
                                        * Referenced by: '<S33>/sigma'
                                        */
  real_T mf2_sigma_j;                  /* Mask Parameter: mf2_sigma_j
                                        * Referenced by: '<S31>/sigma'
                                        */
  int32_T AnalogOutput_Channels;       /* Mask Parameter: AnalogOutput_Channels
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  int32_T AnalogOutput1_Channels;      /* Mask Parameter: AnalogOutput1_Channels
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  int32_T AnalogInput_Channels;        /* Mask Parameter: AnalogInput_Channels
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  int32_T AnalogInput1_Channels;       /* Mask Parameter: AnalogInput1_Channels
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  int32_T AnalogOutput_RangeMode;      /* Mask Parameter: AnalogOutput_RangeMode
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  int32_T AnalogOutput1_RangeMode;     /* Mask Parameter: AnalogOutput1_RangeMode
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  int32_T AnalogInput_RangeMode;       /* Mask Parameter: AnalogInput_RangeMode
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  int32_T AnalogInput1_RangeMode;      /* Mask Parameter: AnalogInput1_RangeMode
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  int32_T AnalogOutput_VoltRange;      /* Mask Parameter: AnalogOutput_VoltRange
                                        * Referenced by: '<S4>/Analog Output'
                                        */
  int32_T AnalogOutput1_VoltRange;     /* Mask Parameter: AnalogOutput1_VoltRange
                                        * Referenced by: '<S4>/Analog Output1'
                                        */
  int32_T AnalogInput_VoltRange;       /* Mask Parameter: AnalogInput_VoltRange
                                        * Referenced by: '<S4>/Analog Input'
                                        */
  int32_T AnalogInput1_VoltRange;      /* Mask Parameter: AnalogInput1_VoltRange
                                        * Referenced by: '<S4>/Analog Input1'
                                        */
  real_T Out1_Y0;                      /* Expression: 0
                                        * Referenced by: '<S28>/Out1'
                                        */
  real_T One_Value;                    /* Expression: 1
                                        * Referenced by: '<S28>/One'
                                        */
  real_T Weight_Value;                 /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S7>/Weight'
                                        */
  real_T TransferFcn3_A;               /* Computed Parameter: TransferFcn3_A
                                        * Referenced by: '<S4>/Transfer Fcn3'
                                        */
  real_T TransferFcn3_C;               /* Computed Parameter: TransferFcn3_C
                                        * Referenced by: '<S4>/Transfer Fcn3'
                                        */
  real_T Gain_Gain;                    /* Expression: -0.5
                                        * Referenced by: '<S30>/Gain'
                                        */
  real_T TransferFcn4_A;               /* Computed Parameter: TransferFcn4_A
                                        * Referenced by: '<S4>/Transfer Fcn4'
                                        */
  real_T TransferFcn4_C;               /* Computed Parameter: TransferFcn4_C
                                        * Referenced by: '<S4>/Transfer Fcn4'
                                        */
  real_T Gain_Gain_a;                  /* Expression: -0.5
                                        * Referenced by: '<S32>/Gain'
                                        */
  real_T TransferFcn2_A;               /* Computed Parameter: TransferFcn2_A
                                        * Referenced by: '<S4>/Transfer Fcn2'
                                        */
  real_T TransferFcn2_C;               /* Computed Parameter: TransferFcn2_C
                                        * Referenced by: '<S4>/Transfer Fcn2'
                                        */
  real_T Gain_Gain_p;                  /* Expression: -0.5
                                        * Referenced by: '<S34>/Gain'
                                        */
  real_T TransferFcn1_A;               /* Computed Parameter: TransferFcn1_A
                                        * Referenced by: '<S4>/Transfer Fcn1'
                                        */
  real_T TransferFcn1_C;               /* Computed Parameter: TransferFcn1_C
                                        * Referenced by: '<S4>/Transfer Fcn1'
                                        */
  real_T Gain_Gain_f;                  /* Expression: -0.5
                                        * Referenced by: '<S36>/Gain'
                                        */
  real_T Weight_Value_n;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S15>/Weight'
                                        */
  real_T Gain_Gain_o;                  /* Expression: -0.5
                                        * Referenced by: '<S37>/Gain'
                                        */
  real_T Weight_Value_l;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S16>/Weight'
                                        */
  real_T Gain_Gain_fc;                 /* Expression: -0.5
                                        * Referenced by: '<S35>/Gain'
                                        */
  real_T Weight_Value_g;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S17>/Weight'
                                        */
  real_T Weight_Value_e;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S18>/Weight'
                                        */
  real_T Gain_Gain_i;                  /* Expression: -0.5
                                        * Referenced by: '<S33>/Gain'
                                        */
  real_T Weight_Value_ed;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S19>/Weight'
                                        */
  real_T Weight_Value_i;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S20>/Weight'
                                        */
  real_T Weight_Value_h;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S21>/Weight'
                                        */
  real_T Weight_Value_b;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S22>/Weight'
                                        */
  real_T Gain_Gain_od;                 /* Expression: -0.5
                                        * Referenced by: '<S31>/Gain'
                                        */
  real_T Weight_Value_gk;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S8>/Weight'
                                        */
  real_T Weight_Value_k;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S9>/Weight'
                                        */
  real_T Weight_Value_m;               /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S10>/Weight'
                                        */
  real_T Weight_Value_k4;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S11>/Weight'
                                        */
  real_T Weight_Value_nw;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S12>/Weight'
                                        */
  real_T Weight_Value_gz;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S13>/Weight'
                                        */
  real_T Weight_Value_ew;              /* Expression: fis.rule(j_rule).weight
                                        * Referenced by: '<S14>/Weight'
                                        */
  real_T Zero_Value;                   /* Expression: 0
                                        * Referenced by: '<S5>/Zero'
                                        */
  real_T MidRange_Value;               /* Expression: mean(cat(1,fis.output.range),2)
                                        * Referenced by: '<S5>/MidRange'
                                        */
  real_T Switch_Threshold;             /* Expression: 1
                                        * Referenced by: '<S5>/Switch'
                                        */
  real_T Constant6_Value;              /* Expression: 4.5
                                        * Referenced by: '<S4>/Constant6'
                                        */
  real_T Constant7_Value;              /* Expression: 0
                                        * Referenced by: '<S4>/Constant7'
                                        */
  real_T Constant8_Value;              /* Expression: 0
                                        * Referenced by: '<S4>/Constant8'
                                        */
  real_T Constant1_Value;              /* Expression: 0.3399
                                        * Referenced by: '<S4>/Constant1'
                                        */
  real_T Constant2_Value;              /* Expression: 0.5864
                                        * Referenced by: '<S4>/Constant2'
                                        */
  real_T Constant5_Value;              /* Expression: -0.2826
                                        * Referenced by: '<S4>/Constant5'
                                        */
  real_T Constant3_Value;              /* Expression: 2.7161
                                        * Referenced by: '<S4>/Constant3'
                                        */
  real_T Constant4_Value;              /* Expression: 5.0627
                                        * Referenced by: '<S4>/Constant4'
                                        */
  real_T Constant_Value;               /* Expression: 0.024
                                        * Referenced by: '<S4>/Constant'
                                        */
  real_T Constant5_Value_g;            /* Expression: 0.5
                                        * Referenced by: '<Root>/Constant5'
                                        */
  real_T Gain1_Gain;                   /* Expression: -1
                                        * Referenced by: '<Root>/Gain1'
                                        */
  real_T Saturation_UpperSat;          /* Expression: 7.5
                                        * Referenced by: '<Root>/Saturation'
                                        */
  real_T Saturation_LowerSat;          /* Expression: -7.5
                                        * Referenced by: '<Root>/Saturation'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_pendulo_fuzzy2015_T {
  const char_T *path;
  const char_T *modelName;
  struct SimStruct_tag * *childSfunctions;
  const char_T *errorStatus;
  SS_SimMode simMode;
  RTWExtModeInfo *extModeInfo;
  RTWSolverInfo solverInfo;
  RTWSolverInfo *solverInfoPtr;
  void *sfcnInfo;

  /*
   * ModelData:
   * The following substructure contains information regarding
   * the data used in the model.
   */
  struct {
    void *blockIO;
    const void *constBlockIO;
    void *defaultParam;
    ZCSigState *prevZCSigState;
    real_T *contStates;
    int_T *periodicContStateIndices;
    real_T *periodicContStateRanges;
    real_T *derivs;
    void *zcSignalValues;
    void *inputs;
    void *outputs;
    boolean_T *contStateDisabled;
    boolean_T zCCacheNeedsReset;
    boolean_T derivCacheNeedsReset;
    boolean_T blkStateChange;
    real_T odeY[4];
    real_T odeF[3][4];
    ODE3_IntgData intgData;
    void *dwork;
  } ModelData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
    uint32_T options;
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numU;
    int_T numY;
    int_T numSampTimes;
    int_T numBlocks;
    int_T numBlockIO;
    int_T numBlockPrms;
    int_T numDwork;
    int_T numSFcnPrms;
    int_T numSFcns;
    int_T numIports;
    int_T numOports;
    int_T numNonSampZCs;
    int_T sysDirFeedThru;
    int_T rtwGenSfcn;
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
    void *xpcData;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T stepSize;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T stepSize1;
    time_T tStart;
    time_T tFinal;
    time_T timeOfLastOutput;
    void *timingData;
    real_T *varNextHitTimesList;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *sampleTimes;
    time_T *offsetTimes;
    int_T *sampleTimeTaskIDPtr;
    int_T *sampleHits;
    int_T *perTaskSampleHits;
    time_T *t;
    time_T sampleTimesArray[2];
    time_T offsetTimesArray[2];
    int_T sampleTimeTaskIDArray[2];
    int_T sampleHitArray[2];
    int_T perTaskSampleHitsArray[4];
    time_T tArray[2];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_pendulo_fuzzy2015_T pendulo_fuzzy2015_P;

/* Block signals (auto storage) */
extern B_pendulo_fuzzy2015_T pendulo_fuzzy2015_B;

/* Continuous states (auto storage) */
extern X_pendulo_fuzzy2015_T pendulo_fuzzy2015_X;

/* Block states (auto storage) */
extern DW_pendulo_fuzzy2015_T pendulo_fuzzy2015_DW;

/* Model entry point functions */
extern void pendulo_fuzzy2015_initialize(void);
extern void pendulo_fuzzy2015_output(void);
extern void pendulo_fuzzy2015_update(void);
extern void pendulo_fuzzy2015_terminate(void);

/*====================*
 * External functions *
 *====================*/
extern pendulo_fuzzy2015_rtModel *pendulo_fuzzy2015(void);
extern void MdlInitializeSizes(void);
extern void MdlInitializeSampleTimes(void);
extern void MdlInitialize(void);
extern void MdlStart(void);
extern void MdlOutputs(int_T tid);
extern void MdlUpdate(int_T tid);
extern void MdlTerminate(void);

/* Real-time Model object */
extern RT_MODEL_pendulo_fuzzy2015_T *const pendulo_fuzzy2015_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'pendulo_fuzzy2015'
 * '<S1>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller'
 * '<S2>'   : 'pendulo_fuzzy2015/MATLAB Function1'
 * '<S3>'   : 'pendulo_fuzzy2015/PROPORCIONAL'
 * '<S4>'   : 'pendulo_fuzzy2015/Subsystem2'
 * '<S5>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard'
 * '<S6>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Defuzzification1'
 * '<S7>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule1'
 * '<S8>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule10'
 * '<S9>'   : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule11'
 * '<S10>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule12'
 * '<S11>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule13'
 * '<S12>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule14'
 * '<S13>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule15'
 * '<S14>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule16'
 * '<S15>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule2'
 * '<S16>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule3'
 * '<S17>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule4'
 * '<S18>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule5'
 * '<S19>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule6'
 * '<S20>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule7'
 * '<S21>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule8'
 * '<S22>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Rule9'
 * '<S23>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input1'
 * '<S24>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input2'
 * '<S25>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input3'
 * '<S26>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input4'
 * '<S27>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1'
 * '<S28>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Defuzzification1/Action: One'
 * '<S29>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/Defuzzification1/Action: u1'
 * '<S30>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input1/mf1'
 * '<S31>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input1/mf2'
 * '<S32>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input2/mf1'
 * '<S33>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input2/mf2'
 * '<S34>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input3/mf1'
 * '<S35>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input3/mf2'
 * '<S36>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input4/mf1'
 * '<S37>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/input4/mf2'
 * '<S38>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf1'
 * '<S39>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf10'
 * '<S40>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf11'
 * '<S41>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf12'
 * '<S42>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf13'
 * '<S43>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf14'
 * '<S44>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf15'
 * '<S45>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf16'
 * '<S46>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf2'
 * '<S47>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf3'
 * '<S48>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf4'
 * '<S49>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf5'
 * '<S50>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf6'
 * '<S51>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf7'
 * '<S52>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf8'
 * '<S53>'  : 'pendulo_fuzzy2015/Fuzzy Logic  Controller/FIS Wizard/output1/mf9'
 * '<S54>'  : 'pendulo_fuzzy2015/Subsystem2/Subsystem'
 * '<S55>'  : 'pendulo_fuzzy2015/Subsystem2/Subsystem/If Action Subsystem'
 * '<S56>'  : 'pendulo_fuzzy2015/Subsystem2/Subsystem/If Action Subsystem1'
 */
#endif                                 /* RTW_HEADER_pendulo_fuzzy2015_h_ */
