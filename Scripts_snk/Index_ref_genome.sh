#!/bin/bash

#SBATCH --partition=fast
#SBATCH --job-name=Config_snakemake

# First, we import and parse the input arguments
while getopts hw:c: opt; do
   case "${opt}" in
   [h?])
      echo "This script index the reference genome given as input"
      echo ""
      echo "  Usage Index_ref_genome.sh -i input_path -o output_path"
      echo ""
      echo "      Options:"
      echo "          -c        Path to the configuration file"
      echo "          -w        Working directory"
      echo "          -h        Displays this help message"
      exit 0
      ;;
   c)
      config_file="${OPTARG}"
      ;;
   w)
      Working_directory="${OPTARG}"
      ;;
   esac
done

# Get some variables that will be used in the script
input_ref_genome=$(grep "Reference_genome" "${working_directory}${config_file}" | cut -d" " -f2 | sed 's/"//g')
genome_name=$(echo "${input_ref_genome}" | rev | cut -d"/" -f1 | rev)
out_dir=$(grep "output_path" "${working_directory}${config_file}" | cut -d" " -f2 | sed 's/"//g')"Reference/"
output_genome="${out_dir}${genome_name}"

# Check if the file is running
echo "Indexing reference genome ........... ${genome_name}"

# Run bwa if needed
mkdir -p "${out_dir}"
cp "${input_ref_genome}"* "${out_dir}"
if [ ! -f "${output_genome}.amb" ]; then
   echo "Running bwa"
   module load bwa/0.7.17
   bwa index "${output_genome}"
   module unload bwa/0.7.17
fi

# Run samtools if needed
if [ ! -f "${output_genome}.fai" ]; then
   echo "Running samtools"
   module load samtools/1.18
   samtools faidx "${output_genome}"
   module unload samtools/1.18
fi
