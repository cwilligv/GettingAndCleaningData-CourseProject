# Getting And CleaningData CourseProject

The following steps were performed to accomplish the project:

Reading Features, Train and Test Data.
--------------------------------------
Activity Labels. Used in 3.
activity_labels <- read.table("activity_labels.txt", header = FALSE)

Testing Data
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

Training Data
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
--------------------------------------

After reading all txt data sets I'm able to merge the files into one complete.
--------------------------------------
subjects <- rbind(subject_test, subject_train)
features <- rbind(x_test, x_train)
activity <- rbind(y_test, y_train)

Naming data columns
names(features) <- features_names$V2

colnames(activity) <- "Activity"
colnames(subjects) <- "Subjects"
merged_dataset <- cbind(features, activity, subjects)
--------------------------------------

