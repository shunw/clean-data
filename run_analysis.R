#get parts of the col name --- feature
colname<-read.table("UCI HAR Dataset/features.txt")

#get the train data and assign the col name to the dataset
train_data<-read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train_data)<-colname$V2

#add the activity label ,  add the datatyep( train or test here), and add the activity window here
train_label<-read.table("UCI HAR Dataset/train/Y_train.txt")
train_data$act_label_num<-train_label$V1
train_type<-rep("train", nrow(train_data))
train_data$type<-train_type
train_sub<-read.table("UCI HAR Dataset/train/subject_train.txt")
train_data$sub_window<-train_sub$V1

#make the  same test table as train data
test_data<-read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test_data)<-colname$V2
test_label<-read.table("UCI HAR Dataset/test/Y_test.txt")
test_data$act_label_num<-test_label$V1
test_type<-rep("test", nrow(test_data))
test_data$type<-test_type
test_sub<-read.table("UCI HAR Dataset/test/subject_test.txt")
test_data$sub_window<-test_sub$V1

#combine  two datasets together and eliminate the duplicated col
raw_data<-rbind(train_data, test_data)
raw_data_1<-raw_data[!duplicated(lapply(raw_data, summary))]

#find the key word "mean" and "sd" in the col name
col_mean<-grep("mean", colnames(raw_data_1), ignore.case=TRUE, value=TRUE)
col_std<-grep("std", colnames(raw_data_1), ignore.case=TRUE, value=TRUE)
library(dplyr)
raw_data_sel<-select(raw_data_1, act_label_num, type, sub_window, match(col_mean, names(raw_data_1)), match(col_std, names(raw_data_1)))
act_label<-as.character(raw_data_sel$act_label_num)
library(plyr)
act_label_1<-mapvalues(act_label, from = c("6", "5", "4", "3", "2", "1"), to = c("LAYING", "STANDING","SITTING","WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS", "WALKING"))
raw_data_sel_1<-cbind(act_label_1, raw_data_sel)

#export the raw data into the txt file
write.table(raw_data_sel_1, file = "all_data.txt", row.names = FALSE)

#calculate the avg for each variable for each activity and each subject
mean_data<-aggregate(raw_data_sel_1[, 5:88], list(act_label_1=raw_data_sel_1$act_label_1, sub_window=raw_data_sel_1$sub_window), mean)

#export the calculated tidy data into the txt file
write.table(mean_data, file = "mean_data.txt", row.names = FALSE)
