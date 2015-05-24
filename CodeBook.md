# Code Book

## Data Processing
Original data is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The features have been cleaned to valid syntactic name, ie. a string the parser interprets as this type of expression. It consists of letters, numbers, and the dot and (for versions of R at least 1.9.0) underscore characters, and starts with either a letter or a dot not followed by a number.

The data set have been labeled with descriptive variable names, ie. the following abreviations have been mapped with the respective terms:

	^f   	-> 	frequency
	^t 	-> 	time
	mag 	->	magnitude
	gyro	-> 	gyroscope
	acc	->	accelerator  

The activities in the data set have been labeled with descriptive names, ie.:

	1	->	WALKING
	2  	->	WALKING_UPSTAIRS
	3 	->	WALKING_DOWNSTAIRS
	4      	->	SITTING
	5     	->	STANDING
	6     	->	LAYING

The dataset has been melt so one row represents one observation subjectid / activity / measure.name / measure.value.

The average of the measure values have been computed for each subject / activity / measure.


## Data Dictionnary

	activity 88
	    Activity the volunteer performed  wearing a smartphone on the waist
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

	subjectid 2
	    Id of the volunteer who perform the activity
		1..30

	measure.name 43
	   Accelerometer and Gyroscope 3-axial time domain signals measurement names:
	   - Mean and standard deviation of body and gravity acceleration signals (time.body.accelerator.(mean|std).(x|y|z) and time.gravity.accelerator.(mean|std).(x|y|z))
	   - Mean and standard deviation of magnitude of thhe three-dimensional signals (time.body.accelerator.magnitude.(std|mean), time.gravity.accelerator.magnitude.(mean|std), time.body.accelerator.jerk.magnitude.(mean|std), time.body.gyroscope.magnitude.(mean|std), time.body.gyroscope.jerk.magnitude.(mean|std))
	   - Mean and standard deviation of jerk signals (time.body.accelerator.jerk.(mean|std).(x|y|z) and time.body.gyroscope.jerk.(mean|std).(x|y|z))
	   - Mean and standard deviation of Fast Fourier Transform (FFT) values applied to these signals (frequence.body.accelerator.(mean|std)(x|y|z), frequence.body.accelerator.jerk.(mean|std).(x|y|z), frequence.body.gyroscope.(mean|std).(x|y|z), frequence.body.accelerator.jerk.magnitude.(mean|std), frequence.body.gyroscope.magnitude.(mean|std), frequence.body.gyroscope.jerk.magnitude.(mean|std))
		time.body.accelerator.mean.x
		time.body.accelerator.mean.y
		time.body.accelerator.mean.z
		time.body.accelerator.std.x
		time.body.accelerator.std.y
		time.body.accelerator.std.z
		time.gravity.accelerator.mean.x
		time.gravity.accelerator.mean.y
		time.gravity.accelerator.mean.z
		time.gravity.accelerator.std.x
		time.gravity.accelerator.std.y
		time.gravity.accelerator.std.z
		time.body.accelerator.jerk.mean.x
		time.body.accelerator.jerk.mean.y
		time.body.accelerator.jerk.mean.z
		time.body.accelerator.jerk.std.x
		time.body.accelerator.jerk.std.y
		time.body.accelerator.jerk.std.z
		time.body.gyroscope.mean.x
		time.body.gyroscope.mean.y
		time.body.gyroscope.mean.z
		time.body.gyroscope.std.x
		time.body.gyroscope.std.y
		time.body.gyroscope.std.z
		time.body.gyroscope.jerk.mean.x
		time.body.gyroscope.jerk.mean.y
		time.body.gyroscope.jerk.mean.z
		time.body.gyroscope.jerk.std.x
		time.body.gyroscope.jerk.std.y
		time.body.gyroscope.jerk.std.z
		time.body.accelerator.magnitude.mean
		time.body.accelerator.magnitude.std
		time.gravity.accelerator.magnitude.mean
		time.gravity.accelerator.magnitude.std
		time.body.accelerator.jerk.magnitude.mean
		time.body.accelerator.jerk.magnitude.std
		time.body.gyroscope.magnitude.mean
		time.body.gyroscope.magnitude.std
		time.body.gyroscope.jerk.magnitude.mean
		time.body.gyroscope.jerk.magnitude.std
		frequency.body.accelerator.mean.x
		frequency.body.accelerator.mean.y
		frequency.body.accelerator.mean.z
		frequency.body.accelerator.std.x
		frequency.body.accelerator.std.y
		frequency.body.accelerator.std.z
		frequency.body.accelerator.jerk.mean.x
		frequency.body.accelerator.jerk.mean.y
		frequency.body.accelerator.jerk.mean.z
		frequency.body.accelerator.jerk.std.x
		frequency.body.accelerator.jerk.std.y
		frequency.body.accelerator.jerk.std.z
		frequency.body.gyroscope.mean.x
		frequency.body.gyroscope.mean.y
		frequency.body.gyroscope.mean.z
		frequency.body.gyroscope.std.x
		frequency.body.gyroscope.std.y
		frequency.body.gyroscope.std.z
		frequency.body.accelerator.magnitude.mean
		frequency.body.accelerator.magnitude.std
		frequency.body.accelerator.jerk.magnitude.mean
		frequency.body.accelerator.jerk.magnitude.std
		frequency.body.gyroscope.magnitude.mean
		frequency.body.gyroscope.magnitude.std
		frequency.body.gyroscope.jerk.magnitude.mean
		frequency.body.gyroscope.jerk.magnitude.std

	measure.average
	    Average of measures (all mesures were normalizes and bounded within -1,1)
		-1..1
