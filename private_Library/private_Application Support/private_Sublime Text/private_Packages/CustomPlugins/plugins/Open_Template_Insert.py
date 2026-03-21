import sublime_plugin


class OpenTemplateInsertCommand(sublime_plugin.TextCommand):
    def run(self, edit, text=""):
        self.view.insert(edit, 0, text)
