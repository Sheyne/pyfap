#!/usr/bin/env python

"""
setup.py file for pyfap
"""

from distutils.core import setup, Extension


fap_module = Extension('_fap_back',
					   sources=['fap_back.i'],
					   swig_opts=['-modern','-I/usr/local/include'],
					   library_dirs=['/usr/local/lib'],
					   libraries=['fap'],
					   )

setup (name = 'fap',
       version = '0.1',
       author      = "Sheyne Anderson",
       description = """Python bindings for the Finnish APRS Parser (FAP).""",
       ext_modules = [fap_module],
       py_modules = ['fap_back', "fap"],
       )