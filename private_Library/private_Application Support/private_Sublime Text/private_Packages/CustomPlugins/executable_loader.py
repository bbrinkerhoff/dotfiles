import sublime_plugin
import os


def plugin_loaded():
    plugins_dir = os.path.join(os.path.dirname(__file__), "plugins")
    for filename in sorted(os.listdir(plugins_dir)):
        if filename.endswith(".py") and not filename.startswith("_"):
            sublime_plugin.reload_plugin("CustomPlugins.plugins.{}".format(filename[:-3]))