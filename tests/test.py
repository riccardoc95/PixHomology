import numpy as np
import pixhomology as ph


if __name__ == "__main__":
    img = np.random.rand(100,100).astype(np.float32)
    dgm = ph.calculatePH(img)
    print(dgm)
