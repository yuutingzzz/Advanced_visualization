library(dslabs)
library(tidyverse)
data(gapminder)
head(gapminder)

#slope chart
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")

gapminder %>%
  filter(year %in% c(2010,2015) & region %in% west & !is.na(life_expectancy) & population>10^7) %>%
  mutate(year=as.factor(year)) %>%
  ggplot(aes(year,life_expectancy,group=country)) +
  geom_line(aes(col=country)) +
  geom_text(aes(label=country,
                x=ifelse(year==2010,1,2),
                hjust=ifelse(year==2010,1,0),
                col=country),size=2) +
  xlab("") +
  ylab("Life Expectancy")

ggsave("figs/slop_chart.png")
