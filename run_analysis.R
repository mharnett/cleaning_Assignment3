 setwd("/Users/mharnett/Documents/datasciencecoursera/Getting_and_Cleaning_Data")
 download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
 unzip("dataset.zip")
 setwd("UCI Har Dataset")
 
 ## Read in the feature headings
 features <- read.csv("features.txt", sep= "", header=FALSE)
 activity_labels <- read.csv("activity_labels.txt" , sep = "", header = FALSE)
 
 setwd("test")
 test_subject_test_DF <- read.csv("subject_test.txt" , sep = "",  header = FALSE, col.names=c("Subject"))

 test_X_test_DF <- read.csv("X_test.txt", sep = "", header = FALSE, strip.white=TRUE, col.names = features[,2])
 test_Y_test_DF <- read.csv("Y_test.txt", sep = "", header= FALSE)
 
 ## apply the activity labels
 test_Y_test_DF$labels <- activity_labels[test_Y_test_DF$V1,2]
 
 ## manually set the directory and read in the files, since I can't figure out how to do it
 ## programmatically with multiple dataframes with variable names
 setwd("Inertial Signals")
 test_body_acc_x_test_DF <- read.csv("body_acc_x_test.txt", sep = "", header = FALSE)
 test_body_acc_x_mean <- apply(test_body_acc_x_test_DF,1,mean)
 test_body_acc_x_sd <- apply(test_body_acc_x_test_DF,1,sd)
 
 test_body_acc_y_test_DF <- read.csv("body_acc_y_test.txt", sep = "", header = FALSE)
 test_body_acc_y_mean <- apply(test_body_acc_y_test_DF,1,mean)
 test_body_acc_y_sd <- apply(test_body_acc_y_test_DF,1,sd)
 
 test_body_acc_z_test_DF <- read.csv("body_acc_z_test.txt", sep = "", header = FALSE)
 test_body_acc_z_mean <- apply(test_body_acc_z_test_DF,1,mean)
 test_body_acc_z_sd <- apply(test_body_acc_z_test_DF,1,sd)
 
 test_body_gyro_x_test_DF <- read.csv("body_gyro_x_test.txt", sep = "", header = FALSE)
 test_body_gyro_x_mean <- apply(test_body_gyro_x_test_DF,1,mean)
 test_body_gyro_x_sd <- apply(test_body_gyro_x_test_DF,1,sd)
 
 test_body_gyro_y_test_DF <- read.csv("body_gyro_y_test.txt", sep = "", header = FALSE)
 test_body_gyro_y_mean <- apply(test_body_gyro_y_test_DF,1,mean)
 test_body_gyro_y_sd <- apply(test_body_gyro_y_test_DF,1,sd)
 
 test_body_gyro_z_test_DF <- read.csv("body_gyro_z_test.txt", sep = "", header = FALSE)
 test_body_gyro_z_mean <- apply(test_body_gyro_z_test_DF,1,mean)
 test_body_gyro_z_sd <- apply(test_body_gyro_z_test_DF,1,sd)
 
 test_total_acc_x_test_DF <- read.csv("total_acc_x_test.txt", sep = "", header = FALSE)
 test_total_acc_x_mean <- apply(test_total_acc_x_test_DF,1,mean)
 test_total_acc_x_sd <- apply(test_total_acc_x_test_DF,1,sd)
 
 test_total_acc_y_test_DF <- read.csv("total_acc_y_test.txt", sep = "", header = FALSE)
 test_total_acc_y_mean <- apply(test_total_acc_y_test_DF,1,mean)
 test_total_acc_y_sd <- apply(test_total_acc_y_test_DF,1,sd)
 
 test_total_acc_z_test_DF <- read.csv("total_acc_z_test.txt", sep = "", header = FALSE)
 test_total_acc_z_mean <- apply(test_total_acc_z_test_DF,1,mean)
 test_total_acc_z_sd <- apply(test_total_acc_z_test_DF,1,sd)
 
 ## creating a summary DF for the test data
 test_DF <- test_X_test_DF
 
 test_DF$activity <-test_Y_test_DF$labels
 test_DF$subject <- test_subject_test_DF
 
 ## adding all the inertial values as dataframes within the main dataframe
 test_tidy <- cbind(test_subject_test_DF,test_Y_test_DF$labels,
                   test_body_acc_x_mean, test_body_acc_x_sd,
                 test_body_acc_y_mean, test_body_acc_y_sd,
                 test_body_acc_z_mean, test_body_acc_z_sd,
                 test_body_gyro_x_mean, test_body_gyro_x_sd,
                 test_body_gyro_y_mean, test_body_gyro_y_sd,
                 test_body_gyro_z_mean, test_body_gyro_z_sd,
                 test_total_acc_x_mean, test_total_acc_x_sd,
                 test_total_acc_y_mean, test_total_acc_y_sd,
                 test_total_acc_z_mean, test_total_acc_z_sd,
                 datatype="test")

 
 ## repeat everything for the trial data
 
 setwd("../../train")
 train_subject_train_DF <- read.csv("subject_train.txt" , sep = "",  header = FALSE , col.names=c("Subject"))
 
 train_X_train_DF <- read.csv("X_train.txt", sep = "", header = FALSE, strip.white=TRUE, col.names = features[,2])
 train_Y_train_DF <- read.csv("Y_train.txt", sep = "", header= FALSE)
 
 ## apply the activity labels
 train_Y_train_DF$labels <- activity_labels[train_Y_train_DF$V1,2]
 
 ## manually set the directory and read in the files, since I can't figure out how to do it
 ## programmatically with multiple dataframes with variable names
 setwd("Inertial Signals")
 train_body_acc_x_train_DF <- read.csv("body_acc_x_train.txt", sep = "", header = FALSE)
 train_body_acc_x_mean <- apply(train_body_acc_x_train_DF,1,mean)
 train_body_acc_x_sd <- apply(train_body_acc_x_train_DF,1,sd)
 
 train_body_acc_y_train_DF <- read.csv("body_acc_y_train.txt", sep = "", header = FALSE)
 train_body_acc_y_mean <- apply(train_body_acc_y_train_DF,1,mean)
 train_body_acc_y_sd <- apply(train_body_acc_y_train_DF,1,sd)
 
 train_body_acc_z_train_DF <- read.csv("body_acc_z_train.txt", sep = "", header = FALSE)
 train_body_acc_z_mean <- apply(train_body_acc_z_train_DF,1,mean)
 train_body_acc_z_sd <- apply(train_body_acc_z_train_DF,1,sd)
 
 train_body_gyro_x_train_DF <- read.csv("body_gyro_x_train.txt", sep = "", header = FALSE)
 train_body_gyro_x_mean <- apply(train_body_gyro_x_train_DF,1,mean)
 train_body_gyro_x_sd <- apply(train_body_gyro_x_train_DF,1,sd)
 
 train_body_gyro_y_train_DF <- read.csv("body_gyro_y_train.txt", sep = "", header = FALSE)
 train_body_gyro_y_mean <- apply(train_body_gyro_y_train_DF,1,mean)
 train_body_gyro_y_sd <- apply(train_body_gyro_y_train_DF,1,sd)
 
 train_body_gyro_z_train_DF <- read.csv("body_gyro_z_train.txt", sep = "", header = FALSE)
 train_body_gyro_z_mean <- apply(train_body_gyro_z_train_DF,1,mean)
 train_body_gyro_z_sd <- apply(train_body_gyro_z_train_DF,1,sd)
 
 train_total_acc_x_train_DF <- read.csv("total_acc_x_train.txt", sep = "", header = FALSE)
 train_total_acc_x_mean <- apply(train_total_acc_x_train_DF,1,mean)
 train_total_acc_x_sd <- apply(train_total_acc_x_train_DF,1,sd)
 
 train_total_acc_y_train_DF <- read.csv("total_acc_y_train.txt", sep = "", header = FALSE)
 train_total_acc_y_mean <- apply(train_total_acc_y_train_DF,1,mean)
 train_total_acc_y_sd <- apply(train_total_acc_y_train_DF,1,sd)
 
 train_total_acc_z_train_DF <- read.csv("total_acc_z_train.txt", sep = "", header = FALSE)
 train_total_acc_z_mean <- apply(train_total_acc_z_train_DF,1,mean)
 train_total_acc_z_sd <- apply(train_total_acc_z_train_DF,1,sd)
 
 ## creating a summary DF for the train data
 train_DF <- train_X_train_DF
 
 train_DF$activity <-train_Y_train_DF$labels
 train_DF$subject <- train_subject_train_DF
 
 ## adding all the inertial values as dataframes within the main dataframe
 train_tidy <- cbind(train_subject_train_DF,train_Y_train_DF$labels,
                     train_body_acc_x_mean, train_body_acc_x_sd,
                  train_body_acc_y_mean, train_body_acc_y_sd,
                  train_body_acc_z_mean, train_body_acc_z_sd,
                  train_body_gyro_x_mean, train_body_gyro_x_sd,
                  train_body_gyro_y_mean, train_body_gyro_y_sd,
                  train_body_gyro_z_mean, train_body_gyro_z_sd,
                  train_total_acc_x_mean, train_total_acc_x_sd,
                  train_total_acc_y_mean, train_total_acc_y_sd,
                  train_total_acc_z_mean, train_total_acc_z_sd,
                  datatype="train")
 
 names(train_tidy) <- names(test_tidy)
 total_DF <-rbind(train_tidy,test_tidy)
 
 colnamelist <- c("subject","activity","body_acc_x_mean","body_acc_x_sd",
                                 "body_acc_y_mean", "body_acc_y_sd",
                                  "body_acc_z_mean","body_acc_z_sd",
                                    "body_gyro_x_mean", "body_gyro_x_sd",
                                    'body_gyro_y_mean', "body_gyro_y_sd",
                                    "body_gyro_z_mean", "body_gyro_z_sd",
                                    "total_acc_x_mean", "total_acc_x_sd",
                                    "total_acc_y_mean", "total_acc_y_sd",
                                    "total_acc_z_mean", "total_acc_z_sd",
                                    "datatype")
 colnames(total_DF) <-colnamelist
 
 setwd("/Users/mharnett/Documents/datasciencecoursera/Getting_and_Cleaning_Data")
 write.table(total_DF, "tidydata.csv", row.name=FALSE)
 