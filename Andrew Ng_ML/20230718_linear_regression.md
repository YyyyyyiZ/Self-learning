## Linear Regression

### Differentiation

* supervised learning model, data has “right answers”
* regression model predicts numbers
* classification model predicts categories, small number of possible outputs

### Terminology

$x$ -> input variable/feature

$y$ -> output variable/target variable

($x$, $y$) -> single training example

($x^{(i)}$,$y^{(i)}$) -> $i^{th}$ training example

training set, algorithm, function

univariate/multivariate linear regression

### Model

$$
f_{(W,b)}=WX+b
$$

### Cost Function

#### Formula

> different from loss function

$$
SE=\sum\limits_{i=1}^n(\hat{y}^{(i)}-y^{(i)})^2\\
J(w)=\dfrac{1}{2m}\sum\limits_{i=1}^n(f_w(x^{(i)})-y^{(i)})^2
$$

#### Intuition

求导，找出$J(w)$取最小值的$W$和$b$

2m中的2为了方便求导

contour plot to visualize 3D bowl-shaped cost function J

## Multiple Linear Regression

### Formula

$$
f_{x}(w,b)=w_1x_1+w_2x_2+...+w_nx_n\\
\overrightarrow{w}=[w_1, w_2,...,w_n]\\
\overrightarrow{X}=[x_1, x_2,...,x_n]\\
f_{\overrightarrow{w},b}(\overrightarrow{X})=\overrightarrow{w}·\overrightarrow{X}+b
$$

### Vectorization

### Cost Function

$$
J(w_1,...,w_n,b)\\
J(\overrightarrow{w}, b)
$$

### Gradient Descent

$$
repeat\{\\
\quad w_j=w_j-\alpha\dfrac{\mathrm{d}J(w_1,...,w_n,b)}{\mathrm{d}w_j}\\
\quad\quad\quad\quad\quad\quad\quad =w_j-\alpha\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})x_j^{(i)}\\
b=b-\alpha\dfrac{\mathrm{d}J(w_1,...,w_n,b)}{\mathrm{d}b}\\
\}
$$

> An alternative to gradient descent—Normal equation

* Only for linear regression (can’t be generalized)
* Solve for w, b without iterations
* Slow when number of features is large

## Features

### Feature and Parameter Value

![image-20230720182139228](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720182139228.png)

### Feature Scaling

> make gradient descent faster

* Mean Normalization
* Z-score Normalization

### Converge

* Cost Curve

	==$J(\overrightarrow{w},b)$ should decrease after every iteration,  othewise the learning rate is too large or ther’s mistake in the code==

* Automatic converge test

![image-20230720183753148](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720183753148.png)

​		==difficult to choose the right $\epsilon$==

### Learning Rate

![image-20230720184027600](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720184027600.png)

## Feature Engineering

> Using intuition to design new features, by transforming or combining original features.

## Polynominal Regression

* feature scaling