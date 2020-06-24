library(dplyr)
library(tidyverse)
library(dslabs)
data(heights)

#creating jitter
j <- heights %>% 
  ggplot(aes(sex,height))+
  geom_jitter(width=0.25,alpha=0.2)
  
j

#adding a boxplot on top of it
j + geom_boxplot()