#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=RPB1_newversion_test
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=teva8543@colorado.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=6gb
#SBATCH --time=10:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Lets go"

module load singularity/3.1.1

nextflow run nf-core/chipseq -r 2.0.0 \
-profile singularity \
--paired_end \
--input design.csv \
--outdir /Users/teva8543/scratch/Shares/rinn/Tenaya/rChIP/rChIP/2022_10_04_RPB1/NFrun_newversion \
--fasta /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/GRCh38.primary_assembly.genome.fa \
--gtf /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/gencode.v38.annotation.gtf \
--macs_gsize 3200000000 \
--blacklist /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/hg38-blacklist.v2.bed \
--email teva8543@colorado.edu \
--skip_spp
-resume \
-c nextflow.config

date
