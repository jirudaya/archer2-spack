
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
local core_path = pathJoin(softwarebase, "Core")

prepend_path("MODULEPATH", core_path)

-- Removing the current software spack from the modules to avoid clashes and recreating some of the environment. 
-- In the future we might want to separate these module path from other variables in epcc-setup-env in order to avoid the duplication.

unload("epcc-setup-env")

pushenv("LMOD_CUSTOM_COMPILER_GNU_PREFIX", gnu_path)
pushenv("LMOD_CUSTOM_COMPILER_GNU_8_0_PREFIX", gnu_path )
pushenv("LMOD_CUSTOM_COMPILER_CRAYCLANG_PREFIX", cray_path )
pushenv("LMOD_CUSTOM_COMPILER_CRAYCLANG_10_0_PREFIX", cray_path)
pushenv("LMOD_CUSTOM_COMPILER_AOCC_PREFIX", aocc_path)
pushenv("LMOD_CUSTOM_COMPILER_AOCC_3_0_PREFIX", aocc_path)


-- Set any env vars
setenv("EPCC_SOFTWARE_DIR","/mnt/lustre/a2fs-work4/work/y07/shared")
setenv("SLURM_CPU_FREQ_REQ","2000000")
setenv("SBATCH_EXPORT", "SLURM_CPU_FREQ_REQ,SBATCH_EXPORT")
setenv("SLURM_EXPORT_ENV", "all")
setenv("EPCC_SINGULARITY_DIR", "/work/y07/shared/singularity-images")



-- Aliases
local bashStr = "lfs quota -hp $(lsattr -p . | head -1 | awk '{print $1}') ."
set_shell_function('showquota', bashStr, bashStr)