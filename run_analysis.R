### This is a script for cleaning data for the course project
### Of the Coursera's "Getting and Cleaning Data" course
###
### It assumes the source data is downloaded and unzipped as the 
### "UCI HAR Dataset" directory next to the script file
###
### Results are saved into "tidy" directory (created if does not exist)

library(reshape2)

# helper function to add path prefix and extension to a raw file name (or path portion)
rawFile <- function(name) {
    paste("UCI HAR Dataset/", name, ".txt", sep = "")
}

# load (and glue together) train or test data, the setName parameter specifies 
# the subdirectory (either 'train' or 'test')
loadRawDataset <- function(setName) {
    # helper to resolve raw file path depending on set
    rawSetFile <- function(name) {
        # Construct file name like test/X_test for set 'test' and name 'X'
        rawFile(paste(setName, "/", name, "_", setName, sep = ""))
    }
    
    x <- read.table(rawSetFile("X"), comment.char = "", colClasses = "numeric")
    y <- read.table(rawSetFile("y"), col.names = "ActivityID")
    s <- read.table(rawSetFile("subject"), col.names = "Subject")
    
    cbind(s, y, x)
}

# This function integrates all the tyding steps into a single workflow
extractTidyData <- function() {
    # load the common data (lookup tables)
    activities <- read.table(rawFile("activity_labels"), 
                             col.names = c("ActivityID", "Activity"))
    features <- read.table(rawFile("features"), 
                           col.names = c("FeatureID", "Feature"),
                           stringsAsFactors = FALSE)
    
    # Step 1 - load and merge training and test data sets
    d <- rbind(loadRawDataset("train"), loadRawDataset("test"))
    
    # Step 2 - extract means and std. dev. on each measurement
    matchingFeatures <- grepl("-mean()", features[,2], fixed = TRUE) |
        grepl("-std()", features[,2], fixed = TRUE)
    featureIndices <- features[matchingFeatures, "FeatureID"]
    
    # sanitize feature names to avoid unsafe characters
    features$Feature <- gsub("\\.+$", "", gsub("[^A-Za-z0-9]+", ".", features$Feature))

    # save feature names for step 4
    featureNames = features[matchingFeatures, "Feature"]
    
    # shift by 2 since we glued columns for subject/activity ids
    featureIndices <- featureIndices + 2
    
    # subset required features and subject/activity ids
    ds <- d[,c(1, 2, featureIndices)]
    
    # Step 3 - use descriptive activity names to name the activities
    ds <- merge(activities, ds, by = "ActivityID",
                all.x = FALSE, all.y = TRUE)
    
    # filter out ActivityId and rearrange columns
    ds <- ds[2:ncol(ds)]
    
    # Step 4 - appropriately labels the data set with descriptive variable names 
    colnames(ds) <- c("Activity", "Subject", featureNames)
    
    # write out step 4 result to a file
    if (!file.exists("tidy")) {
        dir.create("tidy")
    }
    write.table(ds, "tidy/step4.txt", row.name = FALSE)
    
    # Step 5 - create independent data set with averages of each variable for
    # each activity and subject
    
    # use melt + cast to reshape ds intp aggregated form
    melted <- melt(ds, id = c ("Activity", "Subject"))
    ds2 <- dcast(melted, Activity+Subject~variable, mean, na.rm = TRUE)
    
    # write out step 5 result to a file
    write.table(ds2, "tidy/step5.txt", row.name = FALSE)
    
    ds2
}

# extractTidyData()