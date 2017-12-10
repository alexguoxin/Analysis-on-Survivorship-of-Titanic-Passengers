# Analysis on Survivorship of Titanic Passengers

DSCI 522 Project

Xin (Alex) Guo, Nov 2017

## Overview

On April 15, 1912, the British passenger liner "Titanic" sank in the North Atlantic Ocean after it collided with an iceberg during its maiden voyage from Southampton to New York City. There were an estimated 2,224 passengers and crew aboard the ship, and more than 1,500 died, making it one of the deadliest commercial peacetime maritime disasters in modern history. (source: [Wikipedia](https://en.wikipedia.org/wiki/RMS_Titanic)) This project is trying to analyze if passenger class played a role in survivorship. From the result we can get an idea about the effect of passengers' social status and privilege on their fate in this tragedy.

## Dataset

The dataset used in this analysis, [`titanic.csv`](https://github.com/alexguoxin/Survivorship-of-Titanic-Passengers/blob/master/data/titanic.csv), is from [the list of datasets in MDS program](https://github.ubc.ca/ubc-mds-2017/datasets). It describes the survival status of 1,309 individual passengers on Titanic. The variables in the dataset are `pclass`, `survived`, `name`, `sex`, `age`, `sibsp`, `parch`, `ticket`, `fare`, `cabin`, `embarked`, `boat`, `body` and `home.dest`. `pclass` refers to the passenger class (1st, 2nd, 3rd), and is a proxy for socio-economic class. `survived` indicates the survivorship of the passenger with 1 being survived and 0 being perished. 

## Hypothesis

My hypothesis is that more passengers in higher classes survived than those in lower classes because preference was given to passengers in higher classes, or they took advantage of their privilege to get rescued.

## Plan of Action
- Calculate the proportion of survivorship in each passenger class, and show the result in a table
- Create a bar chart to show the proportion difference of survivorship in each passenger class side by side
- Perform a Permutation test and report the p-value to see if the null hypothesis should be rejected or not

## Usage

To run the full analysis, open the command line/terminal/Git bash and follow the steps below:

1. Use command `cd` to change the current directory to the project root directory `/Survivorship-of-Titanic-Passengers`

2. Type the following command to run `clean_titanic.R`, which cleans the original data and saves the cleaned data as a csv file to the specified output path.

```
Rscript src/clean_titanic.R data/titanic.csv results/cleaned_titanic.csv
```

3. Type the following command to run `analysis.R`, which calculates the proportion of survival and mortality for each passenger class and saves the proportion table as a csv file to the specified output path.

```
Rscript src/analysis.R results/cleaned_titanic.csv results/proportion.csv
```

4. Type the following command to run `bar_chart.R`, which creates a bar chart showing the proportion and saves it to the specified output path.

```
Rscript src/bar_chart.R results/proportion.csv results/figure/bar_chart.png
```

5. Type the following command to knit `report.Rmd`, which creates the final report and saves a markdown file to the `doc` directory.

```
Rscript -e 'ezknitr::ezknit("src/report.Rmd", out_dir = "doc")'
```