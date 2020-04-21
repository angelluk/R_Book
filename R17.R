library(caret)
library(dslabs)
library(tidyverse)
library(broom)
data("mnist_27")


set.seed(1)
y <- rnorm(100, 0, 1)

set.seed(1)
indexes <- createResample(y, 10000, list = FALSE)
l <- list()
for(i in 1:10000){
  cur_index <- indexes[,i]
  sapmle <- y[cur_index]
  l[[i]]<- quantile(sapmle, 0.75)
}
l
mean(as.numeric(l))
sd(as.numeric(l))
