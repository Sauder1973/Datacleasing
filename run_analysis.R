install.packages("dplyr")
library(dplyr)
# 1.  Merge the training and the test sets to create one data set.
    # retrieve test dataset 
        #setwd("~/Data Science/Datacleansing/UCI HAR Dataset")
        features<- read.table ("features.txt")
        #setwd("~/Data Science/Datacleansing/UCI HAR Dataset/test")
        x_test<- read.table("X_test.txt")
        y_test<- read.table ("y_test.txt")
        subject_test<- read.table("subject_test.txt")
        #setwd("~/Data Science/Datacleansing/UCI HAR Dataset/train")
        x_train<- read.table("X_train.txt")
        y_train<- read.table("y_train.txt")
        y_subject<-read.table("subject_train.txt")
    # transpose features and combine as column names with test and train data sets
        features_t<- t(features)    
        feature_t<- features_t[2,]
        test_train<- rbind(x_train, x_test)
        colnames(test_train)<- feature_t
    #combine dataset and add subject and activty
        subject<- rbind(y_subject, subject_test)
        activity<- rbind(y_train, y_test)
        names(subject)<-"subject"
        names(activity)<- "activity"
        test_train_all<- cbind(subject,activity, test_train)
# 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
        mean_all<- test_train_all[,grep("mean()", names(test_train_all), value=TRUE)]      
        std_all<- test_train_all[,grep("std()", names(test_train_all), value=TRUE)]
        std_mean<- cbind(subject, activity, mean_all, std_all)
# 3.  Uses descriptive activity names to name the activities in the data set
      std_mean$activity <- factor(std_mean$activity,
          levels = c(1,2,3,4,5,6),
          labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", 
          "standing", "lying"))
# 4.  Appropriately labels the data set with descriptive variable names.
      # Create new dataset with the average of each 
      # variable for each activity and each subject. 
        mean_activity <- group_by(std_mean, subject, activity)        
# 5.  From the data set in step 4, creates a second, independent tidy data set with the 
      # average of each variable for each activity and each subject.
        by_activity<- summarise_each(mean_activity,funs(mean))
# upload your data set as a txt file created with 
# write.table() using row.name=FALSE
# direct output to a file 
        write.table(by_activity, "by_activity", row.names=FALSE)