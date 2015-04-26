
# This script reads the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

# A full description of the raw data is available at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# It then merges the training and tests sets together and produces a tidy data set 
# of the average of the mean values and standard deviations of the measurements
# for each activity and each subject.



# Load the necessary libraries
        library(dplyr)

# Load the datasets
        # Read in train dataset, sactivity labels, and subject ids
        train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        train$subject_id <- c(t(read.table("./UCI HAR Dataset/train/subject_train.txt")))
        train$activity_labels <- c(t(read.table("./UCI HAR Dataset/train/Y_train.txt")))
        
        # Read in test dataset, activity labels, and set subject id to zero
        test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        test$subject_id <- 0
        test$activity_labels <- c(t(read.table("./UCI HAR Dataset/test/Y_test.txt")))


# Merge the training and the test sets to create one data set.
        combined <- rbind(train, test)

# Add descriptive labels and variable names
        # Add descriptive activity names to name the activities in the data set
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt"
                                      , col.names = c("activity_labels","activity_names"))
        combined <- merge(combined, activity_labels, all = TRUE)
        
        # Appropriately labels the data set with descriptive variable names. 
        features <- read.table("./UCI HAR Dataset/features.txt")
        names(combined) <- c("activity_labels", as.vector(features[,2]),"subject_id","activity_names")


# Extracts only the measurements on the mean and standard deviation for each measurement. 
        filtered <- combined[,c(grep("subject_id",names(combined))
                                , grep("activity_names",names(combined))
                                , grep("mean()", names(combined))
                                , grep("std()",names(combined)))]

# Summarize the data with the average of each variable for each activity and each subject and return a tidy data set
        TidyData <- group_by(filtered,subject_id,activity_names) %>% summarise_each(funs(mean))

# Unload the libraries
        detach("package:dplyr")

# Write the data table to a file and view it
write.table(TidyData, "TidyData.txt",row.name=FALSE)
data <- read.table("TidyData.txt", header = TRUE) 
View(data)


