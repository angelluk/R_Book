library(dslabs)
library(tidyverse)
library(broom)
data("mnist_27")
#mnist_27$train %>% glm(y ~ x_2, family = "binomial", data = .) %>% tidy()
fit <- mnist_27$train %>%  loess(y ~ x_2, degree=1, span = 0.05, data=dat)
qplot(x_2, y, data = mnist_27$train)+
geom_line(aes(x_2, fit$fitted), color="red")