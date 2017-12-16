# Docker file for Survivorship-of-Titanic-Passengers
# Xin (Alex) Guo, Dec, 2017

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

# install the ezknitr packages
RUN Rscript -e "install.packages('ezknitr', repos = 'http://cran.us.r-project.org')"

# install the knitr packages
RUN Rscript -e "install.packages('knitr', repos = 'http://cran.us.r-project.org')"

# install the coin packages
RUN Rscript -e "install.packages('coin', repos = 'http://cran.us.r-project.org')"

# completes analysis on survivorship of Titanic passengers from top to bottom (from raw data to rendering report)
RUN make all
