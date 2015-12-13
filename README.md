# inception_v3_modified


This is just a modification of the inception_v3 provided by Google during NIPS 2015. They explain in the documentation how to get the final classification and suggest you to modify the code in order to extract the features at a given layer.
This repository contains a small modification of the original code which allows you to do that.

1 Download the content of this repo in the root of your tensorflow instance
2 Build the code

    bazel build tensorflow/examples/label_image/...

3 If you want to see the output of the classification (the same behavior as the original source)

    bazel-bin/tensorflow/examples/label_image/label_image --output_layer=softmax

4 If you want to get the features at a given layer (let's say pool_3), do:
    
    bazel-bin/tensorflow/examples/label_image/label_image --output_layer=pool_3 | grep FEATURES


## Future required improvements

* It would we nice to be able to send a list of layers as a parameter and get the representations at all those layers.
