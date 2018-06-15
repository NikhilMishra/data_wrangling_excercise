library(tidyverse)
library(gapminder)
#filter all data into datasets by continent and change column names to reflect respective continents
asia <- gapminder %>% 
  filter(continent == "Asia") %>% 
  group_by(year) %>%
  summarize(asiaLife = mean(lifeExp))
americas <- gapminder %>% 
  filter(continent == "Americas") %>% 
  group_by(year) %>%
  summarize(americasLife = mean(lifeExp))
europe <- gapminder %>% 
  filter(continent == "Europe") %>% 
  group_by(year) %>%
  summarize(europeLife = mean(lifeExp))
africa <- gapminder %>% 
  filter(continent == "Africa") %>% 
  group_by(year) %>%
  summarize(africaLife = mean(lifeExp))
oceania <- gapminder %>% 
  filter(continent == "Oceania") %>% 
  group_by(year) %>%
  summarize(oceaniaLife = mean(lifeExp))
#merge datasets to create a dataset with mean life expectancy from each continent
total <- merge(asia,americas, by = "year")
total <- merge(total,europe, by = "year")
total <- merge(total,africa, by = "year")
total <- merge(total,oceania, by = "year")
#center title
theme_update(plot.title = element_text(hjust = 0.5))
#plot graph
ggplot(total, aes(x = year)) + 
  geom_line(aes(y = asiaLife, color = 'Asia')) +
  geom_line(aes(y = americasLife, color = 'Americas')) +
  geom_line(aes(y = africaLife, color = 'Africa')) +
  geom_line(aes(y = europeLife, color = 'Europe')) +
  geom_line(aes(y = oceaniaLife, color = 'Oceania')) + 
  labs(y="Average Lifespan (years)", x = "Date", color = "Continent") +
  ggtitle("Change in Lifespan From 1952 to 2007") + 
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9", "#A00000", "#FF1234"))