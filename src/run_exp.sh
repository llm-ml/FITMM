#!/bin/bash
#SBATCH --job-name="FITMM_Baby.ft"
#SBATCH --output="/u/Projects/FITMM/logs/Baby.ft"
#SBATCH --partition=gpuA100x4
#SBATCH --mem=100G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1  # could be 1 for py-torch
#SBATCH --cpus-per-task=2   # spread out to use 1 core per numa, set to 64 if tasks is 1
#SBATCH --constraint="scratch"
#SBATCH --gpus-per-node=2
#SBATCH --gpu-bind=closest   # select a cpu close to gpu on pci bus topology
#SBATCH --account=inner-gpu
#SBATCH --no-requeue
#SBATCH -t 24:00:00

export CUDA_VISIBLE_DEVICES=1

source activate mmrec

torchrun --nproc_per_node=1 main.py -m FITMM -d baby
