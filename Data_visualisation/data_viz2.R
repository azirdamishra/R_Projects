#HISTOGRAM BASICS
rm(list = ls())
#geom_histogram function to make a histogram of the heights in the heights data frame. 
# it requires just one mapping, the values to be used for the histogram.
library(dplyr)
#tidyverse library contains bothe dplyr and ggplot2
library(ggplot2)
#with ggplot2, plots can be saved as objects
library(dslabs)
data(heights)
#Add a layer to actually make the histogram.
p <- heights %>% 
  ggplot(aes(height))
p + geom_histogram(binwidth = 1)

#SMOOTH DENSITY PLOTS
heights %>% 
  ggplot(aes(height)) + geom_density()

#To plot multiple smooth density plots
heights %>% 
  ggplot(aes(height, group = sex)) + geom_density()

#to add color we can use 'color' or 'fill' argument
heights %>% 
  ggplot(aes(height, color = sex)) + geom_density()

#doing the above using the 'fill' argument
heights %>% 
  ggplot(aes(height, fill = sex)) + 
  geom_density(alpha = 0.2) 
#using the alpha argument in geom_density, we can stop the complete overlap of some parts of the 
#plot and make it transparent

