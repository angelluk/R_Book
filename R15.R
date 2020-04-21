library(ggplot2)
set.seed(16)

act_scores <- rnorm(10000, 20.9, 5.7)



z_scores <- (act_scores - mean(act_scores))/sd(act_scores)

F <- function(a) mean(act_scores<=a)

p <- seq(0.01, 0.99, 0.01)


sample_quantiles <- quantile(act_scores,probs = p)

theoretical_quantiles <- qnorm(p,mean = 20.9,sd=5.7)

qplot(theoretical_quantiles, sample_quantiles) + geom_abline()