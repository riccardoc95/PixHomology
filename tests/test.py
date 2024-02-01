import numpy as np
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
from results_test import results_test
from memory_test import memory_test
from time_test import time_test
import gc


data = {
    'MNIST': MNIST(),
    'CIFAR10': CIFAR10(),
    'IMAGENET_A': IMAGENET_A(),
    'DIV2K': DIV2K()
}

for i, (dataset_name, dataset) in enumerate(data.items()):
    print(f'{i}. {dataset_name}')
    print('---------')
    result = results_test(dataset)
    print(f'    a. the diagram is valid: {result}')
    time = time_test(dataset)
    print('    b. time:')
    print('        Ripser --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(time['rips_time']),
                                                                             np.mean(time['rips_time']),
                                                                             np.max(time['rips_time'])))
    print('        PixHom --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(time['pixh_time']),
                                                                             np.mean(time['pixh_time']),
                                                                             np.max(time['pixh_time'])))
    memory = memory_test(dataset)
    print('    c. memory:')
    print('        Ripser --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(memory['rips_mem']),
                                                                             np.mean(memory['rips_mem']),
                                                                             np.max(memory['rips_mem'])))
    print('        PixHom --- min:{:.4f}, mean: {:.4f}, max: {:.4f}'.format(np.min(memory['pixh_mem']),
                                                                             np.mean(memory['pixh_mem']),
                                                                             np.max(memory['pixh_mem'])))
    
    
    print()
    gc.collect()

