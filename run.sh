##give an example to run
module load python/2.7.8
module load matlab/R2016b
cd images

##merge the mask
while read line
	do
		python ../utils/mergeMask.py $line
	done<../utils/train.txt


##cut image into 32*32, and label them as background, edge, and positive.
matlab -nodisplay < make_patches.m > matlab_step1.out

## create the database for 5 fold validation
matlab -nodisplay < make_training_lists.m > matlab_step2.out

##prepare the traning and testing data
cd subs/
~/Downloads/caffe/build/tools/convert_imageset -shuffle -backend leveldb   ./ ../train_w32_1.txt ../DB_train_1 &
~/Downloads/caffe/build/tools/convert_imageset -shuffle -backend leveldb   ./ ../test_w32_1.txt ../DB_test_1 &

cd ../
~/Downloads/caffe/build/tools/compute_image_mean DB_train_1 DB_train_w32_1.binaryproto -backend leveldb  &

##train model
cd models
~/Downloads/caffe/build/tools/caffe train --solver=./1-alexnet_solver_ada.prototxt &

##prediction
Python create_output_images_kfold.py data/ 1 &

##compute IoU score
python IoU.py [SampleName]
