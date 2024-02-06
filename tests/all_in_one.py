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
        dgm_rips = image.max() - lower_star_img(image.max() - image)
        rips_time.append(time.time() - start)
        rips_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
        dgm_rips[dgm_rips == -np.inf] = image.min()
        dgm_rips = dgm_rips.astype(np.float32)

        tracemalloc.start()
        start = time.time()
        dgm_pixh = ph.calculatePH(image.copy())
        pixh_time.append(time.time() - start)
        pixh_mem.append(tracemalloc.get_traced_memory()[1])
        tracemalloc.stop()
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