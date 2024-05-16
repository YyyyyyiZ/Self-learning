# Decision Tree

> recursive algorithm

* cons
	* trees are highly sensitive to small changes of the data

## Learning Process

* what feature to split on at each node
	* maximize purity (minimize impurity)
* stopping criteria
	* when a node is 100% one class
	* improvement in purity score below a threshhold
	* number of examples in a node below a threshhold
	* exceed a maximum depth (less prone to fitting)

## One-hot Encodingse

* If a categorical feature can take on k values, create k binary features (0 or 1 valued)

## Continuous Features

* consider different values and choose the best

## Measuring Purity

### Entropy

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230804110616976.png" alt="image-20230804110616976" style="zoom:50%;" />

### Gini

### Information Gain

> weighted averages

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230804111443508.png" alt="image-20230804111443508" style="zoom:50%;" />

# Regression Tree

* choose a split
	* the lowest weighted variance
