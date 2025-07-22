#!/usr/bin/env bash
set -eu

__INSTALL_SH_DIR=$(
    cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd
)

mkdir -p ~/.local/share/jupyter/kernels
pushd ~/.local/share/jupyter/kernels
    cp -r ${__INSTALL_SH_DIR}/nersc-julia-debug-* .
popd

