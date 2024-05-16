# Reinforcement Learning

## Formalism

### Key Concepts

#### Reward

#### Return

> The return depends on the action you take

* sequence of reward + discount factor

#### Policy

> what action to take in different state

![image-20230816112125420](C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816112125420.png)

### Markov Decision Process (MDP)

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816112419371.png" alt="image-20230816112419371" style="zoom:67%;" />

## State-action Value Function

### Implementation

* $Q(s, a)=$Return if you {start in state $s$, take action $a$, then behave optimally after that}

```python
import numpy as np
from utils import *

num_state = 6
num_actions = 2
terminal_left_reward = 100
terminal_right_reward = 40
each_step_reward = 0
gamma = 0.5
# Probability of going in the wrong direction
# Apply to random environment
misstep_prob = 0.5
generate_visualization(terminal_left_reward, terminal_right_reward,each_step_reward, gamma, misstep_prob)
```

### Bellman Equation

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816114133893.png" alt="image-20230816114133893" style="zoom:67%;" />

* $R(s)$---reward you get right away
* $\gamma\ \underset{a\prime}{max}Q(s\prime, a\prime)$---return from behaving optimally starting from state $s\prime$

### Learning Algorithm

#### Deep-Q Network  (DQN)

##### Architecture

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816131352694.png" alt="image-20230816131352694" style="zoom:67%;" />

##### Algorithm

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816121321605.png" alt="image-20230816121321605" style="zoom:67%;" />

#### Refinement

##### Architecture

* 4 outputs instead of 1

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816131240783.png" alt="image-20230816131240783" style="zoom:50%;" />

##### $\epsilon$-greedy policy 

> choose actions while still learning

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816131903301.png" alt="image-20230816131903301" style="zoom:67%;" />

##### Mini-batch and Soft Update

> make gradual change to the parameter

* $W=0.01W_{new}+0.99W$

## Random (Stochastic) Process

### Expected Return

* Return = $Avg(R_1+\gamma R_2+\gamma^2 R_3+...)$

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816115329418.png" alt="image-20230816115329418" style="zoom:80%;" />

## State

### Application

* controlling robots
* factor optimization
* financial (stock) trading
* playing games (including video games)

### Discrete vs. Continuous State

> a vector of numbers

<img src="C:\Users\BNY1SGH\AppData\Roaming\Typora\typora-user-images\image-20230816115854924.png" alt="image-20230816115854924" style="zoom:50%;" />
### Limitations
* much easier to get to work in a simulation than a real robot
* far fewer applications than supervised and unsupervised learning