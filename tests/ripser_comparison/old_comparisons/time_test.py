import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
import time

import tqdm

def time_test(dataset):
    n_images = dataset.get_size()
    
    pixh_time = []
    rips_time = []
    
    for i in tqdm.tqdm(range(n_images), leave=False):
        image = dataset.image(i)
        
        start = time.time()
        dgm_rips = image.max() - lower_star_img(image.max() - image)
        rips_time.append(time.time() - start)

        start = time.time()
        dgm_pixh = ph.computePH(image.copy())
        pixh_time.append(time.time() - start)
        
    
    rips_time = np.array(rips_time)
    pixh_time = np.array(pixh_time)
    return {'rips_time': rips_time, 'pixh_time': pixh_time}

if __name__ == "__main__":
    dataset = MNIST()
    results = time_test(dataset)
    print(np.mean(results['rips_time']), np.mean(results['pixh_time']))
