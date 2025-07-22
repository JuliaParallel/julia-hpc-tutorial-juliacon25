#!/bin/bash
#SBATCH -A trn013
#SBATCH -C gpu
#SBATCH -q regular
#SBATCH --output=slurm_mpi_multinode.out
#SBATCH --reservation=juliacon_2
#SBATCH --time=00:05:00
#SBATCH --nodes=4
#SBATCH --ntasks=16

# This will load the activate.sh in the root path of this repository
# IMPORTATION: for this relative path to work, you need to be in this
# directory when running `sbatch`
source ../../activate.sh

# Load the latest Julia Module
ml load julia

# Run the Julia code -- we're usign `srun` to launch Julia. This is necessary
# to configure MPI. If you tried to use `MPI.Init()` outside of an srun, then
# the program will crash. Note also that you can't run an srun _insite_ of
# another srun.
srun julia --project -e 'do_save=true; include("diffusion_2d_mpi.jl");'
