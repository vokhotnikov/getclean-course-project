---
title: "README"
author: "Vladimir Okhotnikov"
date: "17 декабря 2014"
output: html_document
---

This is my course project for the "Getting and Cleaning Data" course on Coursera.

The raw data is not included in the git repository. It is assumed that the data
file can be downloaded from 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

and the resulting file unzipped next to the `run_analysis.R` script. You should 
have the `UCI HAR Dataset` directory in the same folder as the sciript (and 
that folder should be set as the R working directory).

The `run_analysis.R` contains script to clean the data as the course project task
requests. At the top of the script there are helper functions, in the bottom is 
the `extractTidyData` function containing the top-level extraction steps.

As requested, the script does the following:

1.  Merges the training and the test sets to create one data set.

1.  Extracts only the measurements on the mean and standard deviation for each 
    measurement. As there is some room to intepretation of what features do
    exactly match the condition above (for instance if the `-meanFreq()` 
    variables should be included), I decided to keep only features that have 
    both mean and standard deviation measurements and skip the ones where only 
    mean values are available. Should the need arise to include those features,
    it can be done by changing the single statement that calculates
    `matchingFeatures` value in the `extractTidyData` function.
    
1. Uses descriptive activity names to name the activities in the data set

1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


