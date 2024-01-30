import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
import tracemalloc

import tqdm


def memory_test(dataset):
    n_images = dataset.get_size()
    ours_mem = []
    rips_mem = []
    
    for i in tqdm.tqdm(range(n_images)):
        image = dataset.image(i)
        
        tracemalloc.start()
        dgm_rips = image.max() - lower_star_img(image.max() - image)
        rips_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
    
        tracemalloc.start()
        dgm_ours = ph.calculatePH(image.copy())
        ours_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
    
    rips_mem = np.array(rips_mem)
    ours_mem = np.array(ours_mem)
    return {'rips_mem': rips_mem, 'ours_mem': ours_mem}



if __name__ == "__main__":
    dataset = MNIST()
    results = memory_test(dataset)
    print(np.mean(results['rips_mem']), np.mean(results['ours_mem']))
    