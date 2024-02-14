import numpy as np
import pixhomology as ph
from ripser import lower_star_img
from datasets import datasets
from persim import bottleneck
import tracemalloc
import time
import tqdm
import gc


def results_test(dataset, dataset_name='', idx=0):
    gc.collect()

    n_images = dataset.get_size()

    pixh_time = []
    rips_time = []

    pixh_mem = []
    rips_mem = []

    error = False
    
    for i in tqdm.tqdm(range(n_images), leave=False):
        image = dataset.image(i)

        tracemalloc.start()
        start = time.time()
        dgm_rips = - lower_star_img(- image)
        rips_time.append(time.time() - start)
        rips_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
        dgm_rips[dgm_rips == -np.inf] = image.min()
        dgm_rips = dgm_rips.astype(np.float32)

        tracemalloc.start()
        start = time.time()
        dgm_pixh = ph.computePH(image)
        pixh_time.append(time.time() - start)
        pixh_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
        dgm_pixh = dgm_pixh.astype(np.float32)

        # Comparison
        if len(dgm_rips) == len(dgm_pixh):
            dgm_rips = dgm_rips[np.lexsort((dgm_rips[:,0],dgm_rips[:,1]))]
            dgm_pixh = dgm_pixh[np.lexsort((dgm_pixh[:,0],dgm_pixh[:,1]))]

            d = np.mean(np.sqrt((dgm_pixh[:,0] - dgm_rips[:,0]) ** 2 + (dgm_pixh[:,1] - dgm_rips[:,1]) ** 2))
            if d < 1e-07:
                    continue
            else: 
                print(f"ERROR: the differences beetween 2 points in the dgm is {d}!")
                error = True
                #return False
        else:
            print("ERROR: there are not the same number of points in the diagrams!")
            error = True
            #return False

    rips_time = np.array(rips_time)
    pixh_time = np.array(pixh_time)
    t = {'rips_time': rips_time, 'pixh_time': pixh_time}

    rips_mem = np.array(rips_mem)
    pixh_mem = np.array(pixh_mem)
    m = {'rips_mem': rips_mem, 'pixh_mem': pixh_mem}

    print(f'{idx}. {dataset_name}')
    print('---------')
    print(f'    a. the diagram is valid: {not error}')
    print('    b. time:')
    print('        Ripser --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(t['rips_time']),
                                                                             np.mean(t['rips_time']),
                                                                             np.max(t['rips_time'])))
    print('        PixHom --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(t['pixh_time']),
                                                                             np.mean(t['pixh_time']),
                                                                             np.max(t['pixh_time'])))
    print('    c. memory:')
    print('        Ripser --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(m['rips_mem']),
                                                                             np.mean(m['rips_mem']),
                                                                             np.max(m['rips_mem'])))
    print('        PixHom --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(m['pixh_mem']),
                                                                             np.mean(m['pixh_mem']),
                                                                             np.max(m['pixh_mem'])))
    
    print()


    
    return rips_time, pixh_time, rips_mem, pixh_mem

if __name__ == "__main__":
    data = datasets()

    for i, (dataset_name, dataset) in enumerate(data.items()):
        rips_time, pixh_time, rips_mem, pixh_mem = results_test(dataset, dataset_name, i)
        np.savez(dataset_name+'.npz',
                 rips_time=rips_time,
                 pixh_time=pixh_time,
                 rips_mem=rips_mem,
                 pixh_mem=pixh_mem)
