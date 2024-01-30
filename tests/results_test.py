import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K

import tqdm

def trunc(values, decs=0):
    return np.trunc(values*10**decs)/(10**decs)

dataset = MNIST()
n_images = dataset.get_size()

for i in tqdm.tqdm(range(n_images)):
    image = dataset.image(i)
    
    dgm_rips = image.max() - lower_star_img(image.max() - image)
    dgm_rips[dgm_rips == -np.inf] = image.min()
    dgm_rips = trunc(dgm_rips.astype(np.float32),3)
    dgm_ours = ph.calculatePH(image.copy())
    dgm_ours = trunc(dgm_ours.astype(np.float32),3)

    if ((dgm_ours[None,:,:] == dgm_rips[:,None,:]).all(axis=2).sum(axis=0) > 0).sum() == len(dgm_rips) and len(dgm_rips) == len(dgm_ours):
        continue
    else:
        print(len(dgm_rips) - len(dgm_ours))
        print(dgm_rips) 
        print(dgm_ours)

        print(((dgm_ours[None,:,:] == dgm_rips[:,None,:]).all(axis=2).sum(axis=0) > 0).sum())
        print(len(dgm_rips))
        break

#print(dgm_rips, dgm_ours)
