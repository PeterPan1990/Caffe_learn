#!/usr/bin/env sh
# This script converts the cifar data into leveldb format.

EXAMPLE=examples/svhn
DATA=data/svhn

echo "Creating leveldb..."

rm -rf $EXAMPLE/svhn_train_leveldb $EXAMPLE/svhn_test_leveldb

./build/examples/svhn/convert_svhn_data.bin $DATA $EXAMPLE

echo "Computing image mean..."

./build/tools/compute_image_mean $EXAMPLE/svhn_train_leveldb \
  $EXAMPLE/mean.binaryproto leveldb

echo "Done."
