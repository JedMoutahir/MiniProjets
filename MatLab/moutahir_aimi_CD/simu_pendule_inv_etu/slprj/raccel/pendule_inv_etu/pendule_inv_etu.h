#ifndef RTW_HEADER_pendule_inv_etu_h_
#define RTW_HEADER_pendule_inv_etu_h_
#include <stddef.h>
#include <string.h>
#include "rtw_modelmap_simtarget.h"
#ifndef pendule_inv_etu_COMMON_INCLUDES_
#define pendule_inv_etu_COMMON_INCLUDES_
#include <stdlib.h>
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
#endif
#include "pendule_inv_etu_types.h"
#include "multiword_types.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#define MODEL_NAME pendule_inv_etu
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (5) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (2)   
#elif NCSTATES != 2
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
typedef struct { real_T allyqb1vhe [ 2 ] ; real_T bvb3xbwtkp [ 2 ] ; real_T
o0iqnjzysn [ 2 ] ; real_T kqmepjyykz [ 2 ] ; real_T jgigiwgxbm ; } B ;
typedef struct { struct { void * LoggedData ; } alpj01ghdg ; struct { void *
LoggedData ; } dnhgty5ycj ; int_T g5yc2koqpa ; } DW ; typedef struct { real_T
iobf53f0lv [ 2 ] ; } X ; typedef struct { real_T iobf53f0lv [ 2 ] ; } XDot ;
typedef struct { boolean_T iobf53f0lv [ 2 ] ; } XDis ; typedef struct {
real_T iobf53f0lv [ 2 ] ; } CStateAbsTol ; typedef struct { real_T iobf53f0lv
[ 2 ] ; } CXPtMin ; typedef struct { real_T iobf53f0lv [ 2 ] ; } CXPtMax ;
typedef struct { rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ {
real_T K [ 2 ] ; real_T g ; real_T l ; real_T ue ; real_T x0 [ 2 ] ; real_T
xe [ 2 ] ; } ; extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB
; extern X rtX ; extern DW rtDW ; extern P rtP ; extern mxArray *
mr_pendule_inv_etu_GetDWork ( ) ; extern void mr_pendule_inv_etu_SetDWork (
const mxArray * ssDW ) ; extern mxArray *
mr_pendule_inv_etu_GetSimStateDisallowedBlocks ( ) ; extern const
rtwCAPI_ModelMappingStaticInfo * pendule_inv_etu_GetCAPIStaticMap ( void ) ;
extern SimStruct * const rtS ; extern const int_T gblNumToFiles ; extern
const int_T gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern
rtInportTUtable * gblInportTUtables ; extern const char * gblInportFileName ;
extern const int_T gblNumRootInportBlks ; extern const int_T
gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ; extern
const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [ ] ;
extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ; extern const int_T gblParameterTuningTid ; extern
DataMapInfo * rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo *
rt_modelMapInfoPtr ; void MdlOutputs ( int_T tid ) ; void
MdlOutputsParameterSampleTime ( int_T tid ) ; void MdlUpdate ( int_T tid ) ;
void MdlTerminate ( void ) ; void MdlInitializeSizes ( void ) ; void
MdlInitializeSampleTimes ( void ) ; SimStruct * raccel_register_model (
ssExecutionInfo * executionInfo ) ;
#endif
