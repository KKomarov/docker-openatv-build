#!/bin/bash

# build image
# MACHINE=formuler4turbo DISTRO=openatv DISTRO_TYPE=release make enigma2-image

MACHINE=formuler4turbo DISTRO=openatv DISTRO_TYPE=release make init
cd builds/openatv/release/formuler4turbo/

source env.source

bitbake do_compile_kernelmodules

# reconfigure kernel (as i remember path was different not tmp)
cd builds/openatv/release/formuler4turbo/tmp/work-shared/formuler4turbo/kernel-source
make menuconfig

# put old symbols at build path but note that during build folder is overwriting
cp Module.symvers build-enviroment/builds/openatv/release/formuler4turbo/tmp/work-shared/formuler4turbo/kernel-source
