import pixhomology as ph
import numpy as np

import matplotlib.pyplot as plt

from ripser import lower_star_img
import tqdm
import time

from memory_profiler import memory_usage
import tracemalloc

# dataset
from tensorflow.keras import datasets
(x_train, y_train), (x_test, y_test) = datasets.mnist.load_data()
MNIST = x_train

def rgb2gray(rgb):
    r, g, b = rgb[:,:,0], rgb[:,:,1], rgb[:,:,2]
    gray = 0.2989 * r + 0.5870 * g + 0.1140 * b

    #gray -= gray.min()
    #gray /= gray.max()
    #gray *= 255.0

    #gray = gray.astype(np.int32)
    
    return gray



input_array_multi_dim = np.load('test.npy')#MNIST[0].astype(np.float32) #np.random.normal(0,1,(100,100))

#plt.imshow(input_array_multi_dim)
#plt.show()
#print("Input multi-dimensional array:\n", input_array_multi_dim)

rips_time = 0
out_time = 0



for i in tqdm.tqdm(range(len(MNIST))):
    input_array_multi_dim = (MNIST[30]).astype(np.float32)
    #print(input_array_multi_dim)

    #tracemalloc.start()
    ## Your code
    #result_array_multi_dim =  ph.calculatePH(input_array_multi_dim.astype(np.float32))
    #print(tracemalloc.get_traced_memory())
    #tracemalloc.stop()

    #tracemalloc.start()
    ## Your code
    #result_array_multi_dim =  255-lower_star_img(255-input_array_multi_dim.astype(np.float32))
    #print(tracemalloc.get_traced_memory())
    #tracemalloc.stop()
    
    s = time.time()
    result_array_multi_dim =  ph.calculatePH(input_array_multi_dim.astype(np.float32))
    e = time.time()
    #print("Squared multi-dimensional array:\n", result_array_multi_dim)
    print(result_array_multi_dim)

    #mem_usage = memory_usage((ph.calculatePH, (input_array_multi_dim.astype(np.float32),)), interval=.01)
    #print('Memory usage (in chunks of .1 seconds): %s' % mem_usage)
    
    out_time += (e-s)

    

    s = time.time()
    result_array_multi_dim =  255-lower_star_img(255-input_array_multi_dim.astype(np.float32))
    e = time.time()

    print(result_array_multi_dim)
    #mem_usage = memory_usage((lower_star_img, (255-input_array_multi_dim.astype(np.float32),)), interval=.01)
    #print('Memory usage (in chunks of .1 seconds): %s' % mem_usage)
    rips_time += (e-s)

    
    break


print(out_time / i, rips_time/i)



#print(result_array_multi_dim.min(), result_array_multi_dim.max())

#plt.imshow(result_array_multi_dim * (input_array_multi_dim > 0))
#plt.show()