library(dslabs)      
library(caret)
data("tissue_gene_expression")

set.seed(1993) #set.seed(1993, sample.kind="Rounding") if using R 3.6 or later
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x
x <- x[, sample(ncol(x), 10)]


data_all <- data.frame(x=x, y=y)

train_qda <- train(y ~., method = "lda", data = data_all,preProcess = "center")
train_qda$results

train_qda$finalModel$means


# Obtain predictors and accuracy
y_hat <- predict(train_qda, data_all)
confusionMatrix(data = y_hat, reference = data_all$y)$overall["Accuracy"]