#include "ctxt.h"
#include "install.h"

struct install_item insthier[] = {
  {INST_MKDIR, 0, 0, ctxt_bindir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_incdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_dlibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_slibdir, 0, 0, 0755},
  {INST_MKDIR, 0, 0, ctxt_repos, 0, 0, 0755},
  {INST_COPY, "cgbc-conf.c", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_stacks.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_stacks.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "cgbc.ads", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc.ads", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_stacks.adb", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_stacks.adb", 0, ctxt_incdir, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_hashed_maps.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "cgbc-bounded_stacks.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc-bounded_stacks.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "cgbc.ali", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc.ali", 0, ctxt_incdir, 0, 0, 0444},
  {INST_COPY, "cgbc.sld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY, "cgbc.a", "libcgbc.a", ctxt_slibdir, 0, 0, 0644},
  {INST_COPY, "cgbc-conf.ld", 0, ctxt_repos, 0, 0, 0644},
  {INST_COPY_EXEC, "cgbc-conf", 0, ctxt_bindir, 0, 0, 0755},
};
unsigned long insthier_len = sizeof(insthier) / sizeof(struct install_item);