from setuptools import setup, Extension
from Cython.Build import cythonize
import numpy


def build_extension_from_pyx(file):
    name = '.'.join(["amphisbaena"] + file[:-4].split('/')[1:])
    return Extension(name=name,
                     sources=[file],
                     define_macros=[
                         ('NPY_NO_DEPRECATED_API', 'NPY_1_7_API_VERSION')],
                     extra_compile_args=["-O0"],
                     extra_link_args=['-g'])


modules = [build_extension_from_pyx("src/rom/rom.pyx"),
           build_extension_from_pyx("src/rom/instruction.pyx")]

setup(name='amphisbaena',
      ext_modules=cythonize(modules,
                            compiler_directives={'language_level': "3"},
                            gdb_debug=True),
      requires=['Cython', 'numpy'],
      include_dirs=[numpy.get_include()])
