# Recurrent Neural Network

* speech recognition
* music generation
* sentiment classification
* DNA sequence analysis
* machine translation
* video activity recognition
* name entity recognition

## Model

* problems of standard network
	* Inputs, outputs can be different lengths in different examples
	* Doesn’t share features learned across different positions of text

### Baisc RNN

> scan the input from left to right

> share parameters

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812160616389.png" alt="image-20230812160616389" style="zoom:60%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812161041372.png" alt="image-20230812161041372" style="zoom: 50%;" />

* usually use tanh/ReLU as the activation function

### Back Prop

### Different Types of RNNs

* Type
	* many-to-many
	* mangy-to-one
	* one-to-one
	* one-to-many

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812165255144.png" alt="image-20230812165255144" style="zoom:50%;" />

* problems
	* vanishing gradients
	* not good at long-term dependencies

## Lnaguage Model and Sequence Generation

* <EOS> as the token to represent end
* <UNK> as the token for unknown words

### Sampling Novel Sequences

* word-level language model
* character-language model
	* no unkown tokens <UNK>
	* much longer sequences
	* much more computational cost

## Gated Recurrent Unit (GRU)

> address gradient vanishing

> long dependencies

> 2 gates

* $c$ = memory cell
* $c^{<t>}=a^{<t>}$
* $\Gamma_u$ when you should update the value

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812173806125.png" alt="image-20230812173806125" style="zoom:67%;" />

## Long short term memory unit (LSTM)

> 3 gates

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812175429253.png" alt="image-20230812175429253" style="zoom: 67%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812175451966.png" alt="image-20230812175451966" style="zoom: 67%;" />

## Bidirectional RNN (BRNN)

> get info from the future

## Deep RNNs

> stack multiple RNN blocks together

> computational expensive

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230812180730209.png" alt="image-20230812180730209" style="zoom:50%;" />