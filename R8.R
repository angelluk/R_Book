# Assign the number of loans to the variable `n`
n <- 1000
B <- 10000
x <- 3268.063
# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- (-150000)

# Assign the probability of default to the variable `p_default`


# Use the `set.seed` function to make sure your answer matches the expected result after random sampling
set.seed(29)


# Generate a vector called `defaults` that contains the default outcomes of `n` loans
S <- replicate(B, {
  p_default <- .015 + sample(seq(-0.01, 0.01, length = 100), 1)
  defaults <-sample( c(x, (-150000)), n, prob=c(1-p_default, p_default), replace = TRUE) 
  sum(defaults)    # determine total profit
})
S
mean(S< -1000000)
