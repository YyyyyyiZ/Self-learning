# numeric(integer, single, double, character, logical, complex, raw)
# vector. matrix/array, data frame, list
n1 <- 15
n1
type(n1)

n2 <- 1.5
n2
typeof(n2)

c1 <- "c"
c1
typeof(c1)

c2 <- "a string of text"
c2
typeof(c2)

11 <- TRUE
l1
typeof(l1)

l2 <- F
12
typeof(l2)

v1 <- c(1, 2, 3, 4, 5)
v1
is.vector(v1)

v2 <- c("a", "b", "c")
v3 <- c(TRUE, FALSE)

m1 <- matrix(c(T, T, F, F, F, T), nrow = 2)
m1
m2 <- matrix(c("a", "b", "c", "d"), nrow = 2, byrow = T)
m2

a1 <- array(c(1:24), c(4,3,2))
a1

vNumeric <- c(1,2,3)
vCharacter <- c("a","b","c")
vLogical <- c(T,F,T)

dfa <- cbind(vNumeric, vCharacter, vLogical)
dfa

df <- as.data.frame(cbind(vNumeric, vCharacter, vLogical))
df

o1 <- c(1,2,3)
o2 <- c("a","b","c","d")
o3 <- c(T,F,T,T,F)

list1 <- list(o1,o2,o3)
list1
list2 <- list(o1,o2,o3,list1)
list2


## Automatic coercion
# Goes to "least restrictive" data type

(coerce1 <- c(1,"b",TRUE))
typeof(coerce1)

(coerce2 <- 5)
(coerce3 <- as.integer(5))
(coerce4 <- c("1","2","3"))
(coerce5 <- as.numeric("1","2","3"))
(coerce6 <- matrix(1:9, nrow = 3))
is.matrix(coerce6)
(coerce7 <- as.data.frame(matrix(1:9, nrow = 3)))
is.data.frame(coerce6)


x1 <- 1:3
y <- 1:9
df1 <- cbind.data.frame(x1,y)
typeof(df1$x1)
str(df1)

x2 <- as.factor(c(1:3))
(df2 <- cbind.data.frame(x2,y))
typeof(df1$x2)
str(df2)

x3 <- c(1:3)
df3 <- cbind.data.frame(x3,y)
df3$x3 <- factor(df3$x3,
                 levels = c(1,2,3),
                 labels = c("macOS","Windows","Linux"))
df3
typeof(df3$x3)
str(df3)

x4  <- c(1:3)
df4 <- cbind.data.frame(x4, y)
df4
df4$x4 <- ordered(df4$x4,
                  levels = c(3,1,2),
                  labels = c("No","Maybe","Yes"))
df4
typeof(df4$x4)
str(df4)

`


