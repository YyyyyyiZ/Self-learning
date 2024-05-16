# Logistic Regression

### Formula

$$
\hat{y}=P(y=1|x),\quad 0\leqslant\hat{y}\leqslant1
$$

$$
\sigma(z)=\dfrac{1}{1+e^{-z}}
$$

$$
\hat{y}=\sigma(w^Tx+b)
$$

### Loss(Error) Function

> defined with respect to a single training example, measuring how well you’re doing on a single training sample

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
L\left(\hat{y},y\right)=-\left(ylog\hat{y}+\left(1-y\right)log\left(1-\hat{y}\right)\right)
$$

### Cost Function

> measures how well you’re doing on the entire sample

> cost of your paramter

$$
J\left(w\right)=\dfrac{1}{m}\sum\limits_{i=1}^mL\left(\hat{y^{(i)}},y^{(i)}\right)=
-\dfrac{1}{m}\sum\limits_{i=1}^m[y^{(i)}log\hat{y^{(i)}}+(1-y^{(i)})log(1-\hat{y^{(i)}})]
$$

### Gradient Descent

==$J(w,b)$==  is convex
$$
w:=w-\alpha\dfrac{\mathrm{d}J(w)}{\mathrm{d}w}
$$

> $\alpha$ is learning rate

### Computation Graph

![image-20230719184302356](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230719184302356.png)

> Notations

* dvar  最终感兴趣的变量的导数

![image-20230719185425875](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230719185425875.png)

> weaknesses

* two for loo – computation speed
* too many features $\mathrm{d}w_i$ –- vectorization

### Vectorization

```python
import numpy as np
C = np.dot(A,B)
D = np.exp(A)
np.log()
np.abs()
np.maximum()
```

==Forward propagation==

![image-20230720122125202](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720122125202.png)

==Back Propagation==

![image-20230720130243501](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720130243501.png)

![image-20230720121307384](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720121307384.png)

![image-20230720130103828](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720130103828.png)

### Broadcasting

```python
cal = A.sum(axis = 0)
# A(3,4)
# cal(1,4)
percentage = 100*A/cal.reshape(1, 4)
percentage = 100*A/cal
```

![image-20230720131337912](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230720131337912.png)

### NumPy Vectors

```python
import numpy as np

a = np.random.randn(5)  # rank 1 array
print(np.dot(a,a.T))
a = np.random.randn(5,1) # column vector
assert(a.shape == (5,1))
print(np.dot(a,a.T))
```

