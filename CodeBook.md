---
title: "Code Book for Getting and Cleaning Data Project"
author: "Milind Kulkarni"
date: "October 25, 2015"
output: html_document
---

## Code Walk-thru:

1. Download zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. Unzip the file in working directory.  
3. Load activity labels and features from UCI HAR Dataset/activity_labels.txt and features.txt.  
4. Subset indices of features with "mean" or "std" using grep expression.     
5. Generate meaningful names for variables by transformation using gsub expression.     
6. Load train, train activities and train subjects data sets and merge.   
7. Load test, test activities and test subjects data sets and merge.   
8. Merge train and test data sets.   
9. Melt merged data set for subject and activity.   
10. Use dcast expression to calculate mean per variable for a set of subject and activity.   
11. Export the output to a text file.   

## Variables:

fileURL - Character   
filename - Character   
activityLabels - Data Frame   
features - Data Frame   
MeanSDNames - Character Vector   
MeanSD - Integer Vector   
trainActivities - Data Frame   
trainSubjects - Data Frame   
train - Data Frame   
testActivities - Data Frame   
testSubjects - Data Frame    
test - Data Frame   
CombinedData - Data Frame   
CombineDataMelted - Data Frame   
CombinedDataMean - Data Frame   

## Structure of the cleaned data (CleanData.txt):

[1] "subject"                      "activity"                     "tBodyAccMeanX"               
 [4] "tBodyAccMeanY"                "tBodyAccMeanZ"                "tBodyAccStdX"                
 [7] "tBodyAccStdY"                 "tBodyAccStdZ"                 "tGravityAccMeanX"            
[10] "tGravityAccMeanY"             "tGravityAccMeanZ"             "tGravityAccStdX"             
[13] "tGravityAccStdY"              "tGravityAccStdZ"              "tBodyAccJerkMeanX"           
[16] "tBodyAccJerkMeanY"            "tBodyAccJerkMeanZ"            "tBodyAccJerkStdX"            
[19] "tBodyAccJerkStdY"             "tBodyAccJerkStdZ"             "tBodyGyroMeanX"              
[22] "tBodyGyroMeanY"               "tBodyGyroMeanZ"               "tBodyGyroStdX"               
[25] "tBodyGyroStdY"                "tBodyGyroStdZ"                "tBodyGyroJerkMeanX"          
[28] "tBodyGyroJerkMeanY"           "tBodyGyroJerkMeanZ"           "tBodyGyroJerkStdX"           
[31] "tBodyGyroJerkStdY"            "tBodyGyroJerkStdZ"            "tBodyAccMagMean"             
[34] "tBodyAccMagStd"               "tGravityAccMagMean"           "tGravityAccMagStd"           
[37] "tBodyAccJerkMagMean"          "tBodyAccJerkMagStd"           "tBodyGyroMagMean"            
[40] "tBodyGyroMagStd"              "tBodyGyroJerkMagMean"         "tBodyGyroJerkMagStd"         
[43] "fBodyAccMeanX"                "fBodyAccMeanY"                "fBodyAccMeanZ"               
[46] "fBodyAccStdX"                 "fBodyAccStdY"                 "fBodyAccStdZ"                
[49] "fBodyAccMeanFreqX"            "fBodyAccMeanFreqY"            "fBodyAccMeanFreqZ"           
[52] "fBodyAccJerkMeanX"            "fBodyAccJerkMeanY"            "fBodyAccJerkMeanZ"           
[55] "fBodyAccJerkStdX"             "fBodyAccJerkStdY"             "fBodyAccJerkStdZ"            
[58] "fBodyAccJerkMeanFreqX"        "fBodyAccJerkMeanFreqY"        "fBodyAccJerkMeanFreqZ"       
[61] "fBodyGyroMeanX"               "fBodyGyroMeanY"               "fBodyGyroMeanZ"              
[64] "fBodyGyroStdX"                "fBodyGyroStdY"                "fBodyGyroStdZ"               
[67] "fBodyGyroMeanFreqX"           "fBodyGyroMeanFreqY"           "fBodyGyroMeanFreqZ"          
[70] "fBodyAccMagMean"              "fBodyAccMagStd"               "fBodyAccMagMeanFreq"         
[73] "fBodyBodyAccJerkMagMean"      "fBodyBodyAccJerkMagStd"       "fBodyBodyAccJerkMagMeanFreq" 
[76] "fBodyBodyGyroMagMean"         "fBodyBodyGyroMagStd"          "fBodyBodyGyroMagMeanFreq"    
[79] "fBodyBodyGyroJerkMagMean"     "fBodyBodyGyroJerkMagStd"      "fBodyBodyGyroJerkMagMeanFreq"