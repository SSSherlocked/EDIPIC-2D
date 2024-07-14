#!/bin/bash

#SBATCH --job-name=EDIPIC-2D
#SBATCH --partition=short
#SBATCH --nodes=2
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "Starting job $SLURM_JOB_ID"
echo "Running on $SLURM_JOB_NUM_NODES nodes"
echo "Running on $SLURM_NTASKS cores"
echo "Current working directory is `pwd`"
date

mpirun -np $1 ./EDIPIC-2D

date
echo "Job finished"