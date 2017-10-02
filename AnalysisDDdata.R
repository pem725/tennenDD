##################### HEADER #########################
## Tennen Daily Diary data analysis
## Author:  Patrick E. McKnight
## Start Date:  9/27/17
## Latest Edit:  

################### LIBRARIES ########################
library(foreign)
library(car)
library(ggplot2)

######### DATA IMPORT AND MANAGEMENT #################
dat <- read.spss("./All Years Trait Tennen Daily Aggregates & Total Scores_Labels&Values_FINAL.sav",F,T)
str(dat)


