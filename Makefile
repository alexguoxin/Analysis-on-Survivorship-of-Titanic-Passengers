# Driver script
# Xin (Alex) Guo, Dec 2017
# Completes analysis on survivorship of Titanic passengers from top to bottom (from raw data to rendering report)
#
# Usage: 
# make all
# make clean

# run all analysis
all: doc/report.md

# clean data
results/cleaned_titanic.csv: data/titanic.csv src/clean_titanic.R
	Rscript src/clean_titanic.R data/titanic.csv results/cleaned_titanic.csv

# create proportion table
results/proportion.csv: results/cleaned_titanic.csv src/analysis.R
	Rscript src/analysis.R results/cleaned_titanic.csv results/proportion.csv

# create bar chart
results/figure/bar_chart.png: results/proportion.csv src/bar_chart.R
	Rscript src/bar_chart.R results/proportion.csv results/figure/bar_chart.png

# create final report
doc/report.md: src/report.Rmd results/proportion.csv results/figure/bar_chart.png results/cleaned_titanic.csv
	Rscript -e "ezknitr::ezknit('src/report.Rmd', out_dir = 'doc')"

# delete intermediate files
clean:
	rm -f results/cleaned_titanic.csv
	rm -f results/proportion.csv
	rm -f results/figure/bar_chart.png
	rm -f doc/report.md doc/report.html
