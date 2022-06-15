#!/bin/bash
#SBATCH -p short
#SBATCH --job-name=CTCF_test
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


nextflow run nf-core/chipseq -r 1.2.1 \
-profile singularity \
--input /scratch/Shares/rinn/tenaya/rChIP/rChIP/2022_1_28_CTCF_RBP1_SAFA/design.csv \
--fasta /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/GRCh38.primary_assembly.genome.fa \
--gtf /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/gencode.v38.annotation.gtf \
--macs_gsize 3.2e9 \
--blacklist /scratch/Shares/rinn/genomes/Homo_sapiens/Gencode/v38/hg38-blacklist.v2.bed \
--email teva8543@colorado.edu \
-resume \
-c nextflow.config

date

