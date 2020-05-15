rm(list = ls())
# Two teams, say the Cavs and the Warriors, are playing a seven game championship series. 
# The first to win four games wins the series. The teams are equally good, so they each
# have a 50-50 chance of winning each game.
# If the Cavs lose the first game, what is the probability that they win the series?

#WITHOUT MONTE CARLO 
# Assign a variable 'n' as the number of remaining games.
n <- 6

# Assign a variable `outcomes` as a vector of possible game outcomes, where 0 indicates a loss and 1 indicates a win for the Cavs.
outcomes <- c(0,1)

# Assign a variable `l` to a list of all possible outcomes in all remaining games. Use the `rep` function on `list(outcomes)` to create list of length `n`.
l <- rep(list(outcomes), n)
#print(l)
# Create a data frame named 'possibilities' that contains all combinations of possible outcomes for the remaining games.
possibilities <- expand.grid(l)
#print(possibilities)
# Create a vector named 'results' that indicates whether each row in the data frame 'possibilities' contains enough wins for the Cavs to win the series.
results <- rowSums(possibilities)

# Calculate the proportion of 'results' in which the Cavs win the series. Print the outcome to the console.
mean(results >= 4)





#using MONTE CARLO
# The variable `B` specifies the number of times we want the simulation to run. Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `results` that replicates for `B` iterations a simulated series and determines whether that series contains at least four wins for the Cavs.

results <- replicate(B, {
  final <- sample(c(0,1), 6, replace = TRUE)
  sum(final) >= 4
})


# Calculate the frequency out of `B` iterations that the Cavs won at least four games in the remainder of the series. Print your answer to the console.
mean(results)

