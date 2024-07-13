#!/bin/bash

#SBATCH -J EDIPIC-2D
#SBATCH -p short

date

mpirun -np 16 ./EDIPIC-2D

date
