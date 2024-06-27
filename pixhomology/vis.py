import numpy as np
import matplotlib.pyplot as plt

def plot_dgm(dgm):
    if not isinstance(dgm, np.ndarray) or dgm.shape[1] != 2:
        raise ValueError("Input must be a numpy array with shape (n, 2)")
    
    birth = dgm[:, 0]
    death = dgm[:, 1]
    
    plt.figure(figsize=(8, 8))
    plt.scatter(birth, death, c='blue', marker='o')
    
    # Adding the diagonal
    max_val = max(np.max(birth), np.max(death))
    plt.plot([0, max_val], [0, max_val], 'k--', lw=1)
    
    plt.xlabel('Birth')
    plt.ylabel('Death')
    plt.title('Persistence Diagram')
    plt.grid(True)
    plt.show()

def plot_img(img, dgm_idxs=None):
    if dgm_idxs is None:
        plt.imshow(img)
        plt.show()
    else:
        plt.imshow(img)
        plt.show()
