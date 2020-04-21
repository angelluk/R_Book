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

set.seed(42)
test_index <- createDataPartition(titanic_clean$Survived, times = 1, p = 0.2, list = FALSE)
test_set <- titanic_clean[test_index, ]
train_set <- titanic_clean[-test_index, ]


#y_hat <- sample(c(0,1), length(test_index),replace = TRUE) %>% factor(levels = levels(test_set$Survived))

y_hat <- ifelse(test_set$Sex == "male", 0, 1) %>% factor(levels = levels(test_set$Survived))

confusionMatrix(data = y_hat, reference = test_set$Survived)$overall["Accuracy"]

test_set  %>% group_by(Sex,Pclass) %>% summarize(sum(Survived == 0))


res <- filter(train_set, train_set$Pclass == 1)
dim(res)
