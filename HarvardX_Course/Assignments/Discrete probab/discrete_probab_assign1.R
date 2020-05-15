library(gtools)
library(tidyverse)

####### QUESTION 1a #######
# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals
#  (order matters). In the 2012 Olympics, 3 of the 8 runners were from Jamaica
#  and the other 5 were from different countries. The three medals were all
#  won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).
str(permutations(8,3))


#***** QUESTION 1b *****
# How many different ways can the three medals be distributed among the
#  3 runners from Jamaica?
str(permutations(3,3))


#***** QUESTION 1c *****
# What is the probability that all three medals are won by Jamaica?
df <- combinations(8,3)
# 56 total combinations, only one with 1, 2, 3


#***** QUESTION 1d *****
# Build runner countries and reset seed
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
set.seed(1)
B <- 10000
from_jamaica <- replicate(B, {
  players <- sample(runners, 3)    #if you add replace = TRUE it replaces the runner every 
  #time sample is called in one iteration and you get wrong answer
  all(players == "Jamaica")
})
mean(from_jamaica)



