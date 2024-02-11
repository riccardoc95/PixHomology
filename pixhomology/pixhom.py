import numpy as np
import ctypes
from pathlib import Path

# Define the Result structure in Python
class Result(ctypes.Structure):
    _fields_ = [("data", ctypes.POINTER(ctypes.c_double)),
                ("length", ctypes.c_int)]

# Define the C PixHomology function
pixhom = np.ctypeslib.load_library('pixhomology', Path(__file__).parent.parent)

pixhom.calculatePH.argtypes = [np.ctypeslib.ndpointer(dtype=np.float64, ndim=2, flags='C_CONTIGUOUS'),
                               ctypes.c_int,
                               ctypes.c_int]
pixhom.calculatePH.restype = Result


# Define Python Wrapper
def calculatePH(arr):
    # Check if the input is a NumPy array
    if not isinstance(arr, np.ndarray):
        raise TypeError("Input must be a NumPy array")

    # Check if the array is 2-dimensional
    if arr.ndim != 2:
        raise ValueError("Input array must be 2-dimensional")

    # Check if the array is float32
    # if arr.dtype != np.float32:
    #     raise ValueError("Input array must have dtype 'float32'")

    # Get the size of the array
    num_rows, num_cols = arr.shape

    # Call the C function
    result_struct = pixhom.calculatePH(arr.astype(np.float64), num_rows, num_cols)
    result = np.ctypeslib.as_array(result_struct.data, shape=(int(result_struct.length/2), 2))

    return result
