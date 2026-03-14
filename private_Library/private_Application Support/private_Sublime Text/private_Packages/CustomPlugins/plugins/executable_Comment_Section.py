import sublime
import sublime_plugin


class HashLineCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            line_region = self.view.line(region)
            line_text = self.view.substr(line_region).strip()

            if not line_text:
                continue

            # Build the formatted block
            inner = "# {} #".format(line_text)
            border = "#" * len(inner)
            formatted = "{0}\n{1}\n{0}".format(border, inner)

            self.view.replace(edit, line_region, formatted)