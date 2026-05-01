import GPS
from os.path import *
import sys
import glob
import importlib


def initialize_project_plugin():
    gnatstudio = join(dirname(dirname(GPS.Project.root().file().name())),
                      "gnatstudio")

    plugin_dir = join(gnatstudio, "plug-ins")
    lib = join(gnatstudio, "lib")

    sys.path.insert(0, plugin_dir)
    sys.path.insert(0, lib)
    plugins = glob.glob(join(plugin_dir, "*.py"))
    plugins.sort()
    for plugin in plugins:
        print(f"loading: {plugin}.")
        name = splitext(basename(plugin))[0]
        importlib.import_module(name)


def finalize_project_plugin():
    pass
