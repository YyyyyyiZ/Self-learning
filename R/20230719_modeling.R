# Clustering
# hierarchical vs. set k
# measures of distance
# divisive vs. agglomerative

cars <- mtcars[, c(1:4,6:7,9:11)]
hc <- cars  %>%    # Get cars data
      dist  %>%    # Compute distance
      hclust       # Compute hierarchical clusters
plot(hc)

rect.hclust(hc, k = 2, border = "gray")
rect.hclust(hc, k = 3, border = "blue")
rect.hclust(hc, k = 4, border = "green4")
rect.hclust(hc, k = 5, border = "red")


# PCA
pc <- prcomp(cars,
             center = TRUE, # CENTERS MEANS TO 0
             scale = TRUE)
pc <- prcomp(~ mpg + cyl + disp + hp + wt + qsec + am + gear + carb,
             data = mtcars,
             center = TRUE,
             scale = TRUE)
summary(pc)
plot(pc)
# See how cases load on PCs
predict(pc) %>% round(2)
# Biplot if first two components
biplot(pc)


# Regression
data <- USJudgeRatings

x <- as.matrix(data[-12])# Not include 12 col
y <- data[,12]
reg1 <- lm(y ~ x)
reg2 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + DECI + PREP + FAMI + ORAL
           + WRIT + PHYS,
           data = USJudgeRatings)
reg1
summary(reg1)

anova(reg1)
coef(reg1)
confint(reg1)
resid(reg1)
hist(residuals(reg1))

p_load(lars, caret)
stepwise <- lars(x, y, type = "stepwise")
forward <- lars(x, y, type = "forward.stagewise")
lar <- lars(x, y, type = "lar")
lasso <- lars(x, y, type = "lasso")

r2comp <- c(stepwise$R2[6], forward$R2[6],
            lar$R2[6], lasso$R2[6]) %>% round(2)
names(r2comp) <- c("stepwise", "forward", "lar", "lasso")
r2comp