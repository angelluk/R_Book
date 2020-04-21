library(titanic)    # loads titanic_train data frame
library(caret)
library(tidyverse)
library(rpart)
library(dplyr)

# 3 significant digits
options(digits = 3)

# clean the data - `titanic_train` is loaded with the titanic package
titanic_clean <- titanic_train %>%
  mutate(Survived = factor(Survived),
         Embarked = factor(Embarked),
         Age = ifelse(is.na(Age), median(Age, na.rm = TRUE), Age), # NA age to median age
         FamilySize = SibSp + Parch + 1) %>%    # count family members
  select(Survived,  Sex, Pclass, Age, Fare, SibSp, Parch, FamilySize, Embarked)

set.seed(42, sample.kind="Rounding")
test_index <- createDataPartition(titanic_clean$Survived, times = 1, p = 0.2, list = FALSE)
test_set <- titanic_clean[test_index, ]
train_set <- titanic_clean[-test_index, ]

set.seed(14, sample.kind="Rounding")
fit <- train(Survived ~. , method = "rf", data = train_set, tuneGrid = data.frame(mtry = seq(1, 7, 1)),
             ntree=100 )

ggplot(fit, highlight = TRUE)

fit$results

fit$finalModel

plot(fit$finalModel)
text(fit$finalModel)

y_hat <- predict(fit, test_set)
confusionMatrix(data = y_hat, reference = test_set$Survived)$overall["Accuracy"]


#CV training
set.seed(8, sample.kind="Rounding")
control <- trainControl(method = "cv", number = 10, p = .9)
train_knn_cv <- train(Survived ~. , method = "knn", tuneGrid = data.frame(k = seq(3, 51, 2))
                           ,data = train_set,
                      trControl = control)

train_knn_cv$results

train_knn_cv$finalModel

ggplot(train_knn_cv, highlight = TRUE)

y_hat <- predict(train_knn_cv, test_set)
confusionMatrix(data = y_hat, reference = test_set$Survived)$overall["Accuracy"]
