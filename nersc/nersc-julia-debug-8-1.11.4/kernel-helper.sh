#!/bin/bash
module load PrgEnv-gnu
module load python
module load julia/1.11.4
module load cudnn

export JULIA_NUM_THREADS=8

readarray -t ijulia_bootstrap < <(julia /global/common/software/nersc9/julia/kernels/bootstrap.jl)

echo "Check-and-install returned following output:"
_IFS=$IFS
IFS=$'\n'
for each in ${ijulia_bootstrap[*]}
do
    echo $each
done
IFS=$_IFS

JULIA_EXEC=$(which julia)
KERNEL="${ijulia_bootstrap[-1]}"

echo "Connecting using JULIA_EXEC=$JULIA_EXEC and KERNEL=$KERNEL"
exec $JULIA_EXEC -i --startup-file=yes --color=yes -e "import IJulia; IJulia.run_kernel()" "$@"

