
#Monte Carlo simulation: Chance of casino losing money on roulette
#Also plot a histogram to show the probability distribution of the observed values of S
rm(list = ls())
library(tidyverse)
#defining the urn for the sampling model
#SAMPLE MODEL 1
#define urn, then sample
color <- rep(c("Black", "Red", "Green"), c(18, 18, 2))
n <- 1000
X <- sample(ifelse(color == "Red",  -1, 1), n, replace = TRUE)

#SAMPLE MODEL 2
#define urn inside sample function by noting probabilities
#and use monte carlo simulation
n <- 1000    # number of roulette players
B <- 10000    # number of Monte Carlo experiments
S <- replicate(B, {
  X <- sample(c(-1,1), n, replace = TRUE, prob = c(9/19, 10/19))    # simulate 1000 spins
  sum(X)    # total profit
})

mean(S < 0)    # probability of the casino losing money

s <- seq(min(S), max(S), length = 100)
#generate normal density for s
normal_density <- data.frame(s = s, f = dnorm(s, mean(S), sd(S)))
#creating histogram
data.frame(S = S) %>%
  ggplot(aes(S, ..density..)) +  # ..density.. is for the density plot (line) later on
  geom_histogram(color = "black", binwidth = 10) +
  ylab("Probability") +
  geom_line(data = normal_density, mapping = aes(s,f), color = "blue")

