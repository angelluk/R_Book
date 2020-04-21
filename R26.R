library(caret)
library(dslabs)
library(stringr)
set.seed(1, sample.kind = "Rounding")
data("mnist_27")

models <- c("glm", "lda", "naive_bayes", "svmLinear", "knn", "gamLoess", "multinom", "qda", "rf", "adaboost")


# apply train function for different models and evaulate as CV

# control <- trainControl(method = "cv", number = 10, p = .9)
# fits <- lapply(models, function(model){
#    print(model)
#    fit<-train(y ~ ., method = model, data = mnist_27$train,trControl = control)
#    fit$results
# })
# 
# results <- sapply(fits, function(fit) {
#         df <- as.data.frame(fit)
#         mean(df[["Accuracy"]])
#    })


# apply train function for different models
fits <- lapply(models, function(model){ 
  print(model)
  train(y ~ ., method = model, data = mnist_27$train)
}) 

# name matrix columns
names(fits) <- models

# make predictions of models
pred <- sapply(fits, function(fit) {predict(fit, newdata = mnist_27$test)})

# evaulate accuracy of models
res <- sapply(colnames(pred), function(pr) {
  confusionMatrix(factor(pred[,pr]), reference = factor(mnist_27$test$y))$overall["Accuracy"]
  })

# calculate mean accuracy
mean(res)

# function for definning most votes of models
 vote <- function(x){
   if ((sum(str_count(x, "7")))>=(sum(str_count(x, "2")))){
     vt = "7"
   }
   else { vt = "2"}
   vt
   
 }
# enssemble models predict
y_pred <- apply(pred, 1, vote)

# accuracy
confusionMatrix(factor(y_pred), reference = factor(mnist_27$test$y))$overall["Accuracy"]


