#!/usr/bin/env bash
set -eu

__INSTALL_SH_DIR=$(
    cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd
)

source ${__INSTALL_SH_DIR}/activate.sh

mkdir -p ~/.local/share/jupyter/kernels
pushd ~/.local/share/jupyter/kernels
    # cp -r /global/common/software/nersc9/julia/kernels/rendered/*-beta .
    cp -r /global/common/software/nersc/julia_hpc_24/kernels/* .
popd

julia_versions=("julia/1.8.5" "julia/1.9.4" "julia/1.10.8" "julia/1.11.3")
for jv in "${julia_versions[@]}"
do
    ml load $jv
    julia /global/common/software/nersc9/julia/kernels/bootstrap.jl
done

