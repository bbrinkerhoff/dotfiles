#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sublime
import sublime_plugin

class MinimapSetting(sublime_plugin.EventListener):
  def on_activated(self, view):
    show_minimap = view.settings().get("show_minimap")
    if show_minimap is not None:
      if show_minimap is True:
        view.window().set_minimap_visible(True)
      elif show_minimap is False:
        view.window().set_minimap_visible(False)
      else:
        raise ValueError(f"show_minimap must be true or false, got: {show_minimap!r}")