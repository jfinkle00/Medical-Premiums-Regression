library(readr)
library(tidyverse)
library(ggplot2)
library(reshape2)
library(glmnet)
df <- read_csv("~/Desktop/Medicalpremium.csv")

cor(df)

df <- df %>%
  mutate(bmi = Weight/((Height/100)^2))

view(df)

head(df)

model <- lm(PremiumPrice~Height+Weight+Age,data=df)
summary(model)

model_2 <- lm(PremiumPrice~Height+Weight+Age+AnyTransplants,data=df)
summary(model_2)


sum(is.na(df))

data <- cor(df[sapply(df,is.numeric)])
data1 <- melt(data)

ggplot(data1,aes(x= Var1, y=Var2,fill=value)) +
  geom_tile() +
  scale_x_discrete(labels=abbreviate)+
  scale_y_discrete(labels=abbreviate)

#1 Jason, Erika, Fiona
no_int <- aov(PremiumPrice ~ Age + Weight , data = df)

interaction <- aov(PremiumPrice ~ Age + Weight + Age:Weight, data = df)

no_int

interaction
#2

summary(no_int)

summary(interaction)

#3

summary(lm(PremiumPrice ~ Age+ Weight + Age:Weight, data = df))

summary(lm(PremiumPrice ~ Age + Weight, data = df))

#4

categorical <- lm(PremiumPrice~Height+Age+AnyTransplants,data=df)

categorical

summary(categorical)

#Lasso regression model

y <- df$PremiumPrice

X <- data.matrix(df[,c("Height","Age","AnyTransplants","Weight")])

#Finding optimal lambda value

cross_validation <- cv.glmnet(X,y,alpha=1)
cross_validation

min_mse <- cross_validation$lambda.min
min_mse

plot(cross_validation)

#final_model

final_model <- glmnet(X,y,alpha=1,lambda=min_mse)
coef(final_model)

#calculating r-squared
predicitons <- predict(final_model, s=min_mse,newx=X)

sst <- sum((y-mean(y))^2)
sse <- sum((predicitons-y)^2)

rsq <- 1 - sse/sst

rsq

#ridge regression model

ridge_model <- glmnet(X,y,alpha=0, lambda=min_mse)
coef(ridge_model)

ridge_predicitons <- predict(ridge_model, s=min_mse,newx=X)

ridge_sst <- sum((y-mean(y))^2)
ridge_sse <- sum((ridge_predicitons-y)^2)

ridge_rsq <- 1 - ridge_sse/ridge_sst

ridge_rsq




head(df)
lm( PremiumPrice ~ Age + Weight, data = df) -> modelone
modelone

cor(df)
# fitted values
fitted_points <- fitted(modelone)
fitted_points
# residuals
residuals <- resid(modelone)
residuals

# residual plot
plot(fitted(modelone),resid(modelone)) 
# qq plots (one per quantitative variable of your model)
qqnorm(df$Age)
qqnorm(df$Weight)
# histograms
hist(df$Weight)
hist(df$Age)
#boxplots
boxplot(df$Weight)
boxplot(df$Age)

#forward selection

intercept_only <- lm(PremiumPrice ~ 1, data=df)

all <- lm(PremiumPrice ~., data=df)
all

df1 <- df %>%
  select(-BloodPressureProblems,-bmi,)
all <- lm(PremiumPrice ~., data=df1)
all


summary(all)
forward <- step(intercept_only, direction='forward', scope=formula(all), trace=0)
forward

summary(forward)

library(caret)
install.packages("caret")
process <- preProcess(as.tibble(df), method=c("range"))

norm_scale <- predict(process, as.tibble(df))

hist(norm_scale$Weight)

intercept_only <- lm(PremiumPrice ~ 1, data=norm_scale)

all <- lm(PremiumPrice ~., data=norm_scale)
all

forward <- step(intercept_only, direction='forward', scope=formula(all), trace=0)
forward

summary(forward)

both <- step(intercept_only, direction='both', scope=formula(all), trace=0)

summary(both)

backward <- step(intercept_only, direction='backward', scope=formula(all), trace=0)

backward

summary(backward)

backward$coefficients

