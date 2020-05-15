rm(list = ls())
library(gtools)
library(tidyverse)
# A restaurant manager wants to advertise that his lunch special offers
#  enough choices to eat different meals every day of the year. He doesn't
#  think his current special actually allows that number of choices, but wants
#  to change his special if needed to allow at least 365 choices.
# A meal at the restaurant includes 1 entree, 2 sides, and 1 drink. He
#  currently offers a choice of 1 entree from a list of 6 options, a choice of
#  2 different sides from a list of 6 options, and a choice of 1 drink from a
#  list of 2 options.
# How many meal combinations are possible with the current menu?

# Different meals = 6
# Different sides = 15
combinations(6,2)
# Different drink = 2
6*15*2


# QUESTION 2b 
# The manager has one additional drink he could add to the special.
# How many combinations are possible if he expands his original special
#  to 3 drink options?

6*15*3

# QUESTION 2c 
# How many meal combinations are there if customers can choose from
#  6 entrees, 3 drinks, and select 3 sides from the current 6 options?

combinations(6,3)
6*3*20

# QUESTION 2D
# The manager is concerned that customers may not want 3 sides with their meal. 
# He is willing to increase the number of entree choices instead, but if he adds too
# many expensive options it could eat into profits. 
# He wants to know how many entree choices he would have to offer in order to meet his goal.
# What is the minimum number of entree options required in order to generate
# more than 365 combinations?
  
options <- seq(1,12)
#B <- 10000
sides <- 15
drinks <- 3

entree_options <- function(n){
 entrees <- n
 entrees * sides * drinks
}

final_amount <- sapply(options, entree_options)
frames <- data.frame(Entrees = options, combin = final_amount)
print(frames)

# QUESTION 2E
# The manager isn't sure he can afford to put that many entree choices on the lunch 
# menu and thinks it would be cheaper for him to expand the number of sides. 
# He wants to know how many sides he would have to offer to meet his goal of at 
# least 365 combinations.
options2 <- seq(2,12)
drinks2 <- 3
entrees <- 6

side_options <- function(n){
  sides2 <- nrow(combinations(n,2))
  #this returns the no of rows ie the no of combinations possible
  sides2 * drinks2 * entrees
}

final <- sapply(options2, side_options)
sides_frames <- data.frame(Sides = options2, combin = final)
print(sides_frames)

