library(AER)

data(Affairs, package = "AER")
View(Affairs)
summary(Affairs)
str(Affairs)
table(Affairs$affairs)

Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair,
                           levels = c(0,1),
                           labels = c("No", "Yes"))

fit.full <- glm(ynaffair ~ gender + age + yearsmarried + children + 
                  religiousness + education + occupation + rating,
                data = Affairs, family = binomial())
summary(fit.full)

fit.reduced <- glm(ynaffair ~ age + yearsmarried + religiousness + rating,
                data = Affairs, family = binomial())
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
fit <- glm(ynaffair ~ age + yearsmarried + religiousness + rating,
                   data = Affairs, family = binomial())
fit.od <- glm(ynaffair ~ age + yearsmarried + religiousness + rating,
           data = Affairs, family = quasibinomial())
pchisq(summary(fit.od)$dispersion * fit$df.residual, fit$df.residual, lower = F)
# 若p-value<0.05，有
# 若p-value>0.05，没有


