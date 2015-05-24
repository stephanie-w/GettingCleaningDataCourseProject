
## run_analysis.txt
#   A script analysing the Human Activity Recognition Using Smartphones dataset,
#   by performing the following actions
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for 
#   each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.


library(tidyr)
library(dplyr)
library(reshape2)

# Load datas
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
	              colClasses = "numeric" , comment.char = "", header = FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     colClasses = "numeric" , comment.char = "", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", 
		      sep=" ", col.names=c('id', 'featureName'), 
                      colClasses=c("integer", "character"), header=F, 
                      comment.char = "", stringsAsFactors=F)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              sep=" ", col.names=c('id', 'activityLabel'), 
                              colClasses=c("integer", "character"), header=F, 
                              comment.char = "", stringsAsFactors=F)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                            sep=" ", col.names=c('activity'), 
                            colClasses=c("integer"), header=F, 
                            comment.char = "", stringsAsFactors=F)
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                             sep=" ", col.names=c('activity'), 
                             colClasses=c("integer"), header=F, 
                             comment.char = "", stringsAsFactors=F)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           sep=" ", col.names=c('subjectID'), 
                           colClasses=c("integer"), header=F, comment.char = "",
                           stringsAsFactors=F)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep=" ",
                            col.names=c('subjectID'), colClasses=c("integer"), 
                            header=F, comment.char = "", stringsAsFactors=F)

##1. Merges the training and the test sets to create one data set
colNames <- features$featureName
colnames(X_test) <- colNames
colnames(X_train) <- colNames
X_test <- cbind(subject_test, activity_test, X_test)
X_train <- cbind(subject_train, activity_train, X_train)
X <- rbind(X_test, X_train)

# Free memory
rm(X_test, X_train)

# Remove duplicate columns
X  <- X[,!duplicated(colnames(X))]

##2. Extracts only the measurements on the mean and standard deviation for each 
# measurement
X <- select(X, matches("(^subjectID$|^activity$|mean\\(\\)|std\\(\\))"))

##3. Uses descriptive activity names to name the activities in the data set
X <- mutate(X, activity=activity_labels[activity,]$activityLabel)

#Free memory
rm(activity_test, activity_train, subject_test, subject_train)

##4. Appropriately labels the data set with descriptive variable names
colNames <- colnames(X)
# Descriptive labels
colNames <- gsub("Acc",".Accelerator.", colNames)
colNames <- gsub("Gyro",".Gyroscope.", colNames)
colNames <- gsub("Mag",".Magnitude", colNames)
colNames <- gsub("^t","Time.", colNames)
colNames <- gsub("^f","Frequency.", colNames)
# Clean column names
colNames <- gsub("\\(\\)",'', colNames)
colNames <- gsub("[^a-zA-Z1-9_\\.]",'.', colNames)
colNames <- gsub("\\.\\.",'.', colNames)
# lowercase
colNames <- tolower(colNames)
colnames(X) <- colNames

##5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
# First, melt data with subjectid and activity as id and measures as variables
newX <- melt(X,
        id.vars = c("subjectid", "activity"),
        variable.name = "measure.name")
# Then, group by subjectid, activity, measure and compute the value mean
res <- newX %>%
        group_by(subjectid, activity, measure) %>%
        summarize(measure.average=mean(value))

# Save summary file
write.table(res, "tidy_UCI_HAR_dataset.txt", row.names = FALSE)

