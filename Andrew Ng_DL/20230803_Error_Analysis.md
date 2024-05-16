# Error Analysis

## Carry out EA

* get ~100 mislabeled dev set examples
* count up the number of each mislabeled category

## Mislabeled examples

* Train
	* DL algos are quite robust to random errors in the training set, less robust to systematic  errors

* best practice
	* apply same procedure to dev/test sset to make sure of same distribution
	* consider examining examples the algo got right as well got wrong

## Different Distributions

### application

### data mismatch

* training-dev set error

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230803105740172.png" alt="image-20230803105740172" style="zoom:50%;" />

### more general formulation

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230803110300626.png" alt="image-20230803110300626" style="zoom:50%;" />

### address

* carry out manual error analysis to try to understand difference between training and dev/test sets
* make training data more similar; or collect  more data similar to dev/test set
	* artificial data systhesis
		* simulate data from a tiny subset of all possible examples
		* may overfit

## Build and Iterate

* set up dev/test set and metric
* build initial system quickly (quick and dirty)
* use bias/variance analysis & error analysis to prioritize next steps

## Transfer Learning

## Multi-task Learning

> computer vision

* different from softmax regression
* when multi-task learning makes sense
	* training on a set of tasks that could benefit from having shared lower-level features
	* usually amout of data you have for each task is quite similar
	* can train a big enough neural network to do well on all the tasks

## End-to-end DL

* pros
	* let the data speak, no human preperception
	* less hand-designing of components needed
* cons
	* need large amount of dat
	* excludes potentially useful hand-designed components

* examples
	* machine translation

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230804094412284.png" alt="image-20230804094412284" style="zoom:50%;" />

* multi-step learning
	* face recognition
	* estimate child’s age
