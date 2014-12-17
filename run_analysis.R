### This is a script for cleaning data for the course project
### Of the Coursera's "Getting and Cleaning Data" course
###
### It assumes the source data is downloaded and unzipped as the 
### "UCI HAR Dataset" directory next to the script file

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
    featureIndices <- features[matchingFeatures, 1]
    
    # shift by 2 since we glued columns for subject/activity ids
    featureIndices <- featureIndices + 2
    
    # subset required features and subject/activity ids
    ds <- d[,c(1, 2, featureIndices)]
    
    ds
}

# extractTidyData()