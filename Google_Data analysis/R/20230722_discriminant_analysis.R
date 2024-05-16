# Linear Discriminant Analysis LDA
lda.fit <- lda(class ~ ., data = train)
lda.fit
plot(lda.fit, type = "both")
train.lda.probs <- predict(lda.fit)$posterior[, 2]
misClassError(trainY, train.lda.probs)
confusionMatrix(trainY, train.lda.probs)

test.lda.probs <- predict(lda.fit, newdata = test)$posterior[, 2]
misClassError(testY, test.lda.probs)
confusionMatrix(testY, test.lda.probs)

# Quodratic Discriminant Analysis QDA
qda.fit <- qda(class ~ ., data = train)
qda.fit
train.qda.probs <- predict(qda.fit)$posterior[, 2]
misClassError(trainY, train.qda.probs)
confusionMatrix(trainY, train.qda.probs)

test.qda.probs <- predict(qda.fit, newdata = test)$posterior[, 2]
misClassError(testY, test.qda.probs)
confusionMatrix(testY, test.qda.probs)


# 多元自适应回归样条方法 MARS
library(earth)
set.seed(1)
earth.fit <- earth(class ~ ., data = train,
                   pmethod = "cv",
                   nfold = 5,  # 5折
                   ncross = 3,  # 重复3次
                   degree = 1,  # 没有交互项的加法模型
                   minspan = -1,  # 每个输入特征只有一个铰链函数
                   glm = list(family = binomial))
summary(earth.fit)
plotmo(earth.fit)
plotd(earth.fit)

evimp(earth.fit)

test.earth.probs <-  predict(earth.fit, newdata = test, type = "response")
misClassError(testY, test.earth.probs)
confusionMatrix(testY, test.earth.probs)

# MODEL SELECTION
library(ROCR)
bad.fit <- glm(class ~ thick, family = binomial, data = train)
test.bad.probs <- predict(bad.fit, newdata = test, type = "response")

pred.full <- prediction(test.bad.probs, test$class)
pref.full <-  performance(pred.full, "tpr", "fpr")

plot(pref.full, main = "ROC", col = 1)
abline(0, 1, col = 5, lty = 2)

pred.bic <- prediction(test.bic.probs, test$class)
pref.bic <- performance(pred.bic, "tpr", "fpr")

pred.earth <- prediction(test.earth.probs, test$class)
pref.earth <- performance(pred.earth, "tpr", "fpr")


plot(pref.full, main = "ROC", col = 1)
plot(pref.bic, col = 2, add = TRUE)
plot(pref.earth, col = 3, add = TRUE)
abline(0, 1, col = 5, lty = 2)
legend(0.8, 0.5, c("FULL", "BIC", "EARTH"), 1:3)




