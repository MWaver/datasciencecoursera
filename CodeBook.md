#Code Book for Course Project - Getting & Cleaning Data

##About the dataset

This data comes from the **Human Activity Recognition Using Smartphones Dataset** (version 1.0) set of experiments.

It consists of data derived from readings of two sensors, namely the accelerometer and gyroscope of a smartphone, that were captured while a group of 30 subjects (aged 19-48 years old) were performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying).

The data captured was randomly partitioned into two sets, one being the data of 30% of the volunteers to be considered the *’test’* data, and the other set being the data of the remaining 70% of the volunteers to be considered as the *’training’* data. 

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Making the data tidy

The data in its raw form is distributed across many distinct files. In order to be able to perform proper analysis on this data, it must first be cleaned up, merged and reshaped. The following tasks were requested for this assignment:

1. Merge the *training* and the *test* sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

For this purpose, a script named **“run_analysis.R”** was created. The rest of this document explains the structure of the resulting data and how this script performs the tasks requested above.

For more details on how the script performs the operations listed above, please see section **“Running the script”** below. 

##Resulting data

The execution of the **”run_analysis.R”** script yields two data frame general variables. The first is named **tidyData1** and meets requirements #1-4 listed above. The second is named **tidyData2** and meets requirement #5.

For both of these data frames, the name and arrangement of the variables is the same and correspond to the following:

