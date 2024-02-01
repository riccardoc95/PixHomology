import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
import tracemalloc

import tqdm


def memory_test(dataset):
    n_images = dataset.get_size()
    pixh_mem = []
    rips_mem = []
    
    for i in tqdm.tqdm(range(n_images), leave=False):
        image = dataset.image(i)
        
        tracemalloc.start()
        dgm_rips = image.max() - lower_star_img(image.max() - image)
        rips_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
    
        tracemalloc.start()
        dgm_pixh = ph.calculatePH(image.copy())
        pixh_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
    
    rips_mem = np.array(rips_mem)
    pixh_mem = np.array(pixh_mem)
    return {'rips_mem': rips_mem, 'pixh_mem': pixh_mem}



if __name__ == "__main__":
    dataset = DIV2K()
    results = memory_test(dataset)
    print(np.mean(results['rips_mem']), np.mean(results['pixh_mem']))
    