#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=RPB1_macs
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=tenaya.vallery@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100gb
#SBATCH --time=6:00:00
#SBATCH --output=RPB1_chip_macs.out
#SBATCH --error=RPB1_chip_macs.err
date; hostname

BASE_PATH=/scratch/Shares/rinn/tenaya/rChIP/rChIP/2022_10_04_RPB1/results/bwa/mergedLibrary

source activate macs3

macs3 callpeak -f BAMPE -t \
${BASE_PATH}/RPB1_NoR_R1.mLb.clN.sorted.bam \
${BASE_PATH}/RPB1_NoR_R2.mLb.clN.sorted.bam \
-c \
${BASE_PATH}/input_R1.mLb.clN.sorted.bam  \
${BASE_PATH}/input_R2.mLb.clN.sorted.bam \
-g hs -n RPB1_chipseq_combined  -q 0.01 --outdir .
date