# Hyperparameter Tuning

## Tuning Process

### Priority

> empirical process, try a lot

1. learning rate $\alpha$

2. $\beta$ ~ 0.9; minimum batch size; hidden layer L

3. hidden units;learning rate decay

* iterations
* activation function
* momentum term
* regularization parameter

## Random Values

> Don’t use a grid search

> have no idea which parameter is more important

### Coarse to fine sampling scheme

> zoom in to a smaller region

## Appropriate Scale

> bad idea to sample in a linear scale

> reason: when $\beta$ is close to 1, the sensitivity of the results you get changes, even with small changes to $\beta$

### Log scale

### Exponentially weigted averages

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801195614928.png" alt="image-20230801195614928" style="zoom:50%;" />

## Pandas vs. Caviar

### Babysitting one model

### Training many models in parallel

# Batch Normalization

## Normalization Activations

## Batch Norm (BN)

> e.g. normalize $a^{[2]}/z^{[2]}$ so as to train $w^{[3]}, b^{[3]}$ faster

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801204047177.png" alt="image-20230801204047177" style="zoom:50%;" />

* $\gamma$ and $\beta$ are learnable parameters

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230801202743326.png" alt="image-20230801202743326" style="zoom: 33%;" />

* reduce the problem of the input values changing
* allow each layer to learn by themselves (independent)

### BN as Regularization

* Each mini-batch is scaled by the mean/variance computed on just that mini-batch
* This adds some noise to the values $z^{[l]}$ within that mini-batch. So similar to dropout. it adds some noise to each hidden layer’s activations
* This has a slight regularization effect

### BN at test time

* different estimate of $\mu$ and $\sigma^2$ using exponentially weighted average
* keep track of $\mu$ and $\sigma^2$ during training and use exponentially weighted average/running average to estimate $\mu$ and $\sigma^2$ ,and use them at test time to do the scale
* pretty robust estomation

# Softmax Regresssion

> generalize logistic regression to C classes

> decision boundaries between any two classes will be more linear

## Activation Function



## Cost function

$$
loss(a_1,..., a_N, y)=
\begin{cases}
-loga_1,&\text{if $y=1$}\\
-loga_2,&\text{if $y=2$}\\
\qquad \vdots \\
-loga_N,&\text{if $y=N$}
\end{cases}
$$

## Gradient Descent

### Back Prop

$$
\mathrm{d}z^{[l]}=\hat y-y\\
\dfrac{\mathrm{d}J}{\mathrm{d}z^{[l]}}
$$



## Softmax Layer

```python
import tensorflow as tf
from tensorflow.keras import Sequential
from tensorflow.keras.layers import Dense

# version 1
model = Sequential([
    Dense(units = 25, activation = 'relu')
    Dense(units = 15, activation = 'relu')
    Dense(units = 10, activation = 'softmax')
])

from tensorflow.keras.losses import SparseCategoricalCrossentropy

model.compile(loss = SparseCategoricalCrossentropy())
model.fit(X, Y, epochs = 10)
```

## Improved Implementation

```python
# version 2
model = Sequential([
    Dense(units = 25, activation = 'relu')
    Dense(units = 15, activation = 'relu')
    Dense(units = 10, activation = 'linear')
])

from tensorflow.keras.losses import SparseCategoricalCrossentropy

model.compile(loss = SparseCategoricalCrossentropy(from_logits = True))
model.fit(X, Y, epochs = 10)
```

# Deeping Learning Frameworks

## Framworks

* Caffe/Caffe2
* CNTK
* DL4J
* Keras
* Lasagne
* mxnet
* PaddlePaddle
* TensorFlow
* Theano
* Torch

## Criterion

* Ease of programming
* Running speed
* Truly open

# TF Implementation

```python
import numpy as np
import tensorflow as tf

w = tf.variable(0, dtype = tf.float32)
optimizer = tf.keras.optimizers.Adam(0.1)

def train_step():
    with tf.GradientTape() as tape:
        # manual fore prop, automatic back prop
        cost = w**2 - 10*w + 25
    trainable_variables = [w]
    grads = tape.gradient(cost, trainable_variables)
    optimizer.apply_gradient(zip(grads, trainable_variables))
print(w)

train_step()
print(w)

for i in range(1000):
    train_step()
print(w)
```

```python
w = tf.variable(0, dtype = tf.float32)
x = np.array([1.0, -10.0, 25.0], dtype = np.float32)
optimizer = tf.keras.optimizers.Adam(0.1)

def training(x, w, optimizer):
    def cost_fn():
        return x[0]*w**2 + x[1]*w + x[2]  # construct a computation graph
    for i in range(1000):
        optimizer.minimize(cost_fn, [w])
    return w

w = training(x, w, optimizer)
print(w)
```

