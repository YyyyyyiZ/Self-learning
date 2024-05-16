# Analysis of Algorithm

## Reasons

* predict performance
* compare algorithms
* provide guarantees
* understand theoretical basis
* primary reason—==understand theoretical basis==

> Example

* FFT algo—$n^2\rightarrow nlogn$
* N-body simulation—$n^2\rightarrow nlogn$

## Scientific method

* Observe
* Hypothesize
	* Experiments must be reproducible
	* Hypotheses must be falsifiable
* Predict
* Verify
* Validate

## Observations

#### Empirical Analysis

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722211500629.png" alt="image-20230722211500629" style="zoom: 33%;" />

## Mathematical Models

> Total running time: sum of cost * frequency of operations

* simplification 1: cost model
* simplification 2: tilde notation

## Order-of-growth Classifications

* a small set of functions $1, logN, N, NlogN, N^2, N^3, 2^N$ suffices to describe order-of-gowth of typical algos

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722213231321.png" alt="image-20230722213231321" style="zoom:50%;" />

## Theory of Algorithm

* Best case—lower bound on cost, “easiest” input
* Worst case—upper bound on cost, ”most difficult” input
* Average case—expected cost of “random” input

## Memory

* Bit. 0 or 1
* Byte. 8 bitss
* Megabyte(MB). 1million or $2^{20}$ bytes
* Gigabyte(MB). 1million or $2^{30}$ bytes

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722215810948.png" alt="image-20230722215810948" style="zoom:33%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230722220231477.png" alt="image-20230722220231477" style="zoom: 25%;" />