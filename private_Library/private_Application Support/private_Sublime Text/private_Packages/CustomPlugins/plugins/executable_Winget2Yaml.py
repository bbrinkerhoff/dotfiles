import sublime
import sublime_plugin
import re


class WingetToYamlCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sel = self.view.sel()
        selected_text = self.view.substr(sel[0]).strip() if sel else ""

        if selected_text:
            text = selected_text
        else:
            text = sublime.get_clipboard().strip()

        commands = [c.strip() for c in re.split(r'[;\n]+', text) if c.strip()]
        package_ids = []

        for cmd in commands:
            match = re.search(r'--id\s+(\S+)', cmd)
            if match:
                package_ids.append(match.group(1))

        if not package_ids:
            sublime.error_message("No package IDs found. Expected format:\nwinget install -e --id Some.Package")
            return

        settings = self.view.settings()
        if settings.get("translate_tabs_to_spaces"):
            indent = " " * settings.get("tab_size", 4)
        else:
            indent = "\t"

        yaml_output = "\n".join(indent + "- " + pkg_id for pkg_id in package_ids)

        self.view.replace(edit, sel[0], yaml_output)
