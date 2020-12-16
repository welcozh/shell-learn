#!/bin/bash
#SBATCH -J InSAR-unzip
#SBATCH -p Plus
#SBATCH -t 1-00:00:00
#SBATCH -N 1
#SBATCH -o log/%j.unzip

DATA_PATH=$1
SAVE_PATH=$2

echo Unzip: start...

echo ${SLURM_JOB_NODELIST}

srun ./extractio-new $DATA_PATH $SAVE_PATH

echo Unzip: finished...

