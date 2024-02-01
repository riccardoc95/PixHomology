import numpy as np
from tensorflow.keras import datasets
import tensorflow_datasets as tfds
import tqdm

import warnings
warnings.filterwarnings("ignore")

import tensorflow as tf
import logging
tf.get_logger().setLevel(logging.ERROR)


def rgb2gray(rgb, normalize=False):
    r, g, b = rgb[:,:,0], rgb[:,:,1], rgb[:,:,2]
    gray = 0.2989 * r + 0.5870 * g + 0.1140 * b

    if normalize:
        gray -= gray.min()
        gray /= gray.max()

    gray = gray.astype(np.float32)
    
    return gray


class MNIST:
    def __init__(self):
        (x_train, y_train), (x_test, y_test) = datasets.mnist.load_data()
        self.mnist = x_train
    
    def get_size(self):
        return len(self.mnist)
    
    def image(self, i=0):
        return self.mnist[i].astype(np.float32)

class CIFAR10:
    def __init__(self, normalize=False):
        (x_train, y_train), (x_test, y_test) = datasets.cifar10.load_data()
        self.cifar10 = x_train
        self.normalize = normalize
    
    def get_size(self):
        return len(self.cifar10)
    
    def image(self, i=0):
        return rgb2gray(self.cifar10[i].astype(np.float32), normalize=self.normalize)


class IMAGENET_A:
    def __init__(self,normalize=False):
        self.imagenet_a = tfds.load('imagenet_a', split='test')
        self.it_imagenet_a = iter(self.imagenet_a)
        self.type = type
        self.normalize = normalize
    
    def get_size(self):
        return len(self.imagenet_a)
    
    def image(self, i=0):
        return rgb2gray(next(self.it_imagenet_a)[self.type].numpy().astype(np.float32), normalize=self.normalize)


class DIV2K:
    def __init__(self, type='hr',normalize=False):
        self.div2k = tfds.load('div2k', split='train')
        self.it_div2k = iter(self.div2k)
        self.type = type
        self.normalize = normalize
    
    def get_size(self):
        return len(self.div2k)
    
    def image(self, i=0):
        return rgb2gray(next(self.it_div2k)[self.type].numpy().astype(np.float32), normalize=self.normalize)


if __name__ == "__main__":
    d = DIV2K()
    print(d.image(0))

    