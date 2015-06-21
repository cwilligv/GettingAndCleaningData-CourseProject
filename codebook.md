# Getting And CleaningData CourseProject

The following steps were performed to accomplish the project. Furher comments are found in the R source file:

1. Read all text files and store them in data.table objects.
2. Merged the data sets (subjects, features and activity) by using rbind function.
3. Named features data columns with the corresponding names from features.txt file.
4. Name single columns for Activity and Subjects.
5. Bind all columns into one table for question number 1 from the project, by using cbind function.
6. For question number 2 of the project:
   a. Extracted all columns that contained mean or standard deviation.
   b. added 2 extra columns for matching the 563 columns that the complete data set has.
   c. Applied extracted columns with mean and std to complete data set.
7. For question number 3 of the project:
   a. Changed Activity column data type to character so I can replace the number for the labels.
   b. Applied factor to the Activity column to lookup the corresponding label from table loaded in 1.
8. For question number 4 of the project: this was done in 3. when assigning the corresponding labels from features.txt and replacing the default V1, V2, etc column names.
9. For question number 5 of the project:
   a. Created tidy_data object and populated it with the mean values.
   b. Applied order function to tidy_data.
   c. Wrote file into directoy with row.names = FALSE as asked in the project.
