from setuptools import setup, Extension

setup(
    name='pixhomology',
    version='0.0.1',
    ext_modules=[Extension('pixhomology', ['pixhomology/pixhom.c'], extra_compile_args=['-std=c99'])],
    packages=['pixhomology'],
)
