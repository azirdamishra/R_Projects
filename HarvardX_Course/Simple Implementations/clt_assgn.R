rm(list = ls())
#In American roulette, the payout for winning on green is $17. 
#This means that if you bet $1 and it lands on green, you get $17 as a prize.
#Create a model to predict your winnings from betting on green one time.

set.seed(1)

green <- 2
black <- 18
red <- 18

p_green <- green / (green+black+red)
p_not_green <- 1 - p_green
#calculating a (range of values for) random variable X
X <- sample(c(17,-1), 1, prob =  c(p_green, p_not_green)) 
print(X)

# Calculate the expected outcome if you win $17 if the ball lands on green and 
#you lose $1 if the ball doesn't land on green
17*p_green + (-1)*p_not_green   #using the formula for expected value

# Compute the standard error of the random variable
abs((17 - -1))*sqrt(p_green*p_not_green)


#Create a random variable S that sums your winnings after betting on green 1,000 times.
set.seed(1)
# number of bets using the variable 'n'
n <- 1000
#'X' contains the outcomes of 1000 samples
X <- sample(c(17,-1), 1000, replace =  TRUE, prob =  c(p_green, p_not_green))
S <- sum(X)
print(S)