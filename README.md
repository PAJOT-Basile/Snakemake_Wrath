# Snakemake_Wrath

This is a recode of the [WRATH pipeline](https://github.com/annaorteu/wrath/tree/main) developped by [Anna Orteu et al., 2024](https://academic.oup.com/mbe/article/41/3/msae041/7613881?login=false)


This uses a snakemake to run the scripts designed by A. Orteu et al and uses the steps designed in the WRATH pipeline.

This snakemake takes as input a configuration file (specifying the path to the input data, the paths of the outputs, ...) as well as the arguments used in the wrath script.
This snakemake also uses a text file in a Pop_map folder in which the paths to the input bam files have to be specified and a reference genome that has been indexed. Several population files and chromosomes can be specified to run simultaneously.

To run this analysis, indicate in the configuration file (`configuration_file.yaml`) the parameters to use in the analysis (change paths and wrath variables) and type:
```
sbatch launcher.sh -f configuration_file.yaml -s Index_and_wrath.snk
```

