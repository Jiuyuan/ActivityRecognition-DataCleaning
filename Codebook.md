## Explaination of the variables in run_analysis.R

1. ```x_total```, ```y_total```, ```subject``` are dataframes after merging test and train.
2. ```featuresSplited``` is a list storing all the measurements names after spliting with "**-**". ```colSelect``` is a vector containing all the column numbers that correspond to **mean** and **stdev**.
3. ```selectedData``` is a subset of x_total with only the **mean** and **stdev** measurements.
4. ```bindData``` is the dataset including subject ID and activity ID.
5. ```meanData``` is a summary of the ```bindData``` after grouped with subject ID and activity ID.
