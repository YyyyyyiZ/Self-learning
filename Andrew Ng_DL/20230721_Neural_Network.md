# Neural Network

## Shallow

### Representation

* Input layer
* Hidden layer—the true values for those nodes in the middle aren’t observed
* Output layer

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230721181348646.png" alt="image-20230721181348646" style="zoom: 33%;" />

> 2 layer NN—Input layer is usually not included

### Computation & Vectorization

#### Forward Propagation

![image-20230721184357830](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230721184357830.png)

#### Back Propagation

![image-20230721193453909](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230721193453909.png)
$$
\mathrm{d}Z^{[2]}=A^{[2]}-Y\\
\mathrm{d}W^{[2]}=\dfrac{1}{m}\mathrm{d}Z^{[2]}A^{[1]T}\\
\mathrm{d}b^{[2]}=\dfrac{1}{m}\text{np.sum}(\mathrm{d}Z^{[2]}, \text{axis=1,keepdims=TRUE})\\
\mathrm{d}Z^{[1]}=W^{[2]T}\mathrm{d}Z^{[2]}*g^{[1]'}(Z^{[1]})\\
\mathrm{d}W^{[1]}=\dfrac{1}{m}\mathrm{d}Z^{[1]}X^{T}\\
\mathrm{d}b^{[1]}=\dfrac{1}{m}\text{np.sum}(\mathrm{d}Z^{[1]}, \text{axis=1,keepdims=TRUE})
$$

### Activation Function

* sigmoid

$$
a=g(z)=\dfrac{1}{1+e^{-z}}\\
\dfrac{\mathrm{d}g(z)}{\mathrm{d}z}=g(z)(1-g(z))
$$

> only for binary classification

* tanh

$$
a=g(z)\dfrac{e^z-e^{-z}}{e^z+e^{-z}}\\
\dfrac{\mathrm{d}g(z)}{\mathrm{d}z}=1-(tanh(z))^2
$$

> superiro to sigmoid, center the data to make the mean close to 0; except for binary classification

> If z is very large or small, the gradient of sigmoid and tanh becomes small, slow down gradient descent

* ReLU

$$
a=g(z)=max(0, z)\\
\dfrac{\mathrm{d}g(z)}{\mathrm{d}z}=
\begin{cases}
0,&\text{if $z\leqslant$ 0}\\
1,&\text{otherwise}
\end{cases}
$$

> commonly used

> learn fast

* Leaky ReLU

$$
a=g(z)=max(0.01z, z)\\
\dfrac{\mathrm{d}g(z)}{\mathrm{d}z}=
\begin{cases}
0.01,&\text{if $z\leqslant$ 0}\\
1,&\text{otherwise}
\end{cases}
$$

* Linear activtion function/identity activation function

> the neural network is just outputting ==a linear function== of the input, useless

### Gradient Descent

### Random Initialization

> can’tn initialize with 0, w will have symmetry breaking problem

```python
import numpy as np

w1 = np.random.randn((2, 2))*0.01  # prefer small random variables
# 0.01 is suitable for shallow NN
# deep NN should choose a different number
b1 = np.zeros((2, 1))  # b won't have symmetry breaking problem
```



## Deep

### Dimension

$$
W^{[l]}: (n^{[l]}, n^{[l-1]})\\
b^{[l]}: (n^{[l]}, 1)
$$

### Propagation

> 梯度下降的一步迭代

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722172134526.png" alt="image-20230722172134526" style="zoom:33%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722172318467.png" alt="image-20230722172318467" style="zoom:25%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722172707274.png" alt="image-20230722172707274" style="zoom:33%;" />
$$
\mathrm{d}Z^{[l]}=\mathrm{d}A^{[l]}*g^{[l]'}(Z^{[l]})\\
\mathrm{d}W^{[l]}=\dfrac{1}{m}\mathrm{d}Z^{[l]}A^{[l-1]T}\\
\mathrm{d}b^{[l]}=\dfrac{1}{m}\text{np.sum}(\mathrm{d}Z^{[l]}, \text{axis=1,keepdims=TRUE})\\
\mathrm{d}A^{[l-1]}=W^{[l]T}\mathrm{d}Z^{[l]}
$$

### Parameters

* $W^{[1]}, b^{[1]}, W^{[2]}, b^{[2]}, W^{[3]}, b^{[3]},......$

### Hyper parameters

> empirical process, try a lot

* learning rate $\alpha$
* iterations
* hidden layer L
* hidden units
* activation function
* momentum term
* minimum batch size
* regularization parameter

