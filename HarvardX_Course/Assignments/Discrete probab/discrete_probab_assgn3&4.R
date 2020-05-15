rm(list = ls())
head(esoph)
library(tidyverse)

# QUESTION 3
names(esoph)
nrow(esoph)

all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)

# QUESTION 4A
#What is the probability that a subject in the lowest alcohol consumption group is a cancer case?
highest_alc <- esoph$alcgp
#print(highest_alc)

alc <- filter(esoph, alcgp == "120+")
#print(alc)
n_cases <- sum(alc$ncases)
total <- n_cases + sum(alc$ncontrols)
probab <- n_cases / total


# QUESTION 4B
#What is the probability that a subject in the lowest alcohol consumption group is a cancer case?
esoph %>% filter(alcgp == "0-39g/day") %>%
  summarize(sum_cases=sum(ncases), tot=sum(ncontrols)+sum(ncases), probability=sum_cases/tot)


# QUESTION 4C
#Given that a person is a case, what is the probability that they smoke 10g or more a day?
#print(esoph$tobgp)

esoph %>% filter(tobgp != "0-9g/day") %>% 
  summarise(more_than10 = sum(ncases), probab_tob = more_than10/all_cases)


# QUESTION 4D
#Given that a person is a control, what is the probability that they smoke 10g or more a day?
esoph %>% filter(tobgp != "0-9g/day") %>% 
  summarise(more_than10 = sum(ncontrols), probab_tob = more_than10/all_controls)







