#include "pendule_inv_etu_capi_host.h"
static pendule_inv_etu_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        pendule_inv_etu_host_InitializeDataMapInfo(&(root), "pendule_inv_etu");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
