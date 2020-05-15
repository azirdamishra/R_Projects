rm(list = ls())
#Imagine the distribution of male adults is approximately normal with an average of 69 inches 
#and a standard deviation of 3 inches. How tall is a male in the 99th percentile?

male_avg <- 69

male_sd <- 3

qnorm(0.99, male_avg, male_sd)

#The distribution of IQ scores is approximately normally distributed. T
#he average is 100 and the standard deviation is 15. Suppose you want to know the 
#distribution of the person with the highest IQ in your school district, where 10,000 people 
#are born each year.

#Generate 10,000 IQ scores 1,000 times using a Monte Carlo simulation. Make a histogram of 
#the highest IQ scores.

B <- 1000
set.seed(1)
highestIQ <- replicate(B,{
  scores <- rnorm(10000, 100, 15)
  max(scores)
})

hist(highestIQ)

#Compute the probability that the height of a randomly chosen female is within 1 SD 
#from the average height.

female_avg <- 64
female_sd <- 3

taller <- female_avg + female_sd

shorter <- female_avg - female_sd
print(pnorm(taller, female_avg,female_sd) - pnorm(shorter, female_avg,female_sd))


