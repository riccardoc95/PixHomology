import numpy as np
import ctypes
import copy
import sys
from pathlib import Path

# Define the Result structure in Python
class Result(ctypes.Structure):
    _fields_ = [("data", ctypes.POINTER(ctypes.c_double)),
                ("posix", ctypes.POINTER(ctypes.c_int)),
                ("length", ctypes.c_int)]

# Load shared library
path = Path(__file__).parent.parent
name = "pixhom"
if sys.platform.startswith("win"):
    name = f"{name}.dll"
elif sys.platform.startswith("linux"):
    name = f"lib{name}.so"
elif sys.platform.startswith("darwin"):
    name = f"lib{name}.dylib"
else:
    raise ImportError(f"Your OS is not supported: {sys.platform}")

# C library
pixhom = ctypes.CDLL(str(path / name))

# ComputePH function
pixhom.computePH.argtypes = [np.ctypeslib.ndpointer(dtype=np.float64, ndim=2, flags='C_CONTIGUOUS'),
                               ctypes.c_int,
                               ctypes.c_int]
pixhom.computePH.restype = Result

pixhom.freemem.argtypes = None
pixhom.freemem.restype = None


# Define Python Wrapper
def computePH(arr, return_index=False):
    # Check if the input is a NumPy array
    if not isinstance(arr, np.ndarray):
        raise TypeError("Input must be a NumPy array")

    # Check if the array is 2-dimensional
    if arr.ndim != 2:
        raise ValueError("Input array must be 2-dimensional")

    # Get the size of the array
    num_rows, num_cols = arr.shape

    # Check if the array is 2-dimensional
    if num_rows < 3 or num_cols < 3:
        raise ValueError("The input array must have both dimensions of length greater than 3")

    # Call the C function
    result_struct = pixhom.computePH(arr.astype(np.float64), num_rows, num_cols)
    dgm = np.ctypeslib.as_array(result_struct.data, shape=(int(result_struct.length/2), 2))
    dgm_pos = np.ctypeslib.as_array(result_struct.posix, shape=(int(result_struct.length/2), 2))


    if return_index:
        xb = dgm_pos[:, 0] % num_cols
        yb = dgm_pos[:, 0] // num_cols
        xd = dgm_pos[:, 1] % num_cols
        yd = dgm_pos[:, 1] // num_cols
        result = (dgm, 
                  np.concatenate([
                      xb.reshape(-1,1), 
                      yb.reshape(-1,1), 
                      xd.reshape(-1,1), 
                      yd.reshape(-1,1)], axis=1)
                 )
    else:
        result = dgm

    result = copy.deepcopy(result)
   
    # free mem
    pixhom.freemem()
    del result_struct
    del dgm
    del dgm_pos
   
    return result
    
