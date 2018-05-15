# The Diverging Beliefs and Practices of the Religiously Affiliated and Unaffiliated in the United States

This repository contains the data and code for the analysis in the paper entitled "The Diverging Beliefs and Practices of the Religiously Affiliated and Unaffiliated in the United States" which has now been accepted by *Sociological Science* and is forthcoming. The main analytical results can be found in the `analysis.html` file which can be opened with any web browser. 

The data here come from the General Social Survey. The raw data from a GSS extract through GSS Explorer are included in the `input` directory. The `output` directory contains the analytical data used in the analysis after recoding/cleaning of the raw data. 

All analysis was done in R. For those on a Mac or Unix machine, the entire analysis can be run from statch with the `run_entire_project.sh` bash script. Otherwise, here is the order in which scripts should be run to reproduce the analysis. 

- `check_packages.R` - This will check for necessary packages and install them if they are not currently installed.
- `useful_functions.R` - This script contains custom functions used in the anlaysis. 
- `organize_data.R` - This script that reads in the raw data, performs data manipulation and recoding, and output analytical dataset. A log file of this script is kept in the `logs` directory. 
- `analysis.Rmd` - The actual analysis. This script is an R Markdown file and will output all results to `analysis.html`.
