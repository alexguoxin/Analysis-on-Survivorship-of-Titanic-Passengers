#! /usr/bin/env Rscript 
# analysis.R
# Xin (ALex) Guo, Dec 2017
#
# This script calculates the proportion of survival and mortality for each passenger class 
# and save the proportion table as a csv file to the specified output path. 
# It also create a bar chart showing the proportion and save it to the specified output path.
# This script takes a path of the input csv file, a path of the output csv file for the proportion table 
# and a path of the output figure as the variable arguments.
#
# Usage: Rscript analysis.R ../results/cleaned_titanic.csv ../results/proportion.csv ../results/figure/bar_chart.png

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data_path <- args[1]  # input path of the data
table_path <- args[2]  # output path of the table
figure_path <- args[3]  # output path of the figure

# define main function
main <- function(){
  
  # calculate the proportion of survival and mortality for each passenger class
  proportion <- read.csv(data_path) %>%
    group_by(pclass) %>% 
    summarise(Survival = mean(survived), Mortality = 1 - Survival)
  
  # gather the table for bar chart
  gathered_rate <- gather(proportion, key = 'Survivorship', value = 'Proportion', Survival, Mortality)
  
  # create a bar chart showing the proportion of survival and mortality for each passenger class
  bar_chart <- ggplot(gathered_rate, aes(x=pclass)) +
    geom_bar(aes(weight=Proportion, fill=Survivorship), position="fill") +
    labs(x="Passenger Class", y="Proportion", title="Survival and Mortality\nfor Each Passenger Class") +
    theme(plot.title = element_text(hjust = 0.5))
  
  # save the proportion table as a csv file to the specified output path
  write.csv(proportion, table_path, row.names = FALSE)
  
  # save the bar chart to the specified output path
  ggsave(figure_path, bar_chart)
}

# call main function
main()