import numpy as np
from tensorflow.keras import datasets
import tensorflow_datasets as tfds
import tqdm

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
        ds = tfds.load('imagenet_a', split='test')
        self.imagenet_a = list(map(lambda x: x['image'], ds))
        self.type = type
        self.normalize = normalize
    
    def get_size(self):
        return 10#len(self.imagenet_a)
    
    def image(self, i=0):
        return rgb2gray(self.imagenet_a[i].numpy().astype(np.float32), normalize=self.normalize)


class DIV2K:
    def __init__(self, type='hr',normalize=False):
        ds = tfds.load('div2k', split='train')
        self.div2k = list(map(lambda x: x[type], ds))
        self.type = type
        self.normalize = normalize
    
    def get_size(self):
        return 10#len(self.div2k)
    
    def image(self, i=0):
        return rgb2gray(self.div2k[i].numpy().astype(np.float32), normalize=self.normalize)
    