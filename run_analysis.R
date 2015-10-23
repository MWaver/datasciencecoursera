# This script is expecting to find the UCI HAR Dataset extracted files in a folder
# called 'UCI HAR Dataset' located in the current working directory:
# i.e.: "CurrentWorkingDirectory/UCI HAR Dataset/"
# If the data is found, the content will be loaded and processed to generate the
# tidy data.

# If the 'UCI HAR Dataset' folder cannot be found at that location, the script looks
# for the zip file containing the data in the current working directory.
# i.e.: "CurrentWorkingDirectory/getdata_projectfiles_UCI HAR Dataset.zip"

# If the "getdata_projectfiles_UCI HAR Dataset.zip" cannot be found, it will be
# downloaded in the current working directory.

# Once the "getdata_projectfiles_UCI HAR Dataset.zip" has either been found or
# downloaded, the file is extracted in a new folder called 'UCI HAR Dataset' 
# contained in the current working directory and the content is loaded and processed
# to generate the tidy data.

if(!file.exists("UCI HAR Dataset")){
    if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")){
        print("UCI HAR Dataset not found. Downloading data file")
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl,dest = "./getdata_projectfiles_UCI HAR Dataset.zip",method = "curl")
        }
    print("Extracting data file")
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}
#setwd("./UCI HAR Dataset")



# Loading activity labels and features data
print("Loading Activity and Features data")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt",header = FALSE,stringsAsFactors = FALSE)

# Loading TEST data
print("Loading TEST data")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, stringsAsFactors = FALSE)

# Loading TRAIN data
print("Loading TRAIN data")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, stringsAsFactors = FALSE)

# Binding TEST and TRAIN data together
print("Data Loading Complete. Now merging TEST and TRAIN data")

subject <- rbind(subject_test, subject_train)
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
rm(subject_test, subject_train, X_test, X_train, y_test, y_train)

print("Tidying stuff up...")

# Giving proper vairable names for subject and activity
colnames(subject) <- "subject"
colnames(y) <- "activity"
        
#  Identify the columns that contain the features we want to keep
#  (i.e all mean() and std() features)
#  and use these to subset the X data frame
desiredFeatures <- grepl('std()',features[,2],fixed = TRUE) | grepl('mean()',features[,2],fixed = TRUE)
X <- X[,desiredFeatures]

# Gave these features an 'human understandable' name
colnames(X) <- features[desiredFeatures,2]
colnames(X) <- sub("^t", "time", colnames(X))
colnames(X) <- sub("^f", "frequency", colnames(X))
colnames(X) <- gsub("BodyBody", "Body", colnames(X))
colnames(X) <- sub("Acc", "Acceleration", colnames(X))
colnames(X) <- sub("Gyro", "AngularVelocity", colnames(X))
colnames(X) <- sub("Jerk", "JerkSignal", colnames(X))
colnames(X) <- sub("Mag", "Magnitude", colnames(X))
colnames(X) <- sub("-mean", "Mean", colnames(X))
colnames(X) <- sub("-std", "StandardDeviation", colnames(X))
colnames(X) <- sub("-X", "X", colnames(X))
colnames(X) <- sub("-Y", "Y", colnames(X))
colnames(X) <- sub("-Z", "Z", colnames(X))
colnames(X) <- gsub("[[:punct:]]", "", colnames(X))

# Bind subject, activity and features data frames together, from left to right:
#   1st - subject vector    
#   2nd - activities vector (y)
#   3rd - desired X features with understandable variable names
tidyData1 <- cbind(subject,y,X)

# Order data set according to ascending subject and then ascending activity,
# factor subject variable,
# map activities to their activity labels and factor this variable,
tidyData1 <- tidyData1[order(tidyData1$subject,tidyData1$activity),]
tidyData1$subject <- factor(tidyData1$subject)
tidyData1$activity = factor(activity_labels[tidyData1$activity,2])

# Produce table requested in step 5 and write it into a text file
tidyData2 <- aggregate(. ~subject + activity, data = tidyData1, FUN = mean)
tidyData2 <- tidyData2[order(tidyData2$subject,tidyData2$activity),]
print("Generating 'tidydata.txt' file")
write.table(tidyData2, file = "tidydata.txt",row.name=FALSE)
        
# Freeing memory of unnecessary variables
rm(fileurl, activity_labels, features, subject, X, y, desiredFeatures)
        
print("Done! Step 4 table is 'tidyData1' and Step 5 table is 'tidyData2'")
