# Disordered multiclassification model

## nnet
library(foreign)
library(nnet)
library(ggplot2)
library(reshape2)

ml <- read.dta("hsbdemo.dta")
with(ml, tables(ses, prog))
### 不同prog类别的write的均值和方差
with(ml, do.call(rbind, tapply(write, prog, 
                               function(x) c(M=mean(x),
                                             SD=sd(x)))))
### 参照设为academic
ml$prog2 <- relevel(ml$prog, ref = "academic")
### nnet包中的函数
test <-multinom(prog2 ~ ses + write, data = ml)  #社会经济地位+学习成绩
summary(test)

#summary中无p值，2-tailed Z-test
z <- summary(test)$coefficients/summary(test)$standard.errors
z
p <- (1-pnorm(abs(z), 0, 1))*2  # Z-score转p-value的公式
p

exp(coef(test))
## 展示预测值的前6行
head(pp <- fitted(test))

## 固定write，研究ses对prog的影响
dses <- data.frame(ses = c("low", "middle", "high"), write = mean(ml$write))
predict(test, newdata = dses, "probs")

dwrite <-data.frame(ses = rep(c("low", "middle", "high"), each = 41), 
                    write = rep(c(30:70),3))
pp.write <- cbind(dwrite, predict(test, newdata = dwrite, 
                                  type = "probs", se = TRUE))
by(pp.write[,3:5], pp.write$ses, colMeans)
# melt data set to long for ggplot
lpp <- melt(pp.write, id.vars = c("ses", "write"), value.name = "probability")
head(lpp)

ggplot(lpp, aes(x = write, y = probability, color = ses))+
  geom_line()+facet_grid(variable~., scales = "free")
## mlogit包实现
library(Formula)
library(maxLik)
library(miscTools)
library(mlogit)
data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, shape = "wide", choice = "mode")
summary(mlogit(mode~0|income, data = Fish))



# Ordered multiclassification model
library(MASS)
?polr
##polr(formula, data, weights, start, ..., subset, na.action,
##     contrasts = NULL, Hess = FALSE, model = TRUE,
##     method = c("logistic", "probit", "loglog", "cloglog", "cauchit"))
dta <- read.dta("ologit.dta")
head(dta)

lapply(dta[,c("apply", "pared", "public")], table)
ftable(xtabs(~ public + apply + pared, data  = dta))
summary(dta$gpa)
sd(dta$gpa)

ggplot(dta, aes(x = apply, y = gpa)) + 
  geom_boxplot(size = .75) + 
  geom_jitter(alpha = .5) + 
  facet_grid(pared ~ public, margins = TRUE) + 
  theme(axis.title.x = element_text(angle = 45, hjust = 1, vjust = 1))

m <- polr(apply ~ pared + public + gpa, data = dta, Hess = TRUE)
summary(m)

(ctable <- coef(summary(m)))
p <- pnorm(abs(ctable[,"t value"]), lower.tail = FALSE) * 2
(ctable <- cbind(ctable, "p value" = p))

(ci <- confint(m))
confint.default(m)
exp(coef(m))
exp(cbind(OR = coef(m), ci))


sf <- function(y){
  c('Y>=1' =  qlogis(mean(y >= 1)),
    'Y>=2' =  qlogis(mean(y >= 2)),
    'Y>=3' =  qlogis(mean(y >= 3)))
}
(s <- with(dta, summary(as.numeric(apply) ~ pared + public + gpa, fun = sf)))

glm(I(as.numeric(apply) >= 2) ~ pared, familly="binomial", data = dta)

glm(I(as.numeric(apply) >= 3) ~ pared, familly="binomial", data = dta)

s[, 4] <- s[, 4] - s[, 3]
s[, 3] <- s[, 3] - s[, 3]
s

plot(s, which = 1:3, 
     pch = 1:3, xlab = 'logit', 
     main = '', xlim = range(s[,3:4]))

newdat <- data.frame(
  pared = rep(0:1, 200),
  public = rep(0:1, each = 200),
  gpa =  rep(seq(from = 1.9, to = 4, length.out = 100), 4)
)
newdat <- cbind(newdat, predict(m, newdat, type = "probs"))

head(newdat)

lnewdat <- melt(newdat, id.vars = c("pared", "public", "gpa"),
                variable.name =  "Level", value.name = "Probability")
head(lnewdat)

ggplot(lnewdat, aes(x = gpa, y = Probability, colour = Level)) + 
  geom_line() + facet_grid(pared ~ public, labeller = "label_both")
