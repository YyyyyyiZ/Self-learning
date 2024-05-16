library(datasets)
library(pacman)

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate,
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

head(iris)
summary(iris)
?plot   # help for plot
plot(iris)
plot(iris$Species)
plot(iris$Petal.Length)
plot(iris$Species, iris$Petal.Length)
plot(iris$Petal.Length, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000",
     pch = 19,
     main = "Iris: Petal Length VS. Petal Width",
     xlab = "Petal Length",
     ylab = "Petal Width")

# PLOT FROMULAS WITH plot()
plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, 3,
     col ="#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "z-score",
     ylab = "Density")

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)

par(mfrow = c(3,1))
hist(iris$Sepal.Width [iris$Species == "setosa"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for sesota",
     xlab = "",
     col = "red")
hist(iris$Sepal.Width [iris$Species == "virginica"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for virginica",
     xlab = "",
     col = "blue")
hist(iris$Sepal.Width [iris$Species == "versicolor"],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal Width for versicolor",
     xlab = "",
     col = "purple")

par(mfrow=c(1, 1))

detach("package:datasets",unload = TRUE)



?mtcars
head(mtcars)

barplot(mtcars$cyl)
# Needa table with frequencies for each category
cylinders <- table(mtcars$cyl)
barplot(cylinders)
plot(cylinders)

hist(mtcars$wt)
hist(mtcars$mpg)

plot(mtcars$wt, mtcars$mpg,
     pch = 19,
     ces = 1.5,
     col = "#cc0000",
     main = "",
     xlab = "",
     ylab = "")

# overlaying plot--increased information density
?lynx
head(lynx)

hist(lynx,
     breaks = 14,
     freq = FALSE,
     col = "thistle1",
     main = paste("Histogram of Annual Canadian Lynx",
                  "Trappings, 1821-1934"),
     xlab = "Number of Lynx Trapped")

# Add a normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col = "thistle4",
      lwd = 2,
      add = TRUE)
lines(density(lynx), col = "blue", lwd = 2)
lines(density(lynx, adjust = 3), col = "purple", lwd = 2)
rug(lynx, lwd = 1, col = "gray")

summary(iris$Species)
summary(iris$Sepal.Length)
summary(iris)
p_load(psych)
describe(iris)

hist(iris$Sepal.Width [iris$Species == "versicolor" & iris$Petal.Length < 5.5],
     main = "Petal Width for versicolor")

i.setosa <- iris[iris$Species = "setosa",]

p_unload(stringr, tidyr)
p_unload(all)