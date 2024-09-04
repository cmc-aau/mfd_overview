# mfd_overview
This repo generates statistics and plots to summarize the [Microflora Danica](https://github.com/cmc-aau/mfd_wiki/wiki) project and reproduces the results from "Section I: The Microflora Danica data set" and Supplementary Figures 1 and 2 of the [MFD manuscripts](https://www.biorxiv.org/content/10.1101/2024.06.27.600767v1).

Please download the input data from the [Zenodo repo](https://zenodo.org/records/12605769) and the [metadata repo](https://github.com/cmc-aau/mfd_metadata) in the `/data` folder and amend the `/scripts/R_scripts/<NAME>.Rmd` files under the "Load data" section if required by new releases of the data. The files will generally have the form of <RELEASE_DATE>_<NAME>_.<EXTENSION> and "RELEASE_DATE" will have to match the one from the download.

## Scripts

Breakdown of the scripts contained in this repo and what they were used for:

- '/scripts/scripts_R/MFD_colors.R' is a utility script to re-create the same color palette for the MFD ontology habitats;
- '/scripts/scripts_R/mfd_table_map.Rmd' generates Figure 1a and Figure 1b;
- '/scripts/scripts_R/sankey_plot.Rmd' generates Figure 1c and Supplementary Figure 1;
- '/scripts/scripts_R/reference_DK_grid.Rmd' generates Supplementary Figure 2;
