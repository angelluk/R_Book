library(tidyverse)
library(dslabs)

data(death_prob)
head(death_prob)

result <- filter(death_prob,death_prob$age==50 & death_prob$sex == "Male")
prob_death <- result$prob