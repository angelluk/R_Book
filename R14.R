B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random number generation
set.seed(1)

# Generate a vector `S` that contains the the average outcomes of 10,000 bets modeled 10,000 times
S <- replicate(B, {
  X <- sample(c(1,-0.25), 44, replace = TRUE, prob = c(0.2, 0.8))   
  sum(X)    # determine total profit
})

mean(S>=8)

p <- seq(0.25, 0.95, 0.05) 

