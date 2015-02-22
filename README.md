# Programming assignment for Coursera datacleansing
1.	The raw data.
2.	Tidy data set (output)
3.	A code book
4.	Programming script functionality and assumptions
5.	Citation request
6.	License7.	

The raw data

The original data set was sourced from the UCI Machine Learning Repository on an abstract for Human Activity Recognition Using Smartphones.  The purpose of the abtract was to create a Human Activity Recognition Database built from the recording of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

The tidy data set

The purpose of the assignment was to create a tidy data set from the raw data. That summarised the mean of each measurement per subject and per activity.
The output data is the file by_activity.txt.
The code book

The details about the dataset and the subsequent processing may be found in the file ….

The programming script functionality and assumptions

As there was no obvious key to link the different input files, it was assumed that the data in the files containing the subjects and activities were in the same sequence as the files containing the measurements data when combining the data into the tidy data set.
Step 1 - update the raw files: features.txt, X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt into working directory. 
1.	Step 2 - run the software, run_analysis.R.  If dplyr package is already loaded the first two lines of the programme may be removed.
2.	The programme does the following:
–	Transpose the contents of features.txt.  This data will form the column names in the tidy data set.  Once transposed, the file is row binded with the X_test and  x_train data to create a file of measurements with column names.
–	The subject refers to the 30 volunteers from which the measurements were taken.   The subjects are labelled 1 through 30.   The data in the input files is assumed to be in the same order as the measurements data thus the subjects column is created by simply row binding the y_subject and sub_test files.
–	The activity refers to the 6 activity types that the subjects performed during the measurements.  These are WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS,   SITTING, STANDING, LYING.  The activities column in the data is assumed to be in the same order as the subject and measurement data hence is created by row binding the y_train and y_test files.
–	Finally the complete data set is created by column bonding the subject, activity and measurement data sets.
–	A subset of the complete data set is made by extracting the columns of the data set which contain mean() and std() data.  This was performed by greb command on the column name of the measurement data.
–	Next the activity types (1-6) were updated to provide descriptive names of the activities: WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS,   SITTING, STANDING, LYING.  
–	The data was now grouped first by subject, then by activity and the mean taken of each measurement per subject and activity.
–	The output is a tidy data set providing the mean of each measurement taken per subject and activity in the following format:
–	Subject: Activity: Mean(meas1): Mean(meas2)…:Mean(mea79).
3.	Step 3 – the output data is written to the file: by_activity.txt
The programme was created a run on system using Windows……and gave consistent results over several repetitions.

Citation Request

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity recognition Using Smartphones. 21st European Symposium on Artificial Neural networks, computational intelligence and Machine Learning, ESANN 2013. Bruges, Belgium, 24-26 April 2013.

License

The use of this dataset in publications must be acknowledged by referencing the following publication[1] 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
