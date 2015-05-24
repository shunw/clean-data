# How to run the script
Please put the r script in the same folder of the datafile (UCI HAR Dataset), and run this script. 
The script works as:
1. get the train data first, and add some necessary columns like the activity labels, subject and so on into the dataframe. 
2. do the same thing to the test data afterwards
3. combine these two data with rbind function
4. remove the duplicated column data
5. copy the col of activity label and replace the number with its actual activity name
6. calculate the mean by group


#code book
1. act_label_1: this is the activity in the experiment, including:"LAYING", "STANDING","SITTING","WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS", "WALKING"
2. act_label_num: this is the activity number recorded in the experiment. 6="LAYING", 5="STANDING",4="SITTING",3="WALKING_DOWNSTAIRS", 2="WALKING_UPSTAIRS", 1="WALKING"
3. type: there are two type of the data, one is "train" data, the other is "test" data
4. sub_window: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
5. from col 5 to col 88, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
6. The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
