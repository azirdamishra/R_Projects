#Suppose we can't make a plot and want to compare the distributions side by side.
#If the number of data points is large, listing all the numbers is inpractical. 
#A more practical approach is to look at the percentiles.

library(dslabs)
data(heights)
male <- heights$height[heights$sex=="Male"]
female <- heights$height[heights$sex=="Female"]

female_percentiles <- quantile(female, seq(0.1, 0.9, 0.2))
male_percentiles <- quantile(male, seq(0.1, 0.9, 0.2))

df <- data.frame(female = female_percentiles, male = male_percentiles)
print(df)

#GG  PLOT BASICS
library(dplyr)
#tidyverse library contains bothe dplyr and ggplot2
library(ggplot2)
#with ggplot2, plots can be saved as objects
library(dslabs)
data(heights)
data(murders)
p <- ggplot(murders)
#p <- murders %>% ggplot()    -> can be used if we load dplyr package
class(p)


#To create a scatter plot, we add a layer with the function geom_point.
#murders %>% ggplot(aes(x =population , y =total )) +
#  geom_point()

#similar result in a different way
#murders %>% ggplot(aes(population, total)) +
#  geom_point()


#Add labels to the points on a plot.
names(murders)
murders %>% ggplot(aes(population, total,label= abb)) +
  geom_label(color = "blue")
#color and col are equivalent

#to add color region wise
murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

#Change the axes to log scales to account for the fact that the population distribution is skewed.
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) + geom_label() + ggtitle("Gun murder data")
## add layers to p here
p + scale_x_log10() + scale_y_log10()
#o change the x-axis to a log scale use scale_x_log10() function. 
#We can change the axis by adding this layer to the object p to change the scale and 
#render the plot



