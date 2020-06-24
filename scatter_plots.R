library(dplyr)
library(tidyverse)
library(dslabs)
data("gapminder")

head(gapminder)

g1 <- gapminder %>% filter(year %in% c(1962,2012)) %>% 
  ggplot(aes(life_expectancy,fertility,col=continent)) +
  geom_point(size=0.5) +
  facet_grid(continent~year)

g2 <- gapminder %>% filter(year %in% c(1962,2012)) %>% 
  ggplot(aes(fertility,life_expectancy,col=continent)) +
  geom_point(size=1) +
  facet_grid(year~.)

years <- c(1960,1970,1980,1990,2010)
continents <- c("Asia","Europe")

g3 <- gapminder %>% filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(life_expectancy,fertility,col=continent)) +
  geom_point(size=1) +
  facet_wrap(~year)

g1 #showing all the regions seperatly (data of 1962 & 2012)
g2 #showing regions on same plots (data of 1962 & 2012)
g3 #showing Asia and Europe one same plots (data of 60 70 80 90 00)

ggsave("figs/scatter-1.png")
ggsave("figs/scatter-2.png")
ggsave("figs/scatter-3.png")
