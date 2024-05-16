# Recommender System

## Using Per-item Features

### Cost function

* For a single user j

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image009.png" alt="img" style="zoom:67%;" />

* For all users

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image011.png" alt="img" style="zoom:67%;" />

 

## Collaborative Filtering Algorithm

> Gathering data from multiple users to predict the actions of other users

* limitations
  * old start problem
    * rank new items that few users have rated
    * show something reasonable to new users who have rated few items
* solutions
  * use side information
    * item: genre, movie star, studio
    * user: demographics, expressed preferences

### Cost function

#### Continuous

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image013.png" alt="img" style="zoom:67%;" />

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image015.png" alt="img" style="zoom:67%;" />

#### Binary

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image018.png" alt="img" style="zoom: 67%;" />

### Gradient Descent

<img src="file:///C:/Users/BNY1SGH/AppData/Local/Temp/msohtmlclip1/01/clip_image016.png" alt="img" style="zoom:67%;" />

 

### Mean Normalization

* normalize the rows
  * when a user hasn't rated a movie
  * give more reasonable predictions (use mean insteat of 0)

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816092541409.png" alt="image-20230816092541409" style="zoom:67%;" />

* normalized the column
  * when a column hasn't been rated by any user

### TensorFlow Implementation

* custom training loop

```python
import tensorflow as tf

w = tf.Variable(3.0)
x = 1.0
y = 1.0
optimizer = keras.optimizers.Adam(learning_rate = 0.01)

# Auto Diff/Auto Grad
iterations = 30
for iter in range(iterations):
    with tf.GradientTape() as tape:
        cost_value = cofiCostFuncV(X, W, b, Ynorm, R, num_users, num_movies, lambda)
        
    grads = tape.gradient(cost_value, [X, W, b])
    optimizer.apply_gradient(zip(grads, [X, W, b]))
```

## Content-based Filtering Algorithm

> learning to match

* collaborative filtering
  * recommend items to you based on rating of users who gave similar ratings as you
* content-based filtering
  * recommend items to you based on the features of user and item to find good match

### NN Architecture

> learned user and item vectors

* $v_u^{(j)}$ is a vector of length $n$ that describes user j with features $x_u^{(j)}$
* $v_m^{(i)}$ is a vector of length $n$ that describes movie i with features $x_m^{(i)}$

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816095935271.png" alt="image-20230816095935271" style="zoom:67%;" />

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816100012189.png" alt="image-20230816100012189" style="zoom:67%;" />

### Recommend from a Large Catalog

#### Two steps

* Retrieval

  > retrieve more items results in better performance but slower recommendations

  * generate large list of plausible item candidates
  * combine retrieved items into list, removing duplicates and items already watched/purchased

* Ranking

  * Take list retrieved and rank using learned model
  * display ranked items to user

### Implementation

```python
user_NN = tf.keras.models.Sequantial([
    tf.keras.layers.Dense(256, activation = 'relu'),
    tf.keras.layers.Dense(128, activation = 'relu'),
    tf.keras.layers.Dense(32)
])
item_NN = tf.keras.models.Sequantial([
    tf.keras.layers.Dense(256, activation = 'relu'),
    tf.keras.layers.Dense(128, activation = 'relu'),
    tf.keras.layers.Dense(32)
])

input_user = tf.keras.layers.Input(shape = (num_user_features))
vu = user_NN(input_user)
vu = tf.linalg.l2_normalize(vu, axis = 1)

input_item = tf.keras.layers.Input(shape = (num_user_features))
vm = user_NN(input_item)
vm = tf.linalg.l2_normalize(vm, axis = 1)

output = tf.keras.layers.Dot(axes = 1)([vu, vm])

model = Model([input_user, input_item], output)

cost_fn = tf.keras.losses.MeanSquareError()
```

## Ethical Use of Recommender System

* what to recommend
  * ads mostly to be clicked on
  * movies most likely to be rated 5 stars by user
  * products generating the largest profit
  * video leading to maximum watch time