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
from Cython.Distutils.build_ext import build_ext

logging.basicConfig(level=os.environ.get("LOGLEVEL", "WARN"))


class CleanCommand(clean):
    """Removes Cython build files (e.g. .so and .c files)"""

    def run(self):
        super().run()

        for ext in [".so", ".c", ".h", ".html"]:
            files = Path("amphisbaena").glob(f"**/*{ext}")
            if files:
                log.info(f"removing {ext} build files")
                self._remove_glob(files)

    @staticmethod
    def _remove_glob(files):
        for file in files:
            log.debug(f"removing {file}")
            os.remove(file)


class BuildExtCommand(build_ext):
    """This exists so that `setup.py clean` can be run even if the cython does
    not build

    cythonize() is called only when `build_ext` is actually used
    """

    def __init__(self, dist):
        dist.ext_modules = cythonize(
            "**/*.pyx",
            compiler_directives={'language_level': "3"},
            gdb_debug=True,
            annotate=True)

        super().__init__(dist)


setup(name='amphisbaena',
      ext_modules=[],
      requires=['Cython'],
      tests_require=["pytest"],
      zip_safe=False,
      cmdclass={
          'build_ext': BuildExtCommand,
          'clean': CleanCommand
      })
