import sublime
import sublime_plugin
import json
import os


def get_session_path():
    return os.path.join(
        os.path.expanduser("~"),
        "Library", "Application Support", "Sublime Text", "Local", "Session.sublime_session"
    )


def load_recent_workspaces():
    session_path = get_session_path()
    if not os.path.exists(session_path):
        return [] 
    try:
        with open(session_path, "r", encoding="utf-8") as f:
            session = json.load(f)
        return session.get("workspaces", {}).get("recent_workspaces", [])
    except Exception:
        return []


def workspace_to_project(workspace_path):
    """Return the .sublime-project path for a given .sublime-workspace path."""
    if workspace_path.endswith(".sublime-workspace"):
        project_path = workspace_path.replace(".sublime-workspace", ".sublime-project")
        if os.path.exists(project_path):
            return project_path
    return None


class OpenRecentProjectCommand(sublime_plugin.ApplicationCommand):
    def run(self):
        self.workspaces = load_recent_workspaces()

        if not self.workspaces:
            sublime.message_dialog("No recent projects found.")
            return

        # Build display list: show project name and folder
        self.items = []
        for ws in self.workspaces:
            name = os.path.splitext(os.path.basename(ws))[0]
            folder = os.path.dirname(ws)
            # Shorten home directory for display
            folder = folder.replace(os.path.expanduser("~"), "~")
            self.items.append([name, folder])

        sublime.active_window().show_quick_panel(
            self.items,
            self.on_select,
            flags=sublime.KEEP_OPEN_ON_FOCUS_LOST,
            placeholder="Open recent project..."
        )

    def on_select(self, index):
        if index == -1:
            return
        workspace_path = self.workspaces[index]
        project_path = workspace_to_project(workspace_path)

        if project_path:
            # Open the project file (Sublime will use the workspace automatically)
            sublime.active_window().run_command(
                "open_project_or_workspace", {"file": project_path}
            )
        elif os.path.exists(workspace_path):
            # Fall back to opening the workspace directly
            sublime.active_window().run_command(
                "open_project_or_workspace", {"file": workspace_path}
            )
        else:
            sublime.error_message("Project not found:\n{}".format(workspace_path))
