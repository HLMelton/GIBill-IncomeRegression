<div align="center"> 
<h1> GI Bill Income Regression </h1>

[![R](https://img.shields.io/badge/R-grey?logo=r&style=for-the-badge)]()
[![RStudio](https://img.shields.io/badge/RStudio-grey?logo=rstudio&style=for-the-badge)]()

</div>


## Cloning the Scripts
First, you'll want to clone the repo using git or by downloading the Zip file:

Cloning via Git:
```bash
git clone https://github.com/HLMelton/GIBill-IncomeRegression.git
```


## Preparing your Extract
For the specific data set used in my research it was a data set that included both the 1990(5% State) and 2001-2007(ACS). 

The Following Variables should be included in your data extract:
- YEAR
- SEX
- AGE
- INCTOT
- EDUC (EDUCD will be additionally included)
- VETSTAT (VETSTATD will addittionally be included)


## Running the Script
There are some Prerequisite libraries for our specific analysis which consist of the following:
- dplyr
- ggplot2
- car
- nlme
- mgcv

These can be installed by running lines 9-13 and initialized by lines 15-19 in RStudio. 


## Additional Notes 
- The working directory will need to be changed to your specific location where the file was cloned to. RStudio makes this seamless with their file explotere which allows the WD to be set. 
- Each Block of code includes a header comment to describe the function of each block and should be run sequentially to properly apply our filters of the sample population
- When generating the plots, there is the native option that is built into R and the ggplot implimentation. the GGPlot outputs are much cleaner and faster than their native counterparts, hence their usage. 
- Additionally there are extra linear regressions that have been commented out, to show the necessity for our specific regression method. 
- To switch the data to generate the plots for the baseline period, you must modify line 23 to define popData instead of preData
- 