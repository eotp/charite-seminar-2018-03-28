
############### Student Seminar @Charite  ###############
############### Dr. Joachim Krois #######################
############### March 28, 2018 ##########################


## 03 Data analysis and tidyverse 
## ========================================================

# Total number of cigarettes or cigarette equivalents smoked by an age cohort in the 
# past 5 years (Estimates assumed to be zero for age-groups 2-6)


## Loading the data
## ========================================================
cigs = read.csv("./datasets/IHME_GBD_2016_COVARIATES_1980_2016_CUM_CIGS_5_YR_Y2017M09D05.csv")

colnames(cigs)

## subsetting
## ========================================================
cols_of_interest = c("location_name", "sex_label", 
                     "age_group_name",  
                     "val", "upper", "lower",
                     "year_id")

df = cigs[,cols_of_interest]
dim(df)

# EDA 
unique(df$sex_label)
unique(df$age_group_name)
range(df$year_id)
boxplot(df$val, horizontal = TRUE)

## feature engineering
## ========================================================

library(countrycode)
df["Continent"] = countrycode(df$location_name, 
                              origin = 'country.name', 
                              destination = 'continent')

dim(df)
df = df[complete.cases(df),]
dim(df)

## data analysis
## ========================================================

library(dplyr)
library(ggplot2)


## Research question: What is the mean number of smoked cigarettes 
## per Continent over time?

df_grouped_continents = df %>%
  group_by(Continent,year_id) %>% 
  summarise(mean_val = mean(val))


ggplot(aes(x=year_id, y=mean_val, color = Continent),
       data=df_grouped_continents) + 
  geom_line() + 
  ggtitle("Mean number of cigarettes")


## Research question: What is the mean number of smoked cigarettes by gender 
## per Continent over time?

df_grouped_ages = df %>%
  group_by(Continent, year_id, sex_label) %>% 
  summarise(mean_val = mean(val))


ggplot(aes(x=year_id, y=mean_val, color = sex_label),
       data=df_grouped_ages) + 
  geom_line() + 
  facet_grid(~Continent) + 
  ggtitle("Mean number of cigarettes")


## Research question: What is the mean number of smoked cigarettes for young 
## adults per Continent over time?
  
age_groups = c("15 to 19", "20 to 24", "25 to 29")

df_grouped_young_adults = df %>% 
  filter(age_group_name %in% age_groups)  %>%
  group_by(Continent, year_id, age_group_name) %>% 
  summarise(mean_val=mean(val)) 


ggplot(aes(x=year_id, y=mean_val, color=age_group_name),
       data=df_grouped_young_adults) + 
  geom_line() + 
  facet_grid(~Continent) + 
  ggtitle("Mean number of cigarettes") 