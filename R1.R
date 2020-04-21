library(tidyverse)
library(caret)
library(dslabs)


n <- 100

set.seed(1, sample.kind="Rounding") 
n <- 100
Sigma <- matrix(c(1.0, 0.75, 0.75, 0.75, 1.0, 0.25, 0.75, 0.25, 1.0), 3, 3)
dat <- MASS::mvrnorm(n = 100, c(0, 0, 0), Sigma) %>%
  data.frame() %>% setNames(c("y", "x_1", "x_2"))

set.seed(1, sample.kind="Rounding") 

S <- replicate(100, {

  test_index <- createDataPartition(dat$y, times = 1, p = 0.5, list = FALSE)
  train_set <- dat %>% slice(-test_index)
  test_set <- dat %>% slice(test_index)
  
  fit <- lm(y ~ x_2 + x_1, data = train_set)
  
  y_hat <- predict(fit, test_set)
  sqrt(mean((y_hat - test_set$y)^2))
})

mean(S)
sd(S)
