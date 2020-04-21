library(dslabs)
library(purrr)
library(dplyr)
library(caret)
install.packages("BiocManager")
BiocManager::install("genefilter")
library(genefilter)

set.seed(1996)
n <- 1000
p <- 10000
x <- matrix(rnorm(n*p), n, p)
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()

x_subset <- x[ ,sample(p, 100)]

fit <- train(x_subset, y, method = "glm")
fit$results


tt <- colttests(x, y)

pvals <- tt$p.value

index <- pvals < 0.01
columN <- colnames(x)
x_sub<- columN[index] 

x_subset <- x[,x_sub]
#colnames(x_subset)  <- x_sub

fit <- train(x_subset, y, method = "glm")
fit$results

fit <- train(x_subset, y, method = "knn", tuneGrid = data.frame(k = seq(101, 301, 25)))
fit$results
ggplot(fit)


fit <- train(x_subset, y, method = "knn", tuneGrid = data.frame(k = seq(1,7,2)))
fit$results