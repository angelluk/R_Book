# Assign the number of loans to the variable `n`
n <- 10000

# Assign the loss per foreclosure to the variable `loss_per_foreclosure`
loss_per_foreclosure <- -150000

# Assign the probability of default to the variable `p_default`
p_default <- 0.015

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling
set.seed(25)


# Generate a vector called `defaults` that contains the default outcomes of `n` loans
defaults <-sample( c(0, 1), n, prob=c(1-p_default, p_default), replace = TRUE) 

# Generate `S`, the total amount of money lost across all foreclosures. Print the value to the console.
S <- sum(defaults) * loss_per_foreclosure
print(S)
print(S/10^6)