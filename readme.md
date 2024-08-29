# Model  
Matlab
# Test
Use Alexnet accuracy 97.52%, Googlenet accurarcy 99.44, resnet50 accuracy 89.64% classify 1000 different categories.
# Type  
We only need six different types of transportation image to be validated
# Modify and Training process  

## 1.Delete matlab provided model with last 3 layers. 
prevent overfitting  
## 2.connect fully-connected layer, softmax layer, classification layer.
reduce model size and prevent overfitting
![image](modify%20layers.png)
## 3.set imageAugmenter = imageDataAugmenter(...) mirroring, translation for imageDatastore to create dataset for augumented Train, validation.  
![image](data%20augmentation.png)
## 4.use Inputdata as 80% for train datastore, 20% for validation datastore.
![image](dataset8-2.png)
## 5.setting trainingOptions : Initial learning rate, max epochs, mini batchsize.
![image](training%20options.png)
![image](Training%20process.png)
## 6.start use net_Train = trainNetwork(augumented training datastore, layers, trainingoptions) to get train model(or net).  
![image](training%20result.png)
## 7.use 20% validation datastore and the net just trained, with classify(net, validationdatastore) to get prediciton scores.
## 8.use mean(Ypred == imdsValidation.Labels) to get accuracy.
![image](classify.png)
## 9.show the result below.
![image](confuse%20matrix.png)


Target: This code is for objects recognition , you can use kaggle dataset.
Enviroment: Matlab
Training model: `googlenet_matlab.mat`

detail:
`validation_cnn.m` is validation program.
Do:
Just change `imagedatastore` 's parameter to your test image folder(input image) path.

other things you can do:
You can create another objects for training like cat, dog ...
ex. ../validation/cat/.. or ../validation/dog/.. 


![image](airplane.jpg)
![image](UAV.jpg)
![image](bicycle.jpg)
![image](motobike.jpg)
![image](car.jpg)
![image](boat.jpg)
