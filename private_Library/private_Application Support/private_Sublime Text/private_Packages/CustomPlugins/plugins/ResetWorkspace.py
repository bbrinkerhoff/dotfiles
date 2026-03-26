import sublime
import sublime_plugin


class ResetWorkspaceCommand(sublime_plugin.WindowCommand):
    def run(self):
        self._close_views(list(self.window.views()))

    def _close_views(self, views):
        if not views:
            self.window.run_command("collapse_all_folders")
            return

        view = views.pop(0)
        self.window.focus_view(view)

        if view.is_dirty():
            # Prompt to save; close_file handles the dialog
            self.window.run_command("close_file")
            # Wait for the dialog to resolve before continuing
            sublime.set_timeout(lambda: self._close_views(views), 100)
        else:
            view.close()
            self._close_views(views)

    def is_enabled(self):
        return bool(self.window.views())
