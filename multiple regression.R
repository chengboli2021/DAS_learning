library(ggplot2)
library(dplyr)
library(moderndive)
library(ISLR)
library(skimr)
library(plotly)
library(tidyr)
library(jtools)
Cred<-Credit%>%
  select(Balance,Limit,Income)

glimpse(Cred)
Cred%>%
  skim()
Cred%>%
  cor()
ggplot(data = Cred,aes(x=Limit,y=Balance))+
  geom_point()+
  geom_smooth(method = "lm",se=FALSE)
ggplot(data = Cred,aes(x=Income,y=Balance))+
  geom_point()+
  geom_smooth(method = "lm",se=FALSE)

plot_ly(Cred,x=~Income,y=~Limit,z=~Balance,type="scatter3d",mode="markers")

Balance.model <- lm(Balance ~ Limit + Income, data = Cred)
get_regression_table(Balance.model)
summary(Balance.model)
summ(Balance.model)
regression.points<-get_regression_points(Balance.model)

ggplot(data = regression.points)+
  geom_point(mapping = aes(x=Limit,y=residual))+
  geom_hline(yintercept = 0,col="blue",size=1)

ggplot(regression.points, aes(x = Income, y = residual)) +
  geom_point() +
  labs(x = "Income (in $1000)", y = "Residual", title = "Residuals vs income") +
  geom_hline(yintercept = 0, col = "blue", size = 1)

ggplot(data = regression.points,aes(x=residual))+
  geom_histogram(color="white")

evals.score<-evals%>%
  select(score,age,gender)
glimpse(evals.score)
evals.score %>%
  skim()
evals.score %>%
  get_correlation(formula=score~age)
regression.points <- get_regression_points(int.model)

ggplot(evals.score, aes(x = age, y = score, color = gender)) +
  geom_jitter() +
  labs(x = "Age", y = "Teaching Score", color = "Gender") +
  geom_smooth(method = "lm", se = FALSE)

par.model <- lm(score ~ age + gender, data = evals.score)
get_regression_table(par.model)

int.model <- lm(score ~ age * gender, data = evals.score)
get_regression_table(int.model)
regression.points <- get_regression_points(int.model)

ggplot(regression.points, aes(x = age, y = residual)) +
  geom_point() +
  labs(x = "age", y = "Residual") +
  geom_hline(yintercept = 0, col = "blue", size = 1) +
  facet_wrap(~ gender)

ggplot(regression.points, aes(x = score_hat, y = residual)) +
  geom_point() +
  labs(x = "Fitted values", y = "Residual") +
  geom_hline(yintercept = 0, col = "blue", size = 1) +
  facet_wrap(~ gender)

