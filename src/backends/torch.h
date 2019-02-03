#ifndef SRC_BACKENDS_TORCH_H_
#define SRC_BACKENDS_TORCH_H_

#include "config.h"
#include "tensor_struct.h"
#include "script_struct.h"
#include "graph_struct.h"

#include "torch_c.h"

RAI_Graph *RAI_GraphCreateTorch(RAI_Backend backend, RAI_Device device,
                                const char *graphdef, size_t graphlen);

void RAI_GraphFreeTorch(RAI_Graph* graph);

int RAI_GraphRunTorch(RAI_GraphRunCtx* gctx);

RAI_Script *RAI_ScriptCreateTorch(RAI_Device device, const char *scriptdef);

void RAI_ScriptFreeTorch(RAI_Script* script);

int RAI_ScriptRunTorch(RAI_ScriptRunCtx* sctx);

#endif /* SRC_BACKENDS_TORCH_H_ */
