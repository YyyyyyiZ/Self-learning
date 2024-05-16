library(AER)

data(Affairs, package = "AER")
View(Affairs)
summary(Affairs)
str(Affairs)
table(Affairs$affairs)

fit.full <- glm(affairs ~ gender + age + yearsmarried + children + 
                  religiousness + education + occupation + rating,
                data = Affairs, family = poisson())
summary(fit.full)

fit.reduced <- glm(affairs ~ age + yearsmarried + religiousness + 
                     occupation +rating,
                   data = Affairs, family = poisson())
summary(fit.reduced)

anova(fit.reduced, fit.full, test = "Chisq")

coef(fit.reduced)
exp(coef(fit.reduced))

testdata <- data.frame(rating = c(1, 2, 3, 4, 5),
                       age = mean(Affairs$age),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata = testdata, type = "response")
testdata

testdata <- data.frame(rating =  mean(Affairs$rating),
                       age = seq(17, 57, 10),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata = testdata, type = "response")
testdata


# evaluate overdispersion
fit <- glm(affairs ~ age + yearsmarried + religiousness + 
             occupation + rating, data = Affairs, family = poisson())
fit.od <- glm(affairs ~ age + yearsmarried + religiousness + 
                occupation + rating, data = Affairs, family = quasipoisson())
pchisq(summary(fit.od)$dispersion * fit$df.residual, fit$df.residual, lower = F)
# 若p-value<0.05，有
# 若p-value>0.05，没有




# TWO
data(breslow.dat, package = "robust")
names(breslow.dat)
summary(breslow.dat[c(6, 7, 8, 10)])

opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
attach(breslow.dat)
hist(sumY, breaks = 20, xlab = "Seizure Count",
     main = "Distribution of Seizures")
boxplot(sumY ~ Trt, xlab = "Treatment", main = "Group Compaarisons")

fit <- glm(sumY ~ Base + Age + Trt, data = breslow.dat, family = poisson())
summary(fit)

coef(fit)
exp(coef(fit))

deviance(fit)/df.residual(fit)
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type = "poisson")

# 稳健泊松回归
fit.od <- glm(sumY ~ Base + Age + Trt, data = breslow.dat, family = quasipoisson())
summary(fit.od)