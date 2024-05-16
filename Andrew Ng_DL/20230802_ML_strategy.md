## Orthogonalization

### Chain of assumptions in ML

> early stop—may fail to fir the training set well

* Fit training set well on cost function
	* compare to huamn performance
	* bigger NN
* Fit dev set well on cost function
	* Regularization
	* Bigger training set
* Fit test set well on cost function
	* Bigger data set
* Performs well in real world
	* Change dev set or cost function

## Evaluation Metric

### satisficing metrics

> one or more

* running time

### optimizing metrics

> one

## Train/dev/test Set

### dev set

* dev and test follow the same distribution
* dev set and validation metric directly impact the right/wrong of the target

### training set

* affect how well you can hit that target

### proportion

* anti-tradtional proportion
* no test set if dev set us big enough

## Human Performance

* Bayes optimal error—best possible error
	* human level error as a proxy for Bayes error

* worse than humans, you can
	* get labeled data from humans
	* gain insight from manual error analysis—why human get this right?
	* better analysis of bias and variance

### Avoidable bias

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230802123006536.png" alt="image-20230802123006536" style="zoom:50%;" />

### Surpass human-level performance

> structured data

> not natural perception tasks

> huge amounts of data

* online advertising
* product recommendations
* logistics—predicting transit time
* loan approvals

### Improve model performance

* fit the training set well
	* train bigger model
	* train longer/better optimization algo
	* NN architecture/hyperparameters search
* training set performance generalize well to dev/test size
	* more data
	* regularization (L2, data augmentation, dropout)
	* NN architecture/hyperparameters search
