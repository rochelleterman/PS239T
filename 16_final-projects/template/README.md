This is a template you can use for your final project. Fill in each section with information on your own project.

## Short Description

Give a short, 1-2 paragraph description of your project. Focus on the code, not the theoretical / substantive / academic side of things. 

## Dependencies

List what software your code depends on, as well as version numbers, like so:.

1. R, version 3.1
2. Python 2.7, Anaconda distribution.

(In your code itself, includes commands that install required packages.)

## Files

List all other files contained in the repo, along with a brief description of each one, like so:

### Data

1. polity.csv: Subset of the PolityVI dataset, available here: http://www.systemicpeace.org/inscrdata.html
2. nyt.csv: contains data from the New York Times API collected via collect-nyt.ipynb
2. analysis-dataset.csv: The final Analysis Dataset derived from the raw data above. It includes country-year values for all UN countries 1980-2010, with observations for the following variables: COW numeric code (*ccode*), year (*year*), polity score (*polity*), number of New York Times articles (*nyt*). 

### Code

1. 01_collect-nyt.ipynb: Collects data from New York Times API and exports data to the file nyt.csv
2. 02_merge-data.R: Loads, cleans, and merges the raw datasets above into the Anaysis Dataset. 
2. 03_analysis.R: Conducts descriptive analysis of the data, producing the tables and visualizations in the Results directory.

### Results

1. coverage-over-time.jpeg: Graphs the number of articles about each region over time.
2. regression-table.txt: Summarizes the results of OLS regression, modelling *nyt* on a number of covariates.

## More Information

Include any other details you think your user might need to reproduce your results. You may also include other information such as your contact information, credits, etc.
