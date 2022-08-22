#include <math.h>
#include <string.h>
#include "pm_std.h"
#include "sm_std.h"
#include "ne_std.h"
#include "ne_dae.h"
#include "sm_ssci_run_time_errors.h"
#include "sm_RuntimeDerivedValuesBundle.h"
#include "sm_CTarget.h"
void robot2gdl_a151ee3d_1_setTargets ( const RuntimeDerivedValuesBundle *
rtdv , CTarget * targets ) { ( void ) rtdv ; ( void ) targets ; } void
robot2gdl_a151ee3d_1_resetAsmStateVector ( const void * mech , double * state
) { double xx [ 1 ] ; ( void ) mech ; xx [ 0 ] = 0.0 ; state [ 0 ] = xx [ 0 ]
; state [ 1 ] = xx [ 0 ] ; state [ 2 ] = xx [ 0 ] ; state [ 3 ] = xx [ 0 ] ;
} void robot2gdl_a151ee3d_1_initializeTrackedAngleState ( const void * mech ,
const RuntimeDerivedValuesBundle * rtdv , const int * modeVector , const
double * motionData , double * state ) { const double * rtdvd = rtdv ->
mDoubles . mValues ; const int * rtdvi = rtdv -> mInts . mValues ; ( void )
mech ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) state ; ( void ) modeVector
; ( void ) motionData ; } void robot2gdl_a151ee3d_1_computeDiscreteState (
const void * mech , const RuntimeDerivedValuesBundle * rtdv , double * state
) { const double * rtdvd = rtdv -> mDoubles . mValues ; const int * rtdvi =
rtdv -> mInts . mValues ; ( void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; (
void ) state ; } void robot2gdl_a151ee3d_1_adjustPosition ( const void * mech
, const double * dofDeltas , double * state ) { ( void ) mech ; state [ 0 ] =
state [ 0 ] + dofDeltas [ 0 ] ; state [ 2 ] = state [ 2 ] + dofDeltas [ 1 ] ;
} static void perturbAsmJointPrimitiveState_0_0 ( double mag , double * state
) { state [ 0 ] = state [ 0 ] + mag ; } static void
perturbAsmJointPrimitiveState_0_0v ( double mag , double * state ) { state [
0 ] = state [ 0 ] + mag ; state [ 1 ] = state [ 1 ] - 0.875 * mag ; } static
void perturbAsmJointPrimitiveState_1_0 ( double mag , double * state ) {
state [ 2 ] = state [ 2 ] + mag ; } static void
perturbAsmJointPrimitiveState_1_0v ( double mag , double * state ) { state [
2 ] = state [ 2 ] + mag ; state [ 3 ] = state [ 3 ] - 0.875 * mag ; } void
robot2gdl_a151ee3d_1_perturbAsmJointPrimitiveState ( const void * mech ,
size_t stageIdx , size_t primIdx , double mag , boolean_T doPerturbVelocity ,
double * state ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) mag ; ( void ) doPerturbVelocity ; ( void ) state ; switch ( (
stageIdx * 6 + primIdx ) * 2 + ( doPerturbVelocity ? 1 : 0 ) ) { case 0 :
perturbAsmJointPrimitiveState_0_0 ( mag , state ) ; break ; case 1 :
perturbAsmJointPrimitiveState_0_0v ( mag , state ) ; break ; case 12 :
perturbAsmJointPrimitiveState_1_0 ( mag , state ) ; break ; case 13 :
perturbAsmJointPrimitiveState_1_0v ( mag , state ) ; break ; } } void
robot2gdl_a151ee3d_1_computePosDofBlendMatrix ( const void * mech , size_t
stageIdx , size_t primIdx , const double * state , int partialType , double *
matrix ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; ( void )
state ; ( void ) partialType ; ( void ) matrix ; switch ( ( stageIdx * 6 +
primIdx ) ) { } } void robot2gdl_a151ee3d_1_computeVelDofBlendMatrix ( const
void * mech , size_t stageIdx , size_t primIdx , const double * state , int
partialType , double * matrix ) { ( void ) mech ; ( void ) stageIdx ; ( void
) primIdx ; ( void ) state ; ( void ) partialType ; ( void ) matrix ; switch
( ( stageIdx * 6 + primIdx ) ) { } } void
robot2gdl_a151ee3d_1_projectPartiallyTargetedPos ( const void * mech , size_t
stageIdx , size_t primIdx , const double * origState , int partialType ,
double * state ) { ( void ) mech ; ( void ) stageIdx ; ( void ) primIdx ; (
void ) origState ; ( void ) partialType ; ( void ) state ; switch ( (
stageIdx * 6 + primIdx ) ) { } } void robot2gdl_a151ee3d_1_propagateMotion (
const void * mech , const RuntimeDerivedValuesBundle * rtdv , const double *
state , double * motionData ) { const double * rtdvd = rtdv -> mDoubles .
mValues ; const int * rtdvi = rtdv -> mInts . mValues ; double xx [ 37 ] ; (
void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; xx [ 0 ] = 0.9999994645475963
; xx [ 1 ] = 6.24196994308801e-5 ; xx [ 2 ] = - xx [ 0 ] ; xx [ 3 ] =
1.032951722177279e-3 ; xx [ 4 ] = - 4.363661874876537e-6 ; xx [ 5 ] = - xx [
1 ] ; xx [ 6 ] = 0.5 ; xx [ 7 ] = xx [ 6 ] * state [ 0 ] ; xx [ 8 ] =
8.856272148736426e-6 ; xx [ 9 ] = sin ( xx [ 7 ] ) ; xx [ 10 ] =
2.065901793404667e-3 ; xx [ 11 ] = 0.9999978659833962 ; xx [ 12 ] = cos ( xx
[ 7 ] ) ; xx [ 13 ] = - ( xx [ 8 ] * xx [ 9 ] ) ; xx [ 14 ] = - ( xx [ 10 ] *
xx [ 9 ] ) ; xx [ 15 ] = xx [ 11 ] * xx [ 9 ] ; pm_math_Quaternion_compose_ra
( xx + 2 , xx + 12 , xx + 16 ) ; xx [ 2 ] = 1.635003634356987e-5 ; xx [ 3 ] =
0.09699773269096632 ; xx [ 4 ] = 0.01111967078257743 ;
pm_math_Quaternion_xform_ra ( xx + 16 , xx + 2 , xx + 12 ) ; xx [ 2 ] = xx [
6 ] * state [ 2 ] ; xx [ 3 ] = sin ( xx [ 2 ] ) ; xx [ 4 ] = cos ( xx [ 2 ] )
; xx [ 2 ] = xx [ 1 ] * xx [ 3 ] - xx [ 0 ] * xx [ 4 ] ; xx [ 5 ] =
1.032951722177218e-3 ; xx [ 6 ] = 4.363661874876533e-6 ; xx [ 7 ] = xx [ 5 ]
* xx [ 4 ] + xx [ 6 ] * xx [ 3 ] ; xx [ 9 ] = - xx [ 7 ] ; xx [ 15 ] = xx [ 6
] * xx [ 4 ] - xx [ 5 ] * xx [ 3 ] ; xx [ 5 ] = xx [ 1 ] * xx [ 4 ] + xx [ 0
] * xx [ 3 ] ; xx [ 0 ] = 0.01099999999999999 ; xx [ 1 ] = 0.0676629667065019
; xx [ 3 ] = xx [ 15 ] * xx [ 0 ] - xx [ 1 ] * xx [ 5 ] ; xx [ 20 ] = xx [ 9
] ; xx [ 21 ] = xx [ 15 ] ; xx [ 22 ] = xx [ 5 ] ; xx [ 4 ] = xx [ 0 ] * xx [
7 ] ; xx [ 6 ] = xx [ 1 ] * xx [ 7 ] ; xx [ 23 ] = xx [ 3 ] ; xx [ 24 ] = xx
[ 4 ] ; xx [ 25 ] = - xx [ 6 ] ; pm_math_Vector3_cross_ra ( xx + 20 , xx + 23
, xx + 26 ) ; xx [ 7 ] = 2.0 ; xx [ 20 ] = - ( 7.841657859239773e-6 + ( xx [
2 ] * xx [ 3 ] + xx [ 26 ] ) * xx [ 7 ] ) ; xx [ 3 ] = - (
0.09631631461726123 + xx [ 1 ] + xx [ 7 ] * ( xx [ 27 ] + xx [ 2 ] * xx [ 4 ]
) ) ; xx [ 4 ] = 0.01772031681719305 - ( xx [ 0 ] + ( xx [ 28 ] - xx [ 2 ] *
xx [ 6 ] ) * xx [ 7 ] ) ; xx [ 0 ] = - ( xx [ 8 ] * state [ 1 ] ) ; xx [ 6 ]
= - ( xx [ 10 ] * state [ 1 ] ) ; xx [ 7 ] = xx [ 11 ] * state [ 1 ] ; xx [ 8
] = 0.09702049784400603 * state [ 1 ] ; xx [ 10 ] = 1.64484802829757e-5 *
state [ 1 ] ; xx [ 11 ] = 8.252607491171733e-7 * state [ 1 ] ; xx [ 21 ] = xx
[ 2 ] ; xx [ 22 ] = xx [ 9 ] ; xx [ 23 ] = xx [ 15 ] ; xx [ 24 ] = xx [ 5 ] ;
xx [ 25 ] = xx [ 0 ] ; xx [ 26 ] = xx [ 6 ] ; xx [ 27 ] = xx [ 7 ] ;
pm_math_Quaternion_inverseXform_ra ( xx + 21 , xx + 25 , xx + 28 ) ; xx [ 31
] = xx [ 20 ] ; xx [ 32 ] = xx [ 3 ] ; xx [ 33 ] = xx [ 4 ] ;
pm_math_Vector3_cross_ra ( xx + 25 , xx + 31 , xx + 34 ) ; xx [ 25 ] = xx [
34 ] + xx [ 8 ] ; xx [ 26 ] = xx [ 35 ] - xx [ 10 ] ; xx [ 27 ] = xx [ 36 ] +
xx [ 11 ] ; pm_math_Quaternion_inverseXform_ra ( xx + 21 , xx + 25 , xx + 31
) ; motionData [ 0 ] = xx [ 16 ] ; motionData [ 1 ] = xx [ 17 ] ; motionData
[ 2 ] = xx [ 18 ] ; motionData [ 3 ] = xx [ 19 ] ; motionData [ 4 ] =
0.01722439723246977 - xx [ 12 ] ; motionData [ 5 ] = 0.04713427541348383 - xx
[ 13 ] ; motionData [ 6 ] = 0.03734344521497747 - xx [ 14 ] ; motionData [ 7
] = xx [ 2 ] ; motionData [ 8 ] = xx [ 9 ] ; motionData [ 9 ] = xx [ 15 ] ;
motionData [ 10 ] = xx [ 5 ] ; motionData [ 11 ] = xx [ 20 ] ; motionData [
12 ] = xx [ 3 ] ; motionData [ 13 ] = xx [ 4 ] ; motionData [ 14 ] = xx [ 0 ]
; motionData [ 15 ] = xx [ 6 ] ; motionData [ 16 ] = xx [ 7 ] ; motionData [
17 ] = xx [ 8 ] ; motionData [ 18 ] = - xx [ 10 ] ; motionData [ 19 ] = xx [
11 ] ; motionData [ 20 ] = xx [ 28 ] ; motionData [ 21 ] = xx [ 29 ] ;
motionData [ 22 ] = xx [ 30 ] - state [ 3 ] ; motionData [ 23 ] = xx [ 31 ] -
xx [ 1 ] * state [ 3 ] ; motionData [ 24 ] = xx [ 32 ] ; motionData [ 25 ] =
xx [ 33 ] ; } size_t robot2gdl_a151ee3d_1_computeAssemblyError ( const void *
mech , const RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , const
int * modeVector , const double * motionData , double * error ) { ( void )
mech ; ( void ) rtdv ; ( void ) modeVector ; ( void ) motionData ; ( void )
error ; switch ( constraintIdx ) { } return 0 ; } size_t
robot2gdl_a151ee3d_1_computeAssemblyJacobian ( const void * mech , const
RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , boolean_T
forVelocitySatisfaction , const double * state , const int * modeVector ,
const double * motionData , double * J ) { ( void ) mech ; ( void ) rtdv ; (
void ) state ; ( void ) modeVector ; ( void ) forVelocitySatisfaction ; (
void ) motionData ; ( void ) J ; switch ( constraintIdx ) { } return 0 ; }
size_t robot2gdl_a151ee3d_1_computeFullAssemblyJacobian ( const void * mech ,
const RuntimeDerivedValuesBundle * rtdv , const double * state , const int *
modeVector , const double * motionData , double * J ) { const double * rtdvd
= rtdv -> mDoubles . mValues ; const int * rtdvi = rtdv -> mInts . mValues ;
( void ) mech ; ( void ) rtdvd ; ( void ) rtdvi ; ( void ) state ; ( void )
modeVector ; ( void ) motionData ; ( void ) J ; return 0 ; } boolean_T
robot2gdl_a151ee3d_1_isInKinematicSingularity ( const void * mech , const
RuntimeDerivedValuesBundle * rtdv , size_t constraintIdx , const int *
modeVector , const double * motionData ) { ( void ) mech ; ( void ) rtdv ; (
void ) modeVector ; ( void ) motionData ; switch ( constraintIdx ) { } return
0 ; } void robot2gdl_a151ee3d_1_convertStateVector ( const void * asmMech ,
const RuntimeDerivedValuesBundle * rtdv , const void * simMech , const double
* asmState , const int * asmModeVector , const int * simModeVector , double *
simState ) { const double * rtdvd = rtdv -> mDoubles . mValues ; const int *
rtdvi = rtdv -> mInts . mValues ; ( void ) asmMech ; ( void ) rtdvd ; ( void
) rtdvi ; ( void ) simMech ; ( void ) asmModeVector ; ( void ) simModeVector
; simState [ 0 ] = asmState [ 0 ] ; simState [ 1 ] = asmState [ 1 ] ;
simState [ 2 ] = asmState [ 2 ] ; simState [ 3 ] = asmState [ 3 ] ; }