Variable Name | Type | Range | Description
--------------|------|-------|------------
subject | Factor | 1 - 30 | Number representing each of the 30 volunteer subjects that participated in the experiment
activity | Factor | 1 - 6 | Label of the activity the subject was performing: LAYING, SITTING, STANDING, WALKING, WALING_DOWNSTAIRS, WALKING_UPSTAIRS
timeBodyAccelerationMeanX | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration for the X axis                                      
timeBodyAccelerationMeanY | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration for the Y axis                                       
timeBodyAccelerationMeanZ | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration for the Z axis                                       
timeBodyAccelerationStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration for the X axis                         
timeBodyAccelerationStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration for the Y axis                         
timeBodyAccelerationStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration for the Z axis                         
timeGravityAccelerationMeanX | Num | (-1) - 1 | Mean of the Time Domain Gravity Acceleration for the X axis                                    
timeGravityAccelerationMeanY | Num | (-1) - 1 | Mean of the Time Domain Gravity Acceleration for the Y axis                                    
timeGravityAccelerationMeanZ | Num | (-1) - 1 | Mean of the Time Domain Gravity Acceleration for the Z axis                                    
timeGravityAccelerationStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Time Domain Gravity Acceleration for the X axis                       
timeGravityAccelerationStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Time Domain Gravity Acceleration for the Y axis                       
timeGravityAccelerationStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Time Domain Gravity Acceleration for the Z axis                       
timeBodyAccelerationJerkSignalMeanX | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration Jerk Signal for the X axis                             
timeBodyAccelerationJerkSignalMeanY | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration Jerk Signal for the Y axis                             
timeBodyAccelerationJerkSignalMeanZ | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration Jerk Signal for the Z axis                             
timeBodyAccelerationJerkSignalStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration Jerk Signal for the X axis                
timeBodyAccelerationJerkSignalStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration Jerk Signal for the Y axis                
timeBodyAccelerationJerkSignalStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration Jerk Signal for the Z axis                
timeBodyAngularVelocityMeanX | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity for the X axis                                    
timeBodyAngularVelocityMeanY | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity for the Y axis                                    
timeBodyAngularVelocityMeanZ | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity for the Z axis                                    
timeBodyAngularVelocityStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity for the X axis                      
timeBodyAngularVelocityStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity for the Y axis                       
timeBodyAngularVelocityStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity for the Z axis                       
timeBodyAngularVelocityJerkSignalMeanX | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity Jerk Signal for the X axis                          
timeBodyAngularVelocityJerkSignalMeanY | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity Jerk Signal for the Y axis                          
timeBodyAngularVelocityJerkSignalMeanZ | Num | (-1) - 1 | Mean of the Time Domain Angular Velocity Jerk Signal for the Z axis                          
timeBodyAngularVelocityJerkSignalStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity Jerk Signal for the X axis             
timeBodyAngularVelocityJerkSignalStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity Jerk Signal for the Y axis             
timeBodyAngularVelocityJerkSignalStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Time Domain Angular Velocity Jerk Signal for the Z axis             
timeBodyAccelerationMagnitudeMean | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration Magnitude                               
timeBodyAccelerationMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration Magnitude                  
timeGravityAccelerationMagnitudeMean | Num | (-1) - 1 | Mean of the Time Domain Gravity Acceleration Magnitude                            
timeGravityAccelerationMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Time Domain Gravity Acceleration Magnitude               
timeBodyAccelerationJerkSignalMagnitudeMean | Num | (-1) - 1 | Mean of the Time Domain Body Acceleration Jerk Signal Magnitude                     
timeBodyAccelerationJerkSignalMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Acceleration Jerk Signal Magnitude        
timeBodyAngularVelocityMagnitudeMean | Num | (-1) - 1 | Mean of the Time Domain Body Angular Velocity Magnitude                            
timeBodyAngularVelocityMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Angular Velocity Magnitude               
timeBodyAngularVelocityJerkSignalMagnitudeMean | Num | (-1) - 1 | Mean of the Time Domain Body Angular Velocity Jerk Signal Magnitude                  
timeBodyAngularVelocityJerkSignalMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Time Domain Body Angular Velocity Jerk Signal Magnitude    
frequencyBodyAccelerationMeanX | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration for the X axis                                  
frequencyBodyAccelerationMeanY | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration for the Y axis                                  
frequencyBodyAccelerationMeanZ | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration for the Z axis                                  
frequencyBodyAccelerationStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration for the X axis                     
frequencyBodyAccelerationStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration for the Y axis                     
frequencyBodyAccelerationStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration for the Z axis                     
frequencyBodyAccelerationJerkSignalMeanX | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration Jerk Signal for the X axis                        
frequencyBodyAccelerationJerkSignalMeanY | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration Jerk Signal for the Y axis                        
frequencyBodyAccelerationJerkSignalMeanZ | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration Jerk Signal for the Z axis                       
frequencyBodyAccelerationJerkSignalStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration Jerk Signal for the X axis           
frequencyBodyAccelerationJerkSignalStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration Jerk Signal for the Y axis           
frequencyBodyAccelerationJerkSignalStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration Jerk Signal for the Z axis           
frequencyBodyAngularVelocityMeanX | Num | (-1) - 1 | Mean of the Frequency Domain Angular Velocity for the X axis                               
frequencyBodyAngularVelocityMeanY | Num | (-1) - 1 | Mean of the Frequency Domain Angular Velocity for the Y axis                               
frequencyBodyAngularVelocityMeanZ | Num | (-1) - 1 | Mean of the Frequency Domain Angular Velocity for the Z axis                               
frequencyBodyAngularVelocityStandardDeviationX | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Angular Velocity for the X axis                    
frequencyBodyAngularVelocityStandardDeviationY | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Angular Velocity for the Y axis                  
frequencyBodyAngularVelocityStandardDeviationZ | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Angular Velocity for the Z axis                  
frequencyBodyAccelerationMagnitudeMean | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration Magnitude                          
frequencyBodyAccelerationMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration Magnitude             
frequencyBodyAccelerationJerkSignalMagnitudeMean | Num | (-1) - 1 | Mean of the Frequency Domain Body Acceleration Jerk Signal Magnitude                 
frequencyBodyAccelerationJerkSignalMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Acceleration Jerk Signal Magnitude   
frequencyBodyAngularVelocityMagnitudeMean | Num | (-1) - 1 | Mean of the Frequency Domain Body Angular Velocity Magnitude                       
frequencyBodyAngularVelocityMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Angular Velocity Magnitude          
frequencyBodyAngularVelocityJerkSignalMagnitudeMean | Num | (-1) - 1 | Mean of the Frequency Domain Body Angular Velocity Jerk Signal Magnitude             
frequencyBodyAngularVelocityJerkSignalMagnitudeStandardDeviation | Num | (-1) - 1 | Standard Deviation of the Frequency Domain Body Angular Velocity Jerk Signal Magnitude 


**tidyData1**: 68 variables, 10299 observations

