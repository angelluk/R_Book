library(dslabs)      
library(caret)
library(rpart)
data("tissue_gene_expression")

set.seed(1991) 
y <- tissue_gene_expression$y
x <- tissue_gene_expression$x

data_all <- data.frame(x=x, y=y)

fit <- train(y ~., method = "rf", data = data_all, 
                   tuneGrid = data.frame(mtry = seq(50, 200, 25)),
                   nodesize = 1)

ggplot(fit, highlight = TRUE)

fit$results

fit$finalModel

plot(fit$finalModel)
text(fit$finalModel)
# variables importance
imp<-varImp(fit)

# Obtain predictors and accuracy
y_hat <- predict(fit, data_all)
confusionMatrix(data = y_hat, reference = data_all$y)$overall["Accuracy"]


modelLookup("rpart")