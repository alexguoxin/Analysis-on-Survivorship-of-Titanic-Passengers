# Analysis on Survivorship of Titanic Passengers

DSCI 522 Project

Xin (Alex) Guo, Nov 2017

## Dataset

The dataset used in this analysis, `titanic`, is from the MDS list of datasets. It describes the survival status of individual passengers on the fatal maiden voyage of the ocean liner ‘Titanic’. The variables in the dataset are pclass, survived, name, sex, age, sibsp, parch, ticket, fare, cabin, embarked, boat, body and home.dest. `pclass` refers to the passenger class (1st, 2nd, 3rd), and is a proxy for socio-economic class. `survived` indicates the survivorship of the passenger with 1 being survived and 0 being perished.

## Question

The question this analysis trying to answer is if passenger class played a role in survivorship. From the answer we can get an idea if the passengers' social status and privilege affected their fate in this tragedy.

## Hypothesis

- Null Hypothesis: The proportions of passengers survived in different passenger classes are the same.
- Alternative Hypothesis: More passengers in higher classes survived than those in lower classes because preference was given to passengers in higher classes, or they took advantage of their privilege to get rescued.

## Plan of Action
- Calculate the proportion of survivorship in each passenger class, and show the result in a table
- Visualization: bar chart to show the difference of survivorship in each passenger class side by side
- Perform a t-test and report the p value to see if the null hypothesis should be rejected or not
