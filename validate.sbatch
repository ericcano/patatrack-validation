#! /bin/bash

# request 1 node, 1 task, 24 CPUs, 3 V100 GPUs, and redirect the output and error
#SBATCH --partition=gpu --nodes=1 --tasks-per-node=1 --cpus-per-task=24 --gres=gpu:3 --constraint=v100 -o validation.%j.out -e validation.%j.err

# configure GCC 8.2.x and CUDA 10.1
module purge
module load gcc/8.2.0
module load cuda/10.1.105_418.39

# check the available resources
echo Host: `hostname`
echo Available CPU cores:
taskset -c -p $$ | cut -d' ' -f3- | sed -e's/c/C/' -e's/^/  /'
echo Avaliable GPUs:
nvidia-smi -L | sed -e's/^/  /'

# run the validation
./validate "$@"
