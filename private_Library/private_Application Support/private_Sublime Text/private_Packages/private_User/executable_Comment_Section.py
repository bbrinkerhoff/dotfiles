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
            inner = f"# {line_text} #"
            border = "#" * len(inner)
            formatted = f"{border}\n{inner}\n{border}"

            self.view.replace(edit, line_region, formatted)