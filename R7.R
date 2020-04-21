library(tidyverse)
library(caret)
library(dslabs)
data("tissue_gene_expression")


# define the outcome and predictors
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x

# generate training and test sets
set.seed(1)
test_index <- createDataPartition(y, times = 1, p = 0.5, list = FALSE)
test_set <- tissue_gene_expression$x[test_index]
train_set <- tissue_gene_expression$x[-test_index]

test_set_y <- tissue_gene_expression$y[test_index]
train_set_y <- tissue_gene_expression$y[-test_index]


fit <- knn3(as.matrix(train_set),train_set_y)
y_hat <- predict(fit, as.matrix(test_set), type = "class")

#confusionMatrix(data = y_hat, reference = test_set$y)$overall["Accuracy"]
