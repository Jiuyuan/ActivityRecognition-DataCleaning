# Code Book for run_analysis.R
#### *ActivityRecognition-DataCleaning*

Before using run_analysis.R, please load the **dplyr** package and read the following **7 dataframes** (with their exact names) into R:   

* ```x_train```
* ```x_test```
* ```y_train```
* ```y_test```
* ```subject_train```
* ```subject_test```
* ```features```

For example, 
```
x_train <- read.table("~/test/X_test.txt", quote="\"", comment.char="")
```

The run_analysis.R script will do the following things:

1. Merges ```x_train``` and ```x_test``` to create one data set.
2. Extracts only the columns correspond to *mean* and *standard deviation* measurements (see *README_dataset.txt* for details).
3. Merges ```y_train``` and ```y_test``` and changes activity numbers to descriptive names according to *activity_labels.txt*.
4. labels the columns of dataset from 2 with descriptive variable names, and merges the dataset from 2 with activities and subjects, 
5. Creates an independent dataframe (the output of *run_analysis.R*) with the average of each variable for each activity and each subject.

Dataset reference:

1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
