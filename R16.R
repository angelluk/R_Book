library(gtools)
library(tidyverse)
head(esoph)

medals <- c("gold","silver","bronze")
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")

combs <- expand.grid(run=runners,med=medals)
combs <- paste(combs$run,combs$med)

nrow(combinations(6,3))

6/336

6*20*3


meal_comb <- function(n){
  nrow(combinations(6,1))*nrow(combinations(n,2))*nrow(combinations(3,1))
}

n<-2:12

prob <- sapply(n, meal_comb)


plot(n, prob) 
