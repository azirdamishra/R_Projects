rm(list = ls())
head(esoph)
library(tidyverse)

all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)

# QUESTION 5A
# For cases, what is the probability of being in the highest alcohol group?

#print(esoph$alcgp)
esoph %>% filter(alcgp == "120+") %>%
  summarise(probabn120 = sum(ncases)/ all_cases )


# QUESTION 5B
#For cases, what is the probability of being in the highest tobacco group?

#print(esoph$tobgp)
esoph %>% filter(tobgp == "30+") %>%
  summarise(probabn30 = sum(ncases)/ all_cases )


# QUESTION 5C
#For cases, what is the probability of being in the highest alcohol group and
#the highest tobacco group?
esoph %>% filter(alcgp == "120+" & tobgp == "30+") %>%
  summarise(probab = sum(ncases)/ all_cases )


# QUESTION 5C
#For cases, what is the probability of being in the highest alcohol group or the highest 
#tobacco group?
esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>%
  summarise(probab = sum(ncases)/ all_cases )



## QUESTION 6A
#For controls, what is the probability of being in the highest alcohol group?
esoph %>% filter(alcgp == "120+") %>%
  summarise(probabn120 = sum(ncontrols)/ all_controls )

## QUESTION 6B
#How many times more likely are cases than controls to be in the highest alcohol group?
esoph %>% filter(alcgp == "120+") %>%
  summarise(cases = sum(ncases)/all_cases, controls = sum(ncontrols)/all_controls, likely = cases/controls)

# QUESTION 6C
#For controls, what is the probability of being in the highest tobacco group?
esoph %>% filter(tobgp == "30+") %>%
  summarise(probab = sum(ncontrols)/ all_controls)

# QUESTION 6D
#For controls, what is the probability of being in the highest alcohol group and the highest tobacco group?
esoph %>% filter(alcgp == "120+" & tobgp == "30+") %>%
  summarise(probab = sum(ncontrols)/ all_controls)

# QUESTION 6E
#For controls, what is the probability of being in the highest alcohol group or the highest tobacco group?
esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>%
  summarise(probab = sum(ncontrols)/ all_controls)

# QUESTION 6F
#How many times more likely are cases than controls to be in the highest alcohol group or the highest tobacco group?
esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>%
  summarise(cases = sum(ncases)/all_cases, controls = sum(ncontrols)/all_controls, likely = cases/controls)
