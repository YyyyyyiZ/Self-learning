## Mini-batch gradient descent

* choose size
	* m—batch gradient descent
		* big step
	* 1—stochastic gradient descent
		* small step
		* noise
		* lose all the speedups through vectorization
	* somewhere in between—mini-batch gradient descent
		* fast learning
		* make progress without having to wait the entire taining set
* small traning set—use batch GD
* typical mini-batch size—64, 128, 256, 512
* make sure mini-batch fits into CPU/GPU memory

## Exponentially weighted averages

### Basic formula

$$
V_t = \beta V_{t-1} + (1-\beta)\theta_t
$$

* $V_t$ is an approximately average over $\frac{1}{1-\beta}$ days

* $\beta^{\frac{1}{1-\beta}} \approx \frac{1}{e}$
* save memory and code when computing averages

### Bias correction

![image-20230729172448512](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230729172448512.png)

## Gradient Descent with Momentum

> Almost always works faster than the standard GD

> Compute an exponentially weighted average of the gradients to update the weights instead

* $\updownarrow$ slower learning; $\updownarrow$ fast learning

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230730205709793.png" alt="image-20230730205709793" style="zoom: 33%;" />

* smooth out the GD
* no need to correct the bias

## RMSprop

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230730210540185.png" alt="image-20230730210540185" style="zoom:50%;" />

## Adam Algorithm

> work well on many problems

* adaptive moment estimation
	* If $w_j$ or $b$ keeps moving in same direction, incease $\alpha_j$
	* If $w_j$ or $b$ keeps oscillating, reduce $\alpha_j$

```python
from tensorflow.keras.losses import SparseCategoricalCrossentropy

model.compile(optimizer = tf.keras.optimizers.Adam(learning_rate = 1e-3), 
              loss = SparseCategoricalCrossentropy(from_logits = True))
model.fit(X, Y, epochs = 10)
```

## Learning Rate Decay

$$
\alpha = \dfrac{1}{1+decay\_rate*epoch\_num}\alpha_0\\
\\
\alpha = 0.95^{epoch\_num}\alpha_0\\
\\
\alpha = \dfrac{k}{\sqrt{epoch\_num}}\alpha_0\\
\\
manual\ decay
$$

## Local Optima

### Saddle Point

* low-dimensional situations are different from high-dimensional spaces
* saddle point rather ran local optima
* unlikely to get stuck in a bad local optima

### Problem of Plateaus

* a region where the derivative is close to zero for a long time
* make learning very slow
