rm(list = ls())
library(gtools)
suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
#print(deck)
deck <- paste(deck$number, deck$suit)
#print(deck)

#probability of drawing a king
kings <- paste("King", suits)
print(kings)
mean(deck %in% kings)

#to create random phone numbers
# permutations(5,2)    # ways to choose 2 numbers in order from 1:5
# all_phone_numbers <- permutations(10, 7, v = 0:9) #for a list of size 10, 7 different ways each to choose
# n <- nrow(all_phone_numbers)
# index <- sample(n, 5)   #Picking 5 rows from whole sample of permutations
# all_phone_numbers[index,]


#probability of drawing a second king given that one king is drawn
hands <- permutations(52, 2, v = deck)

first_card <- hands[,1]
second_card <- hands[,2]
sum(first_card %in% kings)
sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)
