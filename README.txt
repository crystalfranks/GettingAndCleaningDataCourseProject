=================================================================
Getting and Cleaning Data Course Project README
==================================================================
Crystal Franks
April 24, 2015
cfranks@newfield.com

==================================================================
Description:
==================================================================
This repository contains the script run_analysis.

This script reads the data collected from the accelerometers from the Samsung 
Galaxy S smartphone. It them merges the training and tests sets together and 
produces a tidy data set called "TidyData.txt" of the average of the mean values and standard 
deviations of the measurements for each activity and each subject.

The variables of the mean and standard deviation values were selected by
the phrase "mean" or "std" in the variable name as per the raw data
"features_info.txt" file. A codebook for the resulted "TidyData.txt" table can be
found in this repository.

A full description of the raw data is available at the site where the data 
was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

==================================================================
Requirements:
==================================================================
You will need to install the R package: dplyr

Please check that the UCI HAR Dataset folder is in your working directory 
before running this script. Keep the folder name as UCI HAR Dataset as well 
as the orignal filenames when downloaded. The data can be downloaded from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

