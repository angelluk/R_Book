library(tidyverse)
n <- 1000    
B <- 10000    # number of Monte Carlo experiments
S <- replicate(B, {
  X <- sample(c(-1,1), n, replace = TRUE, prob = c(9/19, 10/19))    # simulate 1000 spins
  sum(X)    # determine total profit
})

mean(S < 0)    # probability of the casino losing money

p <- seq(0.25, 0.95, 0.05)   # sequence of 100 values across range of S
normal_density <- data.frame(s = p, f = dnorm(p, 11, 2.872281)) # generate normal density for S
data.frame (S = S) %>%    # make data frame of S for histogram
  geom_line(data = normal_density, mapping = aes(s, f), color = "blue")