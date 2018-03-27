
############### Student Seminar @Charite  ###############
############### Dr. Joachim Krois #######################
############### March 28, 2018 ##########################


## 02 Data generation, plotting, t-test and modelling
## Data generation
## ========================================================

v = c(1,2,3,4,5)
v

# sampling
sample(v, size = 10, replace = TRUE)


# sequence
seq(from=0, to=10, by = 2)

# random numbers
rnorm(n = 10, mean = 0, sd = 1)

## Plotting
## ========================================================

x = rnorm(n = 100, mean = 12, sd = 4)
y = rnorm(n = 85, mean = 13, sd = 3.2)

hist(x)
hist(x, main="my histogram")
hist(x, main="my histogram", xlab = "")


hist(x, main="my histogram", xlab = "", c="red")
hist(y, main="my histogram", xlab = "", c="blue", add=TRUE)



## t-test
## ========================================================
# QQ-plot
par(mfrow=c(1,2))
qqnorm(y)
qqline(y)
qqnorm(x)
qqline(x)
dev.off()

t.test(x, y, alternative = "two.sided", var.equal = TRUE)



## Linear Regression
## ========================================================


x = seq(from=1, to=25, length.out=100)
y = 10+2.5*x + rnorm(x, mean = 0, sd=15)

plot(x,y)

# fitting the model
model = lm(y~x)
model
abline(model, col="red")


# model summary
confint(model)
summary(model)


# predictions
predict(model, data.frame(x=20))

newdata = data.frame(x=x) 
conf = predict(model, newdata, 
               interval="confidence", level = 0.99)

lines(x, conf[,'lwr'], col="blue")
lines(x, conf[,'upr'], col="blue")


