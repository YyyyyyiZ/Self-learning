## Logistic Regression

### Formula

$$
f_{\overrightarrow{W},b}(\overrightarrow{X})=g(\overrightarrow{W}·\overrightarrow{X})=\dfrac{1}{1+e^{-(\overrightarrow{W}·\overrightarrow{X}+b)}}=P(y=1|\overrightarrow{X};\overrightarrow{W},b)
$$

> output: the probility that class is 1

### Decision Boundary

### formula

$$
f_{\overrightarrow{W},b}(\overrightarrow{X})\geqslant 0.5\\
\quad\quad g(z)\geqslant 0.5\\
\quad\quad\quad z\geqslant 0\\
\overrightarrow{W}·\overrightarrow{X}+b\geqslant 0\\
\quad\quad\quad\quad \hat{y}=1
$$

### Non-linear decision boundary

### Loss function

#### complex

$$
L(f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}),y^{(i)})=
\begin{cases}
-log(f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)})),&\text{if $y^{(i)}$=1}\\
-log(1-f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)})),&\text{if $y^{(i)}$=0}
\end{cases}
$$

#### simplified

$$
L(f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}),y^{(i)})=-\dfrac{1}{m}\sum\limits_{i=1}^{m}[y^{(i)}log(f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}))+(1-y^{(i)})log(1-f_{\overrightarrow{W},b}(\overrightarrow{x}^{(i)}))]
$$

$$
L\left(\hat{y},y\right)=-\left(ylog\hat{y}+\left(1-y\right)log\left(1-\hat{y}\right)\right)
$$

### Gradient Descent
$$
repeat\{\\
\quad w_j=w_j-\alpha\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})x_j^{(i)}\\
b=b-\alpha\dfrac{1}{m}\sum\limits_{i=1}^n(f_{\overrightarrow{w},b}(\overrightarrow{x}^{(i)})-y^{(i)})\\
\}
$$

> Linear Regression

* $f_{\overrightarrow{W},b}(\overrightarrow{X})=\overrightarrow{W}·\overrightarrow{X}+b$

> Logistic Regression

* $f_{\overrightarrow{W},b}(\overrightarrow{X})=\dfrac{1}{1+e^{-(\overrightarrow{W}·\overrightarrow{X}+b)}}$

