# use pylearn2 to proprocessing the dataset

# 1.test the pylearn2 setup http://deeplearning.net/software/pylearn2/tutorial/index.html#tutorial

# change to root
su
# 1 step: make dataset
python make_dataset

# 2.step: train
/home/dl/pylearn2/pylearn2/scripts/train.py cifar_grbm_smd.yaml

# 3. visualize the filters
/home/dl/pylearn2/pylearn2/scripts/show_weights.py cifar_grbm_smd.pkl
/home/dl/pylearn2/pylearn2/scripts/plot_monitor.py cifar_grbm_smd.pkl
