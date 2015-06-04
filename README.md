# Caffe_learn
this is my notes on caffe learn, questions, experience, useful stuff for caffe experiments
## Matlab version
## convert .mat file to leveldb
## .mat file contain the RGB image and their labels

__pipline__:rewrite the data to binary, then use [convert_svhn_data.cpp](https://github.com/PeterPan1990/Caffe_learn/blob/master/convert_svhn_data.cpp)

* use fwrite to write .mat file into .bin file, refer to [matToBinary.m](https://github.com/PeterPan1990/Caffe_learn/blob/master/matToBinary.m), you will got 
train_batch.bin and test_batch.bin, or you can make mulitiple batches just like cifar10 data convert process

* Notes: caffe or leveldb use row prior image data, becareful when you reshape to matrix to vector

* change the [convert_svhn_data.cpp](https://github.com/PeterPan1990/Caffe_learn/blob/master/convert_svhn_data.cpp) file, just varaibles like: kCIFARSize,kCIFARImageNBytes,kCIFARTestBatchSize,
kCIFARTrainBatches, and some path varaible.

* change the [create_svhn.sh](https://github.com/PeterPan1990/Caffe_learn/blob/master/create_svhn.sh) file, just the path need to change

* make the project at root_caffe dir, use: make command

* execute create_svhn.sh file at root_caffe, you will get leveldb at /example/svhn

* click here for [python convert](https://github.com/PeterPan1990/caffe/blob/master/python/caffe/io.py) 

* another python tool [python deepdish](https://github.com/uchicago-cs/deepdish)
