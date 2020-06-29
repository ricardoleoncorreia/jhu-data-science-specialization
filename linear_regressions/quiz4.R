library(dplyr)

# Question 1
library(MASS)
str(shuttle)
fit <- glm(as.factor(use) ~ as.factor(wind), data = shuttle, family='binomial')
print(exp(fit$coef[2]))

# Question 2
fit <- glm(as.factor(use) ~ as.factor(wind) + as.factor(magn), data = shuttle, family='binomial')
print(exp(fit$coef[2]))

# Question 3
library(forcats)
fit <- glm(fct_rev(as.factor(use)) ~ as.factor(wind), data = shuttle, family='binomial')
print(fit$coef)

# Question 4
data(InsectSprays)
str(InsectSprays)
fit <- glm(count ~ as.factor(spray), data = InsectSprays, family='poisson')
print(1/exp(fit$coef[2]))

# Question 5
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
splineTerm <- (x > 0) * x
fit <- lm(y ~ x + splineTerm)
print(sum(fit$coef[2:3]))