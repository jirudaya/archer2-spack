
-- -*- lua -*-
-- Module file created by spack (https://github.com/spack/spack) on 2025-01-20 19:52:22.598767
--
-- cce@15.0.0%gcc@11.2.0 build_system=generic arch=linux-sles15-zen2/gths65f
--

whatis([[Name : Spack software]])
whatis([[Version : __EPCC__VERSION__ ]])
whatis([[Target : zen2]])
whatis([[Short description : Enable spack generated environment ]])

help([[Name   : Spack software ]])
help([[Version: __EPCC__VERSION__ ]])
help([[Target : zen2]])
help()

family("spack_compiler")

local softwarebase = "__EPCC__SPACK__REPO__ROOT__/archer2-cse/modules"

local gnu_path = pathJoin(softwarebase, "gcc/11.2.0")
local cray_path = pathJoin(softwarebase, "cce/15.0.0")
local aocc_path = pathJoin(softwarebase, "aocc/4.0.0")


if os.getenv("PE_ENV") == "GNU" then
    prepend_path("MODULEPATH", gnu_path)
  elseif os.getenv("PE_ENV") == "CRAY" then
    prepend_path("MODULEPATH", cray_path)
  elseif os.getenv("PE_ENV") == "AOCC" then
    prepend_path("MODULEPATH", aocc_path)
end

prepend_path("LMOD_CUSTOM_COMPILER_GNU_PREFIX", gnu_path)
prepend_path("LMOD_CUSTOM_COMPILER_GNU_8_0_PREFIX", gnu_path )
prepend_path("LMOD_CUSTOM_COMPILER_CRAYCLANG_PREFIX", cray_path )
prepend_path("LMOD_CUSTOM_COMPILER_CRAYCLANG_10_0_PREFIX", cray_path)
prepend_path("LMOD_CUSTOM_COMPILER_AOCC_PREFIX", aocc_path)
prepend_path("LMOD_CUSTOM_COMPILER_AOCC_3_0_PREFIX", aocc_path )
