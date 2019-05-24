from setuptools import setup
from Cython.Build import cythonize
import numpy

setup(name='amphisbaena',
      packages=["amphisbaena",
                "amphisbaena.instruction",
                "amphisbaena.rom"],
      ext_modules=cythonize("**/*.pyx",
                            compiler_directives={'language_level': "3"},
                            gdb_debug=True),
      requires=['Cython', 'numpy'],
      include_dirs=['.', numpy.get_include()],
      # https://stackoverflow.com/a/10618900/8134178
      zip_safe=False)
