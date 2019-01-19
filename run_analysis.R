run_analysis <- function () {

        #### Before using run_analysis.R, the following 7 dataframes (with exact names) should be available:   
        #### x_train, x_test, y_train, y_test, subject_train, subject_test, features (All lower cases).
        #### dplyr package is used for (5)
        
        ### (1) Row-combining training data and test data, and name the columns. 
        ### Since it is not required here, merging subject# and activity# will be done later in (5).
        x_total <- rbind(x_train, x_test)
        y_total <- rbind(y_train, y_test)
        subject <- rbind(subject_train, subject_test)
        
        colnames(x_total) <- features[, 2]
        
        ### (2) Extracting only the measurements on the mean and standard deviation for each measurement
        features[,2] <- as.character(features[,2])
        featuresSplited <- strsplit(features[,2], "-")
        colSelect <- c()
        for (i in 1:554) {
                ## If "mean()" or "std()" in feature names, store the corresponding row # in colSelect.
                ## The maximum of i is set to 554 because rows higher than 554 got only one string after strsplit().
                if (featuresSplited[[i]][2] == "mean()" | featuresSplited[[i]][2] == "std()")
                        colSelect <- rbind(colSelect, i)
        }
        ## Subsetting the total data. Selecting only the mean and std using colSelect
        selectedData <- x_total[, colSelect]
        
        ### (3) Using descriptive names for the activities 1 - 6
        y_total <- as.data.frame(as.factor(y_total[,1]))
        colnames(y_total) <- "activity"
        ## change the levels to descriptive names
        levels(y_total$activity) <- c("walking", "walkingupstairs","walkingdownstairs", "sitting", "standing", "laying")

        #### (4) Labeling data set with descriptive variable names has been done in (1)
        #### After subsetting, the column names preserved.
        
        #### (5) creating indepedent data set with the average of each var for each activity and each subject
        subject <- as.data.frame(as.factor(subject[,1]))
        colnames(subject) <- "subject"
        
        ## Putting subject# and activity# and data in a single dataframe before grouping and summarizing the data.
        bindData <- data.frame(cbind(subject, y_total, selectedData))
        
        ## using group_by() from dplyr package to group bindData in to two layers. 
        ## Then using summarize_all() to get all the means of each data by the groups.
        by_sub_act <- group_by(bindData, subject, activity)
        meanData <- summarize_all(by_sub_act, mean)
        
        meanData
}