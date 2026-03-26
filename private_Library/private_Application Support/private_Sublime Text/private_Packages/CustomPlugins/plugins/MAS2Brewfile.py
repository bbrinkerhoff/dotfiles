import sublime
import sublime_plugin
import re

class FormatMasToBrewfileCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for region in self.view.sel():
            # Expand to full line if nothing is selected
            if region.empty():
                region = self.view.line(region)
            text = self.view.substr(region)
            match = re.match(r'(\d+)\s{2,}(.+?)\s+\(\d+[\d.]*\)', text.strip())
            if match:
                app_id, name = match.group(1), match.group(2)
                result = 'mas "{name}", id: {app_id}'.format
                self.view.replace(edit, region, result)