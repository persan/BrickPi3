import GPS
from os.path import *
import sys
import glob
import importlib

def initialize_project_plugin():
    GPS.Project.load("test/brickpi3-test.gpr")

def finalize_project_plugin():
    pass
