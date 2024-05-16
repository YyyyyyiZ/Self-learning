## Fitting

### underfit—high bias

> bias: there is a pattern in the data that the algorithm fails to capture/the algorithm has a strong preconception

* does not fit the training set well

### generalization

* fits training set pretty well

### overfit—high variance

* fits the training set extremely well

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802121251068.png" alt="image-20230802121251068" style="zoom:50%;" />

### Address Overfitting

* collect more examples
* ==feature selection== : select features to include/exclude
* ==regularization== : retain all the features but prevent them from playing overly large impact

## Regularization

### L2

$$
J(\overrightarrow{W},b)=\dfrac{1}{2m}\sum\limits_{i=1}^m(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})^2+\dfrac{\lambda}{2m}\sum\limits_{j=1}^{n}\omega_j^2
$$

> no penalize b, make no differnce

### Regularized Linear Regression

#### Formula

$$
repeat\{\\
w_j=w_j-\alpha[\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})x_j^{(i)}+\dfrac{\lambda}{m}\omega_j]\\
b=b-\alpha\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})\\
\}\ simultaneously\ update
$$

#### Additional Insights

$w_j=w_j(1-\alpha\dfrac{\lambda}{m})-\alpha\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})x_j^{(i)}$

> multiply $w$ by a small number less than 1 (shrink), then usual update

### Regularized Logistic Regression

$$
J(\overrightarrow{W},b)=-\dfrac{1}{m}\sum\limits_{i=1}^{m}[y^{(i)}log(f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}))+(1-y^{(i)})log(1-f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}))]+\dfrac{\lambda}{2m}\sum\limits_{j=1}^{n}\omega_j^2
$$

