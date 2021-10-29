###getting and cleaning data course project
##1. Merges the training and the test sets to create one data set

#reading the train .txt files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#reading the test .txt files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#reading feature and activity_lables
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#row binding the X test and train data and giving variables names
X_bind <- rbind(X_test, X_train)
colnames(X_bind) <- features[,2]

#row binding the Y test and train data and giving variable name as "activity"
Y_bind <- rbind(Y_test, Y_train)
colnames(Y_bind) <- "activity"


#row binding the subject data and naming the column as "ID"
subject_bind <- rbind(subject_test, subject_train)
colnames(subject_bind) <- "identifierID"

#merging all data using c bind
final_mergeddata <- cbind(Y_bind, subject_bind, X_bind) 

##2. Extracts only the measurements on the mean and standard deviation for each measurement
MeanStd_col <- grep("mean\\(\\)|std\\(\\)", names(final_mergeddata))
MeanSD_data <- final_mergeddata[,c(MeanStd_col)]

##3. Uses descriptive activity names to name the activities in the data set
final_mergeddata$activityID <- activity_labels[final_mergeddata$activityID, 2]

##4. Appropriately labels the data set with descriptive variable names
# t for time
# acc for acceleration
# Gyro for gyroscope
# 


##5. independent tidy data set with the average of each variable for each activity and each subject