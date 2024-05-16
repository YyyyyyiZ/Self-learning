## Train/dev/test sets

* make sure 3 sets come from sane distribution
* it’s OK to not have test set, which is for the purpose of unbiased estimates
* 6:2:2

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726205256124.png" alt="image-20230726205256124" style="zoom:50%;" />

## Bias and Variance

## Basic Recipe for ML

* high bias
	* bigger network—alomost never hurts except for time
	* train longer
	* NN architecture search

* high variance
	* more data
	* regularization
	* NN architecture search

## Regularization

### L1

* w will be sparse

### L2

* more often
* “Frobenius Norm” in NN

### dropout

* set some probability of eliminating a node in NN
* typical—inverted dropout
* intuition—can’t rely on any one feature, so have to spread out weights, similar effect to L2
* hyper parameter—keep prob
* most successful in CV
* downside—cost function J is not well defined

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726213959965.png" alt="image-20230726213959965" style="zoom: 33%;" />

### Other methods

* Data augmentation
* Early stopping
	* not recommended

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230726215818262.png" alt="image-20230726215818262" style="zoom:33%;" />

## Normalization

## Vanishing/exploding gadients

* cause

	gradient becomes too small/big such that it makes training difficult

* solution

	weight initialization

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230729160436685.png" alt="image-20230729160436685" style="zoom: 33%;" />

## Gradient Checking (Grad check)

* two-sided difference  instead of one-sided

$$
\mathrm{d}\theta_{approx}\xlongequal{?}\mathrm{d}\theta\\
\\
\dfrac{||\mathrm{d}\theta_{approx}-\mathrm{d}\theta||_2}{||\mathrm{d}\theta_{approx}||_2+||\mathrm{d}\theta||_2}
$$

* tips
	* don’t use grad check in training—only to bug
	* If algo fails grad check, look at components to try to identify bug
	* remember regulaization
	* grad check doesn’t work with dropout, turn off dropout (keep prob=1)
