x1 <- 1:10
x2 <- 10:1

?seq
x3 <- seq(10)
x4 <- seq(30, 0, by=-3)

?c
x5 <- c(2,3,6,4,1,8,9)

?scan
x6 <- scan()

?rep
x7<- rep(TRUE, 5)
X8 <- rep(c(TRUE,FALSE),5)
x9 <- rep(c(TRUE,FALSE), each=5)


data <- import("",
               header = TRUE,
               sep = '\t')
?View
View(data)
