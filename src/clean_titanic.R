#! /usr/bin/env Rscript 
# clean_titanic.R
# Xin (ALex) Guo, Dec 2017
#
# This script reads in the original data, cleans the data by selecting variables needed and save a cleaned csv file to the 
# specified output path. This script takes a path of the original csv file and a path for the cleaned csv as the variable 
# arguments.
#
# Usage: Rscript clean_titanic.R ../data/titanic.csv ../results/cleaned_titanic.csv

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
original_data <- args[1]  # path for the original data
cleaned_data <- args[2]  # path for the cleaned data

# define main function
main <- function(){
  
  # clean the data by selecting variables needed
  cleaned_titanic <- read.csv(original_data) %>% select(pclass, survived)
  
  # save a cleaned csv file to the specified output path
  write.csv(cleaned_titanic, cleaned_data, row.names = FALSE)
}

# call main function
main()