import numpy as np
from datasets import MNIST, CIFAR10, IMAGENET_A, DIV2K
from memory_test import memory_test
from time_test import time_test


# Dataset small
dataset = MNIST()
dataset_name = "MNIST"
print(dataset_name)
print('---------')
results_memory = memory_test(dataset)
print('    memory:', np.mean(results_memory['rips_mem']), np.mean(results_memory['ours_mem']))
results_time = time_test(dataset)
print('    time:',np.mean(results_time['rips_time']), np.mean(results_time['ours_time']))

print()

dataset = CIFAR10()
dataset_name = "CIFAR10"
print(dataset_name)
print('---------')
results_memory = memory_test(dataset)
print('    memory:', np.mean(results_memory['rips_mem']), np.mean(results_memory['ours_mem']))
results_time = time_test(dataset)
print('    time:',np.mean(results_time['rips_time']), np.mean(results_time['ours_time']))

print()

# Dataset medium
dataset = IMAGENET_A()
dataset_name = "IMAGENET_A"
print(dataset_name)
print('---------')
results_memory = memory_test(dataset)
print('    memory:', np.mean(results_memory['rips_mem']), np.mean(results_memory['ours_mem']))
results_time = time_test(dataset)
print('    time:',np.mean(results_time['rips_time']), np.mean(results_time['ours_time']))
print()

# Dataset large
dataset = DIV2K()
dataset_name = "DIV2K"
print(dataset_name)
print('---------')
results_memory = memory_test(dataset)
print('    memory:', np.mean(results_memory['rips_mem']), np.mean(results_memory['ours_mem']))
results_time = time_test(dataset)
print('    time:',np.mean(results_time['rips_time']), np.mean(results_time['ours_time']))

