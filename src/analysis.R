#! /usr/bin/env Rscript 
# analysis.R
# Xin (ALex) Guo, Dec 2017
#
# This script calculates the proportion of survival and mortality for each passenger class 
# and save the proportion table as a csv file to the specified output path. 
# This script takes a path of the input csv file and a path of the output csv file for the proportion table as the variable arguments.
#
# Usage: Rscript analysis.R ../results/cleaned_titanic.csv ../results/proportion.csv

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data_path <- args[1]  # input path of the data
table_path <- args[2]  # output path of the table

# define main function
main <- function(){
  
  # calculate the proportion of survival and mortality for each passenger class
  proportion <- read.csv(data_path) %>%
    group_by(pclass) %>% 
    summarise(Survival = mean(survived), Mortality = 1 - Survival)
  
  # save the proportion table as a csv file to the specified output path
  write.csv(proportion, table_path, row.names = FALSE)
  
}

# call main function
main()