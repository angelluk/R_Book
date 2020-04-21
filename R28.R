
library(caret)
library(tidyverse)
library(rpart)
library(dplyr)
library(dslabs)
data("movielens")


movielens %>% 
  group_by(year) %>% 
  summarise(votes = n_distinct(movieId,userId)) %>% 
  ggplot(aes(year,votes)) +
  geom_line() + geom_text(aes(year,votes,label=year), nudge_x = 1.5) 
  
  #res$year[which.max(res$votes)]


res<-movielens %>% 
  group_by(genres) %>%
  summarize(rate = n_distinct(userId)) %>%
  arrange(genres,rate)






