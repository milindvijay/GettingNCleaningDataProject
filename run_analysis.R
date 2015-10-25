library(reshape2)

filename <- "getdata_Dataset.zip" #destination file name

############# Download and unzip the dataset #############
if (!file.exists(filename)){ 
     fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(fileURL, filename)
}

if (!file.exists("UCI HAR Dataset")) { 
     unzip(filename)
}

############# Load activity labels and features #############
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

############# Extract only the data on mean and standard deviation #############
MeanSD <- grep(".*mean.*|.*std.*", features[,2])
MeanSDNames <- features[MeanSD,2]
MeanSDNames = gsub('-mean', 'Mean', MeanSDNames)
MeanSDNames = gsub('-std', 'Std', MeanSDNames)
MeanSDNames <- gsub('[-()]', '', MeanSDNames)

############# Load the datasets #############
train <- read.table("UCI HAR Dataset/train/X_train.txt")[MeanSD]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[MeanSD]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

############# Combine datasets and add labels #############
CombinedData <- rbind(train, test)
colnames(CombinedData) <- c("subject", "activity", MeanSDNames)

############# turn activities & subjects into factors #############
CombinedData$activity <- factor(CombinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
CombinedData$subject <- as.factor(CombinedData$subject)

CombinedDataMelted <- melt(CombinedData, id = c("subject", "activity"))
CombinedDataMean <- dcast(CombinedDataMelted, subject + activity ~ variable, mean)

write.table(CombinedDataMean, "CleanData.txt", row.names = FALSE, quote = FALSE)
