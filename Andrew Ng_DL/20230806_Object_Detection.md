# Object Detection

## Object localization

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230808080302695.png" alt="image-20230808080302695" style="zoom:50%;" />

## Landmark detection

## Object detection

### Sliding window detection

* high computational cost
* stride

### convolutional implementation of sliding window detection

* turning FC layers into convolutional layers

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230808083103236.png" alt="image-20230808083103236" style="zoom:50%;" />

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230808083500074.png" alt="image-20230808083500074" style="zoom:50%;" />

### accurate bounding box

#### YOLO algo

* you only look once

### Intersection over union

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230808085316901.png" alt="image-20230808085316901" style="zoom:50%;" />



### Non-max suppression

* Make sure the algo only detect the object once
* Make sure that you output the maximal probabilities classifications but suppress the close-by ones that are non-maximal

### anchor box

#### overlapping objects

* Predefine anchor box shapes
* Previously: each object is assigned to grid cell that contains that object’s midpoint
* With anchor boxes: each object in the training image is assigned to grid cell that contains object’s midpoint and anchor box for the grid cell with highest IoU
* Can’t handle well
	* Have 2 anchor boxes but 3 objects in the same grid cell
	* 2 objects associated with the same grid cell but both have the same anchor box shape

### Region Proposals: R-CNN(region CC)

* Segmentation algo
	* R-CNN: propose regions. Classify proposed regions one at a time. Output label + bounding box
	* Fast R-CNN: Propose regions. Use convolution implementation of sliding windows to classify all the proposed regions
	*  Faster R-CNN: Use convolutional network to propose regions
