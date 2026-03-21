"""
Open Template — Sublime Text Plugin
Opens a template from Packages/User/Templates/ into a new file.

Flow:
  1. Quick panel: pick a template type (subdirectory, or "General" for root-level templates)
  2. Quick panel: pick a template within that directory
  3. Opens the template body in a new view with syntax auto-detected from default_file_extension

Template format (.sublime-template):
  Optional metadata lines at the top (key=value), e.g.:
    default_output_directory=C:\path\to\dir
    default_file_extension=.ahk
  Blank line separating metadata from body.
  Everything after the blank line is the template body.
"""

import os
import sublime
import sublime_plugin


TEMPLATES_DIR = os.path.join(sublime.packages_path(), "User", "Templates")
TEMPLATE_EXT = ".sublime-template"
ROOT_LABEL = "General"


def _template_files_in(directory):
    """Return sorted list of (display_name, abs_path) for .sublime-template files directly in directory."""
    results = []
    try:
        for fname in os.listdir(directory):
            if fname.endswith(TEMPLATE_EXT):
                abs_path = os.path.join(directory, fname)
                if os.path.isfile(abs_path):
                    display = os.path.splitext(fname)[0]
                    results.append((display, abs_path))
    except OSError:
        pass
    results.sort(key=lambda t: t[0].lower())
    return results


def _subdirs_with_templates(directory):
    """Return sorted list of subdir names that contain at least one .sublime-template file."""
    results = []
    try:
        for name in os.listdir(directory):
            path = os.path.join(directory, name)
            if os.path.isdir(path) and _template_files_in(path):
                results.append(name)
    except OSError:
        pass
    results.sort(key=str.lower)
    return results


def _parse_template(abs_path):
    """
    Parse a .sublime-template file.
    Returns (metadata_dict, body_str).
    """
    with open(abs_path, "r", encoding="utf-8") as f:
        raw = f.read()

    lines = raw.splitlines(keepends=True)
    meta = {}
    body_start = 0

    for i, line in enumerate(lines):
        stripped = line.rstrip("\r\n")
        if stripped == "":
            body_start = i + 1
            break
        if "=" in stripped:
            key, _, value = stripped.partition("=")
            meta[key.strip()] = value.strip()
        else:
            body_start = 0
            meta = {}
            break

    body = "".join(lines[body_start:])
    return meta, body


def _syntax_for_extension(ext):
    if not ext:
        return None
    if hasattr(sublime, "find_syntax_for_file"):
        syntax = sublime.find_syntax_for_file("file" + ext)
        if syntax:
            return syntax.path
    return None


class OpenTemplateCommand(sublime_plugin.WindowCommand):

    def run(self):
        if not os.path.isdir(TEMPLATES_DIR):
            sublime.error_message("Templates directory not found:\n" + TEMPLATES_DIR)
            return

        subdirs = _subdirs_with_templates(TEMPLATES_DIR)
        root_templates = _template_files_in(TEMPLATES_DIR)

        # Build type list: subdirs first, then "General" if root templates exist
        self._types = []  # list of (label, directory_path)
        for name in subdirs:
            self._types.append((name, os.path.join(TEMPLATES_DIR, name)))
        if root_templates:
            self._types.append((ROOT_LABEL, TEMPLATES_DIR))

        if not self._types:
            sublime.error_message("No templates found in:\n" + TEMPLATES_DIR)
            return

        if len(self._types) == 1:
            # Only one type — skip the type picker
            self._on_type_selected(0)
        else:
            labels = [t[0] for t in self._types]
            self.window.show_quick_panel(labels, self._on_type_selected)

    def _on_type_selected(self, index):
        if index == -1:
            return

        _label, directory = self._types[index]
        self._templates = _template_files_in(directory)

        if not self._templates:
            sublime.error_message("No templates found.")
            return

        names = [t[0] for t in self._templates]
        self.window.show_quick_panel(names, self._on_template_selected)

    def _on_template_selected(self, index):
        if index == -1:
            return

        _name, abs_path = self._templates[index]
        meta, body = _parse_template(abs_path)

        view = self.window.new_file()

        ext = meta.get("default_file_extension", "")
        syntax_path = _syntax_for_extension(ext)
        if syntax_path:
            view.assign_syntax(syntax_path)

        view.run_command("open_template_insert", {"text": body})
