# Machine Learning Diagnostic

## Evaluation

### train/test procedure

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802115050705.png" alt="image-20230802115050705" style="zoom: 40%;" />

### model selection

* compare $J_{test}$ and choose the smallest model
	* The smallest $J_{test}$ is likely to be an optimistic estimate of generalization error. I.e., An extra parameter $d$ (degree of polynomial) was chosen using the test set

* solution: train/cross validation/test

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802120420617.png" alt="image-20230802120420617" style="zoom:50%;" />

## Bias and Variance

### Types

#### underfit—high bias

> bias: there is a pattern in the data that the algorithm fails to capture/the algorithm has a strong preconception

* does not fit the training set well

#### generalization

* fits training set pretty well

#### overfit—high variance

> cv-error is usually higher than train-error

* fits the training set extremely well

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802121251068.png" alt="image-20230802121251068" style="zoom:50%;" />

### Address

> ==feature selection== : select features to include/exclude

> ==regularization== : retain all the features but prevent them from playing overly large impact

#### High bias

* increase additional features
* add polynomial features
* decrease $\lambda$

#### High Variance

* collect more examples
* reduce features
* increase $\lambda$

### NN and bias variance

> change traditional perspective on bias and va

* large NN are low bias machines
* and is unlikely to cause variance (regularization appropriately)

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802125004179.png" alt="image-20230802125004179" style="zoom: 50%;" />

```python
model = Sequential([
    Dense(units = 25, activation = 'relu', kernel_regularizer = L2(0.01))
    Dense(units = 15, activation = 'relu', kernel_regularizer = L2(0.01))
    Dense(units = 10, activation = 'softmax', kernel_regularizer = L2(0.01))
])
```

## Regularization

### Choose $\lambda$

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802121928493.png" alt="image-20230802121928493" style="zoom:40%;" />

## Baseline Performance

* human level performance
	* compare training error with human performance
* competing algorithms performance
* guess based on experience

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802123006536.png" alt="image-20230802123006536" style="zoom:50%;" />

## Learning Curve

### normal situations

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802123323775.png" alt="image-20230802123323775" style="zoom:50%;" />

### high bias

> As training $\uparrow$, $J_{train}$ and $J_{cv}$ will remain flat

> improve the learning algorithm

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802123434613.png" alt="image-20230802123434613" style="zoom:50%;" />

### high variance

> more data can help

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802123811476.png" alt="image-20230802123811476" style="zoom:45%;" />
