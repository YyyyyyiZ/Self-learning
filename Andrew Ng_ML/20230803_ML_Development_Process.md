## Iterative Loop

* choose architecture—model, data, etc.
* train model
* diagnostics—bias, variance, error analysis

### Error analysis

### Adding data

* data augmentation
	* modifying an existing training example to create a new training example
* data synthesis

### Engineering the data

> AI = Code + Data

* conventional model-centric approach—focus on code/algo/model
* data-centric approach—foucs on data

## Transfer Learning

> you yourself don’t need a large dataset for training

### step

* download neural network parameters pretrained on a large dataset with same input type as your application
* further train (fine tune) the network on your own data

### fine tune

* option1:  only train output layers parameters
* option2: train all parameters

## Full Cycle of ML Project

![image-20230803115801303](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230803115801303.png)

## Fairness, bias and ethics

### Bias

* hiring tools that discriminates against women
* matching dark skinned individuals to criminial mugshots
* biased bank loan approvals
* toxic effect of reinforcing negative stereotypes

### Adverse Use Cases

* deepfakes
* fake content for commercial and political purposes

### Guidelines

* a diverse team to brainstorm potential threats
* carry out literature researc
* audit system before deployment
* develop mitigation plan

## Skewed Datasets

### Formula

* precision

$$
\dfrac{\text{true pos}}{\text{pred pos}}=\dfrac{\text{true pos}}{\text{true pos + false pos}}=\dfrac{15}{15+5}
$$

* recall

$$
\dfrac{\text{true pos}}{\text{actual pos}}=\dfrac{\text{true pos}}{\text{true pos + false neg}}=\dfrac{15}{15+10}
$$

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230803122555653.png" alt="image-20230803122555653" style="zoom:33%;" />

### Tradeoff

* F1-score—harmonic mean of P and R

$$
F1=\dfrac{2}{\frac{1}{P}+\frac{1}{R}}=\dfrac{2PR}{P+R}
$$



