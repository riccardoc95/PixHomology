from setuptools import setup, Extension, find_packages

module = Extension('pixhomology',
                   sources = ['pixhomology/pixhom_20240131.c'],
                   extra_compile_args=['-std=c99'])

    
setup(
    name="pixhomology", 
    version="0.0.1",
    author="",
    author_email="",
    description="",
    long_description="",
    long_description_content_type="text/markdown",
    packages=find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.10',
    install_requires=[
        'numpy'],
    ext_modules=[module],     
)