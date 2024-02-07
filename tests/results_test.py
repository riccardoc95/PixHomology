import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
from persim import bottleneck

import tqdm


def results_test(dataset):
    n_images = dataset.get_size()
    
    for i in tqdm.tqdm(range(n_images), leave=False):
        image = dataset.image(i)
    
        
        dgm_rips = - lower_star_img(- image)
        dgm_rips[dgm_rips == -np.inf] = image.min()
        dgm_rips = dgm_rips.astype(np.float32)
    
        dgm_pixh = ph.calculatePH(image.copy())
        dgm_pixh = dgm_pixh.astype(np.float32)

        dgm_rips = np.around(dgm_rips, 4)
        dgm_pixh = np.around(dgm_pixh, 4)
    
        dgm_rips = sorted([tuple(dgm_rips[i]) for i in range(len(dgm_rips))])
        dgm_pixh = sorted([tuple(dgm_pixh[i]) for i in range(len(dgm_pixh))])

        # Experimental Comparison
        # For large dgms the bottleneck distance may take a long time 
        # or require a lot of memory. We propose this alternative comparison. 
        # ATTENTION: the distance d could be incorrect due to approximations!
        if len(dgm_rips) == len(dgm_pixh):
            for i in range(len(dgm_rips)):
                p1 = dgm_rips[i]
                p2 = dgm_pixh[i]
    
                d = np.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2)
                if d < 1e-04:
                    continue
                else:
                    d_max = d
                    for j in range(len(dgm_pixh)):
                        p2 = dgm_pixh[j]
                        d = np.sqrt((p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2)
                        if d < d_max:
                            d_max = d
                    if d_max < 1e-04:
                        continue
                    else:
                        print(f"ERROR: the differences beetween 2 points in the dgm is {d}!")
                        return False
        else:
            print("ERROR: there are not the same number of points in the diagrams!")
            return False
    return True

if __name__ == "__main__":
    dataset = MNIST()
    results = results_test(dataset)