**tidyData2**: 68 variables, 180 observations

##Running the script

As described in the **README.md** file, please make sure you have first set your working directory properly prior to running the script. If you happen to already have the UCI HAR dataset downloaded and extracted, please set the working directory (using the “*setwd()*” function) so that it is **one level above the “UCI HAR Dataset” folder** containing the extracted data (*i.e. "CurrentWorkingDirectory/UCI HAR Dataset”*). This will avoid the unnecessary download and extraction of the dataset.

In order to run the script, simply use the *source()* command. 

###1. Loading the files from the dataset

This script is expecting to find the UCI HAR Dataset extracted files in a folder called **UCI HAR Dataset** located inside the current working directory:
i.e.: *”CurrentWorkingDirectory/UCI HAR Dataset/“*
 
If the data is found, the content will be loaded and processed to generate the tidy data.

If the **UCI HAR Dataset** folder cannot be found at that location, the script looks for the zip file containing the data in the current working directory.
i.e.: "CurrentWorkingDirectory/getdata_projectfiles_UCI HAR Dataset.zip"

If the **getdata_projectfiles_UCI HAR Dataset.zip** cannot be found, it will be downloaded in the current working directory.

Once the **getdata_projectfiles_UCI HAR Dataset.zip** has either been found or downloaded, the file is extracted in a new folder called **UCI HAR Dataset** contained inside the current working directory and the content is loaded and processed to generate the tidy data.

The archived dataset includes the following files:

* **README.txt** : *Not used by the script*

* **features_info.txt**: *Not used by the script*

* **features.txt**: List of all features.

* **activity_labels.txt**: Links the class labels with their activity name.

* **train/X_train.txt**: Training set.

* **train/y_train.txt**: Training labels.

* **test/X_test.txt**: Test set.

* **test/y_test.txt**: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* **train/subject_train.txt**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* **train/Inertial Signals/total_acc_x_train.txt**: *Not used by the script*

* **train/Inertial Signals/body_acc_x_train.txt**: *Not used by the script* 

* **train/Inertial Signals/body_gyro_x_train.txt**: *Not used by the script*

Each file is loaded into its own data frame bearing the same name. For example, the file **”features.txt”** is loaded into a data frame called **“features”**.

###2. Merging Test Data and Train Data

Once all data files have been loaded into data frames, the *’X_test’* data set is merged with the *’X_train’* data set into a single data frame called *’X’*.

The same is performed for *’y_test’* and *’y_train’* data into a data frame called *’y’*.

###3. Improve variable names for subject and activity data

The variable name of the subject data is renamed to *’subject’*, while the variable name of the activity data is renamed to *’activity’*.

###4. Subsetting the features data set  

As it is requested to extract only the measurements on the mean and standard deviation for each measurement, the *’X’* data set is subset based on the names of the features that contains either *’mean()’* or *’std()’*.

This is achieved by using the **grepl()** command with these criteriae on the feature names data frame *’features’* and using the resulting logical vector to subset the *’X’* data frame.

###5. Improving the variable names for the features data set

The feature measurements to keep having now been identified and subset in the previous step, the same logical vector is applied on the feature names vector *’features’*. The resulting vector is then processed by changing unintelligible abbreviations to words that are easier to understand, by the use of the **sub()** and **gsub()** commands.

The result is then applied to the variable names of the *’X’* data frame.

###6. Merging the subject, activity and features data sets

Now that the subject, activity and feature data frames have proper variable names, it is time to merge them together.

The three data frames are merged in this fashion, from left to right:
* *‘subject’* data set
* activity data set *’y’*
* desired features data set *’X’*

###6. Ordering data and replacing activities by their activity labels

The resulting data frame is ordered, first by **subject** in ascending order, then by **activity** in ascending order.

Once the data frame is ordered, the values for the *’activity’* variable are replaced by their equivalent from the *’activity_labels’* data frame (i.e.: LAYING, SITTING, STANDING, WALKING, WALING_DOWNSTAIRS, WALKING_UPSTAIRS).

###7. Generating the second, independent tidy data set and its text file

A second, independent tidy data set with the average of each variable for each activity and each subject is generated and named **“tidyData2”**.

A text file "**tidydata.txt**" is then generated from this data set into the current working folder.

