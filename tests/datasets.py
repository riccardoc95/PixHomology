import numpy as np
import tensorflow as tf
from tensorflow.keras import datasets as ds
import tensorflow_datasets as tfds
from astropy.io import fits
from PIL import Image
import wget
import os
from pathlib import Path
import subprocess
import zipfile
import tqdm



home = str(Path.home())
dataset_dir = home + '/datasets'

os.environ['TFDS_DATA_DIR'] = dataset_dir
os.environ['KERAS_HOME'] = dataset_dir


def datasets():
    datasets = {
        'MNIST': MNIST(),
        'CIFAR10': CIFAR10(),
        'IMAGENET_A': IMAGENET_A(),
        'DIV2K': DIV2K(),
        'KATHER': KATHER_LARGER(),
        'MAST': MAST()
    }
    return datasets

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
        (x_train, y_train), (x_test, y_test) = ds.mnist.load_data()
        self.mnist = x_train
    
    def get_size(self):
        return len(self.mnist)
    
    def image(self, i=0):
        return self.mnist[i].astype(np.float32)

class CIFAR10:
    def __init__(self, normalize=False):
        (x_train, y_train), (x_test, y_test) = ds.cifar10.load_data()
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
        return len(self.imagenet_a) # remove image with size > 1000x1000 (ripser killed with 8GB Ram)
    
    def image(self, i=0):
        image = next(self.it_imagenet_a)['image']
        image = tf.image.resize_with_crop_or_pad(image, 256, 256)
        img = rgb2gray(image.numpy().astype(np.float32), normalize=self.normalize)
        return img


class DIV2K:
    def __init__(self, type='hr',normalize=False):
        self.div2k = tfds.load('div2k', split='train')
        self.it_div2k = iter(self.div2k)
        self.type = type
        self.normalize = normalize
    
    def get_size(self):
        return len(self.div2k)
    
    def image(self, i=0):
        image = next(self.it_div2k)[self.type]
        image = tf.image.resize_with_crop_or_pad(image, 1000, 1000)
        img = rgb2gray(image.numpy().astype(np.float32), normalize=self.normalize)
        return img


class KATHER_LARGER:
    def __init__(self,normalize=False):
        if not Path(dataset_dir + '/Kather_texture_2016_larger_images_10').is_dir():
            url = 'https://zenodo.org/records/53169/files/Kather_texture_2016_larger_images_10.zip'
            Path(dataset_dir).mkdir(parents=True, exist_ok=True)
            filename = wget.download(url, out=dataset_dir)

            with zipfile.ZipFile(filename, 'r') as zip_ref:
                zip_ref.extractall(dataset_dir)

            os.remove(filename)
        self.dataset_dir = dataset_dir + '/Kather_texture_2016_larger_images_10/'
        self.files = os.listdir(self.dataset_dir)
        self.normalize = normalize

    def get_size(self):
        return len(self.files)

    def image(self, i=0):
        image = Image.open(self.dataset_dir + self.files[i])
        image = np.asarray(image)
        return rgb2gray(image.astype(np.float32), normalize=self.normalize)


class MAST:
    def __init__(self):
        print(Path(dataset_dir + '/MAST').is_dir(), dataset_dir + '/MAST')
        if not Path(dataset_dir + '/MAST').is_dir():
            _ = subprocess.run(['bash', '-x', 'supplementary/MAST.sh'])

        self.files = []
        for path, subdirs, files in os.walk(dataset_dir + '/MAST'):
            for name in files:
                if name.endswith(".fits"):
                    self.files.append(os.path.join(path, name))

    def get_size(self):
        return len(self.files)

    def image(self, i=0):
        try:
            img = fits.open(self.files[i])['SCI'].data
        except:
            img = fits.open(self.files[i])['PRIMARY'].data

        return img.astype(np.float32)

if __name__ == "__main__":
    datasets = datasets()

    for k,v in datasets.items():
        n = v.get_size()
        shape = v.image(0).shape
        print('Dataset name:', k, '--- n.of images:', n, ', shape:', shape)
    