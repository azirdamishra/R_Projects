rm(list = ls())
set.seed(16)
act_scores = rnorm(10000, 20.9, 5.7)

m <- mean(act_scores)
s <- sd(act_scores)

#QUESTION 1
#A perfect score is 36 or greater (the maximum reported score is 36).
#In act_scores, how many perfect scores are there out of 10,000 simulated tests?
sum(act_scores >= 36)

#In act_scores, what is the probability of an ACT score greater than 30?
mean(act_scores > 30)

#In act_scores, what is the probability of an ACT score less than or equal to 10?
mean(act_scores <= 10)

#QUESTION 2
#Set x equal to the sequence of integers 1 to 36. Use dnorm to determine the value of the 
#probability density function over x given a mean of 20.9 and standard deviation of 5.7; 
#save the result as f_x. Plot x against f_x.

x <- seq(1,36)

f_x <- dnorm(x, 20.9, 5.7)  #create  a normal density function with the same properties as act scores

#the code below gives a scatter plot
#plot(x, f_x) + geom_line()

#the code below gives a line curve 
data.frame(x, f_x) %>%
  ggplot(aes(x, f_x)) +
  geom_line()

#QUESTION 3
#Convert act_scores to Z-scores.
#to standardize values (convert values into Z-scores, that is, values distributed with a mean
#of 0 and standard deviation of 1), you must subtract the mean and then divide by the standard 
#deviation.
z <- (act_scores - m)/s
probab <-mean(z > 2)
print(probab)

#What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
z<- 2
actual_value <- z*s + m
print(actual_value)

#Use qnorm() to determine the 97.5th percentile of normally distributed data with 
#the mean and standard deviation observed in act_scores.
#What is the 97.5th percentile of act_scores?
qnorm(0.975, m, s )
#the first parameter is the argument that needs a vector with the sequence of quantiles


#QUESTION 4
#Write a function that takes a value and produces the probability of an ACT score less than 
#or equal to that value (the CDF). Apply this function to the range 1 to 36.

#What is the minimum integer score such that the probability of that score or lower is at least .95?
cdf_act <- function(x){
  mean(act_scores <= x)
}

values <- sapply(seq(1,36), cdf_act)
df <- data.frame(values= seq(1,36), values= values)
print(df)
#to check the above answer
ceiling(qnorm(0.95, mean(act_scores), sd(act_scores)))

#Use qnorm() to determine the expected 95th percentile, the value for which the probability of 
#receiving that score or lower is 0.95, given a mean score of 20.9 and standard deviation of 5.7.
#What is the expected 95th percentile of ACT scores?
qnorm(0.95, 20.9, 5.7)

#In what percentile is a score of 26?
p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
print(sample_quantiles)
#choose the floor value because logic

#Make a corresponding set of theoretical quantiles using qnorm() over the interval 
#p <- seq(0.01, 0.99, 0.01) with mean 20.9 and standard deviation 5.7. 
#Save these as theoretical_quantiles. Make a QQ-plot graphing sample_quantiles on the y-axis 
#versus theoretical_quantiles on the x-axis.

theoretical_quantiles <- qnorm(p, 20.9, 5.7)
qqplot(theoretical_quantiles, sample_quantiles)

