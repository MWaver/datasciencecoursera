#Getting and Cleaning Data - Course Project

This set of files consists of a course project for the Coursera class *‘Getting and Cleaning Data’*.

The following files can be found in this repository:

* **README.md** :     This file. Includes instructions on how to run the script.
* **CodeBook.md**:    Describes data, variables and operations performed by the script to clean up the data.
* **run_analysis.R**: Script that generates the tidy data out of the provided data set.

##Instructions for this project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Executing the script

####Set a working directory

The script starts by looking for the UCI HAR dataset, checking if a folder named **“UCI HAR Dataset”** exists in the current working directory. If the dataset is not found, the dataset will be downloaded an extracted in a new folder called **"UCI HAR Dataset"** within the folder currently designated as the working directory (*i.e.: "CurrentWorkingDirectory/UCI HAR Dataset/"*).

Therefore, if you happen to already have the UCI HAR dataset downloaded and extracted, please set the working directory (using the “*setwd()*” function) so that it is **one level above the “UCI HAR Dataset” folder** as explained above. This will avoid the unnecessary download and extraction of the dataset.

####Run the script run_analysis.R

Simply source the **“run_analysis.R”** script file using the "*souce()*" command.

Upon the sourcing of the script, the following occurs:

* The UCI HAR Dataset is downloaded and extracted if it cannot be found
* The data files are loaded into respective data frames
* Train data and Test data are merged into a single data frame
* Variable names of the dataset are changed for names easier to understand 
* Subject, activity and selected features data are merged together
* Two tidy data frames (**”tidyData1”** & **”tidyData2”**) are generated as global variables from the merged data. See steps 4 & 5 above and **”CodeBook.md”** for details.
* The tidy data frame produced as requested in *Step 5* above is written to a text file (**”tidy data.txt”**) in the working directory

*Note: Status messages will appear in the console to inform you of the current operation being performed.*

####Additional information

For additional information on the variables produced and the processes involved, please read the file **”CodeBook.md”**. 
