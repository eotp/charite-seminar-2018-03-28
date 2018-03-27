
############### Student Seminar @Charite  ###############
############### Dr. Joachim Krois #######################
############### March 28, 2018 ##########################



## 01 Introduction to R
## Variable Assignment
## ========================================================
x <- 25
y <- 11


## Data Types
## ========================================================
## Numeric
## ========================================================
num <- 33.33
num
class(num)

## Logical
## ========================================================
x <- 100
y <- 200   
z <- x > y 
z 
class(z)
j <- TRUE
k <- FALSE
j & k
j | k
!j

## Character
## ========================================================
chr <- "charite"
class(chr)
p <- as.character(3.14)
p
class(p)

## Factor
## ========================================================
weather <- factor(c("rainy", "sunny", "sunny", "rainy", "sunny"))
weather
str(weather)
table(weather)
barplot(table(weather))


## Built-in arithmetic standard functions
## ========================================================
## Absolute value function abs()
abs(3-12)
## Square root function sqrt()
sqrt(64)
## Exponentiation function exp()
exp(1)
## log function log()
log(10)
## log base 10 function log10()
log10(1000)
## Mathematical constant pi
pi
## Round x to n decimal places round(x,n)
round(pi,2)
## Floor function (rounds down) floor()
floor(pi)
## Ceiling function (rounds up) ceiling()
ceiling(pi)



## Contributed packages
## ========================================================
#install.packages("PACKAGE_NAME")
library(foreign)
ls("package:foreign")


## Data Structure
## ========================================================
## Vector
## Matrix
## List
## DataFrame
 

## Vectors 
## ========================================================
aa <- c("John", "Sahra", "I")
aa
s1 <- 1:25
s1
s2 <- seq(from = 1, to = 25, by = 2)
s2

## More built-in functions
## ========================================================
s <- seq(from = 1, to = 5000)
# s
mean(s)
max(s)
min(s)
sum(s)
paste("The sequence 's' contains", length(s), "components")


## Vector Arithmetic
## ========================================================
u <- c(10, 30, 50, 70, 90) 
v <- c(20, 40, 60, 80, 100)
u*100
u + v
u-v 
u*v
u/v



## Vector indexing
## ========================================================

s = c("aa", "bb", "cc", "dd", "ee") 
s[2]
s[-2]
s[10] 
s[c(2, 5)] 
s[2:5]
n = c(FALSE, TRUE, FALSE, TRUE, FALSE) 
s[n] 



## Data Frame 
## ========================================================
data <- data.frame(
  name = c("John","Molly","Frank",
           "Peter", "Michelle"),
  job = c('Policeman', 'Artist', 
          'Banker', NA, 'Teacher'),
  sex = c('male', 'female', 'male', 
          'male', 'female'),
  age = c(45, 32, 58, 18, 22), 
  stringsAsFactors = FALSE 
)


## Extract data from a data frame
## ========================================================

data$name
data.frame(data$name, data$job)
data["name"]
data[c("name", "job")]
data[1:2,]
data[c(3,5), c(2,4)]
data[c(3,5), c("name", "job")]
data$sex == 'female'
data[data$sex == 'female',]
subset(data, 
       age >= 20 & sex == 'male',
       select = c(name, job, age))

