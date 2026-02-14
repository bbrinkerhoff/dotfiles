import sublime
import sublime_plugin
import re

class ReplaceEscapedWhitespaceCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # Get the entire text of the current view
        text = self.view.substr(sublime.Region(0, self.view.size()))

        # Define a regular expression pattern to match escaped whitespace characters and hexadecimal carriage returns
        pattern = r'\\(s|t|n|r)|<0x0d>'

        # Define a function to replace the matched pattern with the literal whitespace character or carriage return
        def replace_match(match):
            if match.group(1):
                escape_char = match.group(1)
                if escape_char == 's':
                    return ' '
                elif escape_char == 't':
                    return '\t'
                elif escape_char == 'n':
                    return '\n'
                elif escape_char == 'r':
                    return '\r'
            else:
                return '\r'

        # Replace the escaped whitespace characters and hexadecimal carriage returns with their literal versions
        replaced_text = re.sub(pattern, replace_match, text)

        # Replace the entire text of the current view with the replaced text
        self.view.replace(edit, sublime.Region(0, self.view.size()), replaced_text)