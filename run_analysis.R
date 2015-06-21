# Reading and loading data
# Features: Data column names
features_names <- read.table("features.txt")

# Activity Labels. Used in 3.
activity_labels <- read.table("activity_labels.txt", header = FALSE)

# Testing Data
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# Training Data
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# 1. Merges the training and the test sets to create one data set.

subjects <- rbind(subject_test, subject_train)
features <- rbind(x_test, x_train)
activity <- rbind(y_test, y_train)

# Naming data columns
names(features) <- features_names$V2

colnames(activity) <- "Activity"
colnames(subjects) <- "Subjects"
merged_dataset <- cbind(features, activity, subjects)

#-----------------------------------------------------

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
extracted_measures <- grepl("mean|std", features_names$V2)
extracted_measures_with_extra_columns <- c(extracted_measures, 562, 563)
merged_dataset <- merged_dataset[,extracted_measures_with_extra_columns]

# 3. Use descriptive activity names to name the activities in the data set
# We change the data type on the activity column so it accepts chars.
merged_dataset$Activity <- as.character(merged_dataset$Activity)
merged_dataset$Activity <- factor(merged_dataset$Activity, levels=c(1,2,3,4,5,6),labels=activity_labels$V2)

# 4. Appropriately labels the data set with descriptive variable names.
# This step was done at the beginning when assigning features names to the columns.
# so instead of having V1, V2, etc as headers it uses the labels from features.txt

# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
tidy_data <- aggregate(. ~Subjects + Activity, merged_dataset,mean)
tidy_data <- tidy_data[order(tidy_data$Subjects,tidy_data$Activity),]
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)