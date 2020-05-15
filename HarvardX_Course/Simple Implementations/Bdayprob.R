rm(list = ls())
n <- 50
#sample out 50 random birthdays
#bdays <- sample(1:365, n, replace = TRUE)

#this function that we wrote accepts a scalar n (this we know by the usage of n)
#THIS FUNCTION USES A MONTE CARLO SIMULATION
compute_prob <- function(n, B = 10000){
  same_day <- replicate(10000, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  mean(same_day)
}

n <- seq(1,60)   #this is for the no of people who have common bdat in one simulation run

#Assigns to each element of prob,
#the probability of two people having the same birthday for that n.
prob <- sapply(n, compute_prob)
plot(n, prob)

#without using MONTE CARLO SIMULATIONS
exact_prob <- function(n){
  prob_unique <- seq(365, 365-n+1)/ 365
  1- prod(prob_unique)
}

eprob  <- sapply(n, exact_prob)
plot(n,eprob)
lines(n, eprob, col = "red")



