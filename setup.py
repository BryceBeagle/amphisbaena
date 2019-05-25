# Not sure why this doesn't exist in setuptools
from distutils.command.clean import clean
# noinspection PyUnresolvedReferences
from distutils import log
import logging
from pathlib import Path
import os

# setuptools import MUST be above cythonize import
from setuptools import setup
from Cython.Build import cythonize
import numpy

logging.basicConfig(level=os.environ.get("LOGLEVEL", "WARN"))


class CleanCommand(clean):
    """Removes Cython build files (e.g. .so and .c files)"""

    def run(self):
        super().run()

        for ext in [".so", ".c", ".html"]:
            files = Path("amphisbaena").glob(f"**/*{ext}")
            if files:
                log.info(f"removing {ext} build files")
                self._remove_glob(files)

    @staticmethod
    def _remove_glob(files):
        for file in files:
            log.debug(f"removing {file}")
            os.remove(file)


setup(name='amphisbaena',
      packages=["amphisbaena",
                "amphisbaena.instruction",
                "amphisbaena.rom"],
      ext_modules=cythonize("**/*.pyx",
                            compiler_directives={'language_level': "3"},
                            gdb_debug=True, annotate=True),
      requires=['Cython', 'numpy'],
      include_dirs=['.', numpy.get_include()],
      zip_safe=False,
      cmdclass={
          'clean': CleanCommand
      })
