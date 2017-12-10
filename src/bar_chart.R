#! /usr/bin/env Rscript 
# bar_chart.R
# Xin (ALex) Guo, Dec 2017
#
# This script reads in the survival and mortality proportion table for each passenger class, 
# creates a bar chart showing the proportion and saves it to the specified output path.
# This script takes a path of the input csv file of the proportion table 
# and a path of the output figure as the variable arguments.
#
# Usage: Rscript bar_chart.R ../results/proportion.csv ../results/figure/bar_chart.png

library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
table_path <- args[1]  # input path of the table
figure_path <- args[2]  # output path of the figure

# define main function
main <- function(){
  
  # read in the proportion table of survival and mortality for each passenger class
  proportion <- read.csv(table_path)
  
  # gather the table for bar chart
  gathered_prop <- gather(proportion, key = 'Survivorship', value = 'Proportion', Survival, Mortality)
  
  # create a bar chart showing the proportion of survival and mortality for each passenger class
  bar_chart <- ggplot(gathered_prop, aes(x=pclass)) +
    geom_bar(aes(weight=Proportion, fill=Survivorship), position="fill") +
    labs(x="Passenger Class", y="Proportion", title="Survival and Mortality\nfor Each Passenger Class") +
    theme(plot.title = element_text(hjust = 0.5))
  
  # save the bar chart to the specified output path
  ggsave(figure_path, bar_chart)
}

# call main function
main()