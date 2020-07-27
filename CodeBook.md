## Code Book 

To describe variables, data, and  transformations to clean up the data 

1. Download file
- "fileZip" - Variable. Used to set the link to download dataset from link provided

2. Train Data
- "TrainFeat" - Data Frame to set the Train Features from "X_train.txt" file, with 7352 Obs. of 561 variables.
- "TrainAct" - Data Frame to set the Train Activities from "y_train.txt" file, with 7352 Obs. of 1 varialbe.
- "TrainSubject" - Data Frame to set the Train Subject from "subject_train.txt" file, with 7352 obs. of 1 variable
 
3. Test Data
- "TestFeat" - Data Frame to set the Train Features from "X_test.txt" file, with 2947 obs. of 561 variables.
- "TestAct" - Data Frame to set the Train Activities from "y_test.txt" file, with 2947 obs. of 1 variable.
- "TestSubject" - Data Frame to set the Train Subject from "subject_test.txt" file, with 2947 obs. of 1 variable

4. Merging Features, Activities, Subjects in DataFrame
- "Feats"  - Data Frame to put together with cbind Features from Train (TrainFeat) and  Test(TestFeat), resulting in 10299 obs. of 561 variables
- "Acts" - Data frame to put together with cbind Activities from Train (TrainAct) and Test(TestAct), resulting in 10299 obs. of 1 variable.
- "Subject" - Data frame to put together with cbind Subjects from Train (TrainSubject) and Test(TestSubject), resulting in 10299 obs. of 1 variable.

5. Naming columns
- "FeatCol" - Data Frame to set the Features Names from "featurs.txt" file, with 561 obs. of 2 variables.
- Column Subject is named "Subject"
- Column Acts is named "Activities"
- Column Feats is named from second column in FeatCol data frame

6. Merging everything in one Data set
- "Dataset" - Data frame to put together with cbind Subjects, Acts and Features. Resulting in 10299 obs. of 563 variables

7. Extracting only the measurements on the mean and standard deviation for each measurement.
- "SubDS" - Data frame, a subset from Dataset data frame, but selecting only columns: Subject, Activities and the columns that contains the words "mean" and "std". Resulting in 10299 obs. of 88 variables. 

8. Matching Activities names
- "ActNames" - Data frame used to replace names on Activities column. With 6 obs. of 2 variables.

9. Appropriately labels the data set with descriptive variable names
- Using "gsub" function to replace names for apropiated

10. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- "SecData" - Data frame, a subset of SubDS data frame, chanming a grouping by Subject and Activities, and also channing to summarize the average with mean function. Resulting in 180 obs. of 88 variables. 

11. Generate output file
- Use of write.table to generate file "TidyData.txt" with the SecData information 
