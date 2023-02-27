#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=CTCF_macs
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=teva8543@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100gb
#SBATCH --time=6:00:00
#SBATCH --output=CTCF_chip_macs.out
#SBATCH --error=CTCF_chip_macs.err
date; hostname

BASE_PATH=/scratch/Shares/rinn/JR/rchip/analysis/03_diff_peaks/data/BAM_files/ctcf

source activate macs3

macs3 callpeak -f BAMPE -t \
${BASE_PATH}/1_ctcf_chip_rep_1.mLb.clN.sorted.bam \
${BASE_PATH}/1_ctcf_chip_rep_2.mLb.clN.sorted.bam \
${BASE_PATH}/1_ctcf_chip_rep_3.R1.mLb.clN.sorted.bam \
${BASE_PATH}/1_ctcf_chip_rep_4.R1.mLb.clN.sorted.bam \
${BASE_PATH}/1_ctcf_chip_rep_5.R1.mLb.clN.sorted.bam \
-c \
${BASE_PATH}/4_input_rep_1.mLb.clN.sorted.bam \
${BASE_PATH}/4_input_rep_2.mLb.clN.sorted.bam \
${BASE_PATH}/4_input_rep_3.R1.mLb.clN.sorted.bam \
${BASE_PATH}/4_input_rep_4.R1.mLb.clN.sorted.bam \
${BASE_PATH}/4_input_rep_5.R1.mLb.clN.sorted.bam \
-g hs -n CTCF_chipseq_combined  -q 0.01 --outdir .
date