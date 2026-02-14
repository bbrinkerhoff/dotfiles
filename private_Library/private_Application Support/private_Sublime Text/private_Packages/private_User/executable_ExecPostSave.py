import sublime
from sublime import Region
import sublime_plugin
from sublime_plugin import EventListener
from sublime_plugin import TextCommand
import os
import re
import platform
import subprocess


class PostSaveAddExecCmd(EventListener):
  def on_post_save(self, view):
    file_name = view.file_name()
    current_syntax = view.settings().get("syntax")
    if ("Bash.sublime-syntax" in current_syntax or "Python.sublime-syntax" in current_syntax):
         view.run_command('add_exec_to_file')

class AddExecToFileCommand(TextCommand):
  def add_permissions(self, view):
    # Only run on Linux or macOS
    if platform.system() not in ("Linux", "Darwin"):
      return
    
    file_name = view.file_name()
    if file_name and file_name != '' and os.path.isfile(file_name) == True:
      cmd = ["chmod", "+x", file_name]
      p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      full_text, err = p.communicate()
    
  def run(self, view):
      self.add_permissions(self.view)