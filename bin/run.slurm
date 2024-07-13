#!/bin/bash

#SBATCH -J EDIPIC-2D
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 16

date

mpirun -np 16 ./EDIPIC-2D

date
