
############### Student Seminar @Charite  ###############
############### Dr. Joachim Krois #######################
############### March 28, 2018 ##########################


## 03 Data analysis and tidyverse 
## ========================================================

# Total number of cigarettes or cigarette equivalents smoked by an age cohort in the 
# past 5 years (Estimates assumed to be zero for age-groups 2-6)


## Loading the data
## ========================================================


## subsetting
## ========================================================
cols_of_interest = c("location_name", "sex_label", 
                     "age_group_name",  
                     "val", "upper", "lower",
                     "year_id")



# EDA 


## feature engineering
## ========================================================

library(countrycode)


## data analysis
## ========================================================

library(dplyr)
library(ggplot2)


## Research question: What is the mean number of smoked cigarettes 
## per Continent over time?



## Research question: What is the mean number of smoked cigarettes by gender 
## per Continent over time?



## Research question: What is the mean number of smoked cigarettes for young 
## adults per Continent over time?
  
