library(tidyverse)
titanic <- read.csv("https://raw.github.ubc.ca/ubc-mds-2017/datasets/master/data/titanic.csv?token=AAADo4_pgfaKMIvAdBhLLo8RMUtYhIOOks5aKKDrwA%3D%3D")
titanic_head <- head(titanic)
write.csv(titanic_head, "../results/titanic_head.csv")
