# Codebook.md
Vladimir Okhotnikov  
19 December 2014  

The initial raw data was obtained from 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

as the README file of the raw data describes the process of capturing it:

> The experiments have been carried out with a group of 30 volunteers within an 
> age bracket of 19-48 years. Each person performed six activities (WALKING, 
> WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
> smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
> accelerometer and gyroscope, we captured 3-axial linear acceleration and 
> 3-axial angular velocity at a constant rate of 50Hz. The experiments have 
> been video-recorded to label the data manually. The obtained dataset has been 
> randomly partitioned into two sets, where 70% of the volunteers was selected 
> for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by 
> applying noise filters and then sampled in fixed-width sliding windows of 
> 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration 
> signal, which has gravitational and body motion components, was separated 
> using a Butterworth low-pass filter into body acceleration and gravity. The 
> gravitational force is assumed to have only low frequency components, 
> therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
> a vector of features was obtained by calculating variables from the time 
> and frequency domain.

The raw data also provided jerk and magnitude variables:

> Subsequently, the body linear acceleration and angular velocity were derived 
> in time to obtain Jerk signals... Also the magnitude of these 
> three-dimensional signals were calculated using the Euclidean norm 

The resulting tidy data includes only mean value and standard deviation pairs 
for each variable, summarized by activity and subject pair. Variable names
have been sanitized to avoid unsave characters (like parentheses) and obvious
typos (like BodyBody)



The `Activity` column describes the activity performed by the subject. It is a 
factor with 6 levels: 

```
## [1] "LAYING"             "SITTING"            "STANDING"          
## [4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"
```

The `Subject` columns identifies a particular subject performing the activity. 
It is an integer between 1 and 30 (inclusive).

The remaining columns represent mean and standard deviation values summarized by 
subject and activity. All values are normalized and bounded within [-1;1].


```
##                 variable                                                                             description
## 3        tBodyAcc.mean.X                      Mean value of body acceleration component in time domain by X axis
## 4        tBodyAcc.mean.Y                      Mean value of body acceleration component in time domain by Y axis
## 5        tBodyAcc.mean.Z                      Mean value of body acceleration component in time domain by Z axis
## 6         tBodyAcc.std.X              Standard deviation of body acceleration component in time domain by X axis
## 7         tBodyAcc.std.Y              Standard deviation of body acceleration component in time domain by Y axis
## 8         tBodyAcc.std.Z              Standard deviation of body acceleration component in time domain by Z axis
## 9     tGravityAcc.mean.X                   Mean value of gravity acceleration component in time domain by X axis
## 10    tGravityAcc.mean.Y                   Mean value of gravity acceleration component in time domain by Y axis
## 11    tGravityAcc.mean.Z                   Mean value of gravity acceleration component in time domain by Z axis
## 12     tGravityAcc.std.X           Standard deviation of gravity acceleration component in time domain by X axis
## 13     tGravityAcc.std.Y           Standard deviation of gravity acceleration component in time domain by Y axis
## 14     tGravityAcc.std.Z           Standard deviation of gravity acceleration component in time domain by Z axis
## 15   tBodyAccJerk.mean.X                 Mean value of derived body acceleration (Jerk) in time domain by X axis
## 16   tBodyAccJerk.mean.Y                 Mean value of derived body acceleration (Jerk) in time domain by Y axis
## 17   tBodyAccJerk.mean.Z                 Mean value of derived body acceleration (Jerk) in time domain by Z axis
## 18    tBodyAccJerk.std.X         Standard deviation of derived body acceleration (Jerk) in time domain by X axis
## 19    tBodyAccJerk.std.Y         Standard deviation of derived body acceleration (Jerk) in time domain by Y axis
## 20    tBodyAccJerk.std.Z         Standard deviation of derived body acceleration (Jerk) in time domain by Z axis
## 21      tBodyGyro.mean.X                            Mean value of body angular velocity in time domain by X axis
## 22      tBodyGyro.mean.Y                            Mean value of body angular velocity in time domain by Y axis
## 23      tBodyGyro.mean.Z                            Mean value of body angular velocity in time domain by Z axis
## 24       tBodyGyro.std.X                    Standard deviation of body angular velocity in time domain by X axis
## 25       tBodyGyro.std.Y                    Standard deviation of body angular velocity in time domain by Y axis
## 26       tBodyGyro.std.Z                    Standard deviation of body angular velocity in time domain by Z axis
## 27  tBodyGyroJerk.mean.X             Mean value of derived body angular velocity (Jerk) in time domain by X axis
## 28  tBodyGyroJerk.mean.Y             Mean value of derived body angular velocity (Jerk) in time domain by Y axis
## 29  tBodyGyroJerk.mean.Z             Mean value of derived body angular velocity (Jerk) in time domain by Z axis
## 30   tBodyGyroJerk.std.X     Standard deviation of derived body angular velocity (Jerk) in time domain by X axis
## 31   tBodyGyroJerk.std.Y     Standard deviation of derived body angular velocity (Jerk) in time domain by Y axis
## 32   tBodyGyroJerk.std.Z     Standard deviation of derived body angular velocity (Jerk) in time domain by Z axis
## 33      tBodyAccMag.mean                   Mean value of magnitude of body acceleration component in time domain
## 34       tBodyAccMag.std           Standard deviation of magnitude of body acceleration component in time domain
## 35   tGravityAccMag.mean                Mean value of magnitude of gravity acceleration component in time domain
## 36    tGravityAccMag.std        Standard deviation of magnitude of gravity acceleration component in time domain
## 37  tBodyAccJerkMag.mean              Mean value of magnitude of derived body acceleration (Jerk) in time domain
## 38   tBodyAccJerkMag.std      Standard deviation of magnitude of derived body acceleration (Jerk) in time domain
## 39     tBodyGyroMag.mean                    Mean value of magnitude of angular velocity component in time domain
## 40      tBodyGyroMag.std            Standard deviation of magnitude of angular velocity component in time domain
## 41 tBodyGyroJerkMag.mean               Mean value of magnitude of derived angular velocity (Jerk) in time domain
## 42  tBodyGyroJerkMag.std       Standard deviation of magnitude of derived angular velocity (Jerk) in time domain
## 43       fBodyAcc.mean.X                           Mean value of body acceleraiton in frequency domain by X axis
## 44       fBodyAcc.mean.Y                           Mean value of body acceleraiton in frequency domain by Y axis
## 45       fBodyAcc.mean.Z                           Mean value of body acceleraiton in frequency domain by Z axis
## 46        fBodyAcc.std.X                   Standard deviation of body acceleraiton in frequency domain by X axis
## 47        fBodyAcc.std.Y                   Standard deviation of body acceleraiton in frequency domain by Y axis
## 48        fBodyAcc.std.Z                   Standard deviation of body acceleraiton in frequency domain by Z axis
## 49   fBodyAccJerk.mean.X            Mean value of derived body acceleration (Jerk) in frequency domain by X axis
## 50   fBodyAccJerk.mean.Y            Mean value of derived body acceleration (Jerk) in frequency domain by Y axis
## 51   fBodyAccJerk.mean.Z            Mean value of derived body acceleration (Jerk) in frequency domain by Z axis
## 52    fBodyAccJerk.std.X    Standard deviation of derived body acceleration (Jerk) in frequency domain by X axis
## 53    fBodyAccJerk.std.Y    Standard deviation of derived body acceleration (Jerk) in frequency domain by Y axis
## 54    fBodyAccJerk.std.Z    Standard deviation of derived body acceleration (Jerk) in frequency domain by Z axis
## 55      fBodyGyro.mean.X                       Mean value of body angular velocity in frequency domain by X axis
## 56      fBodyGyro.mean.Y                       Mean value of body angular velocity in frequency domain by Y axis
## 57      fBodyGyro.mean.Z                       Mean value of body angular velocity in frequency domain by Z axis
## 58       fBodyGyro.std.X               Standard deviation of body angular velocity in frequency domain by X axis
## 59       fBodyGyro.std.Y               Standard deviation of body angular velocity in frequency domain by Y axis
## 60       fBodyGyro.std.Z               Standard deviation of body angular velocity in frequency domain by Z axis
## 61      fBodyAccMag.mean              Mean value of magnitude of body acceleration component in frequency domain
## 62       fBodyAccMag.std      Standard deviation of magnitude of body acceleration component in frequency domain
## 63  fBodyAccJerkMag.mean         Mean value of magnitude of derived body acceleration (Jerk) in frequency domain
## 64   fBodyAccJerkMag.std Standard deviation of magnitude of derived body acceleration (Jerk) in frequency domain
## 65     fBodyGyroMag.mean               Mean value of magnitude of angular velocity component in frequency domain
## 66      fBodyGyroMag.std       Standard deviation of magnitude of angular velocity component in frequency domain
## 67 fBodyGyroJerkMag.mean          Mean value of magnitude of derived angular velocity (Jerk) in frequency domain
## 68  fBodyGyroJerkMag.std  Standard deviation of magnitude of derived angular velocity (Jerk) in frequency domain
```
