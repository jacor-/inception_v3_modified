#!/bin/bash

FILESPATH=$1
OUT_FILENAME=$2

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"

    echo "You should try this:"
    echo "   $0 /home/jose/Datasets/Flicker8k_Dataset out_filename.out "
    exit
fi

echo "Removing the output file if exists"
rm $OUT_FILENAME

echo "Lets featurize each image in the dataset"
for f in  $FILESPATH/*
do
  echo "  -- Computing features for file $f"
  bazel-bin/tensorflow/examples/label_image/label_image --output_layer=pool_3 --image=$f 2| grep FEATURES | sed 's/ .*\// /' >> $OUT_FILENAME
done



