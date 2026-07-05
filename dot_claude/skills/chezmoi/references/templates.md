# Chezmoi Template Reference

Templates use Go's `text/template` syntax with chezmoi's additions. The `.tmpl` suffix
on a file tells chezmoi to process it as a template before writing to the target.

## Common conditionals

```
{{- if eq .chezmoi.os "darwin" -}}
# Mac only
{{- else if eq .chezmoi.os "windows" -}}
# Windows only
{{- else if eq .chezmoi.os "linux" -}}
# Linux (including WSL)
{{- end -}}
```

The `-` trims whitespace/newlines adjacent to the delimiter — use it to avoid blank
lines in output when a block produces no content.

## WSL detection

```
{{- if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") -}}
# WSL only
{{- end -}}
```

## Inserting data variables

```
name = {{ .fullName }}
email = {{ .email }}
```

Always use `{{ }}` (not `{{- -}}`) when the value should appear inline in the output.

## 1Password secret injection

```
password = {{ onepasswordRead "op://Personal/item-name/field-name" }}
```

Or for structured items:
```
{{ with onepassword "Personal" "item-name" }}
token = {{ .fields | first | .value }}
{{ end }}
```

The vault name (`Personal`, `Employee`, etc.) must match exactly what's in 1Password.
Use `op item list` to find the right vault and item names. Don't embed raw secrets —
always use `op://` URIs so the source stays safe in git.

## Shared templates (.chezmoitemplates)

For config blocks reused across platforms:

```
{{- template "SublimeText/User/Preferences.sublime-settings" . -}}
```

The `.` passes the full data context into the template. Template files live in
`.chezmoitemplates/` in the source root and are not applied as files themselves.

## Multiline conditional blocks

```bash
export PATH="$HOME/.local/bin:$PATH"
{{- if eq .chezmoi.os "darwin" }}
export HOMEBREW_PREFIX="/opt/homebrew"
{{- end }}
{{- if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
export WINHOME="/mnt/c/Users/{{ .chezmoi.username }}"
{{- end }}
```

## Testing templates without applying

```bash
# Test a specific template file
chezmoi execute-template < ~/.local/share/chezmoi/dot_gitconfig.tmpl

# Test an inline expression
chezmoi execute-template '{{ .chezmoi.os }}'

# See what a file would look like after templating
chezmoi cat ~/.gitconfig
```

Use `chezmoi execute-template` constantly when writing new templates — it's much faster
than the apply/check cycle.

## Run script templates

Run scripts are also templates, so they can conditionally include content:

```bash
#!/usr/bin/env bash
# run_onchange_before_06-configure-something.sh.tmpl

{{- if eq .chezmoi.os "darwin" }}
# Mac setup steps
defaults write com.apple.dock ...
{{- end }}
```

For onchange scripts that read external files, embed a hash to trigger re-runs:

```bash
# chezmoi:template:left-delimiter=# right-delimiter=!
# Hash of packages file: {{ include "packages.yaml" | sha256sum }}!
```

Or more commonly, just include the file content in the template so chezmoi detects
the change automatically:

```bash
# Packages: {{ include "packages.yaml" | sha256sum }}
```

## Symlinks with templates

```
# symlink__curlrc.tmpl
{{ .chezmoi.homeDir }}/.curlrc
```

The file content is the symlink target path. Use `.chezmoi.homeDir` instead of `~` or
`$HOME` since those aren't expanded by chezmoi's symlink handler.

## Common patterns

**Config file with platform-specific paths:**
```
{{- if eq .chezmoi.os "darwin" }}
socket = {{ .chezmoi.homeDir }}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock
{{- else if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
socket = /mnt/c/Users/{{ .chezmoi.username }}/AppData/Roaming/1Password/data/agent.sock
{{- end }}
```

**Optional block (only include if variable is set):**
```
{{- if .someOptionalVar }}
optional_setting = {{ .someOptionalVar }}
{{- end }}
```

**Iterating a list from data:**
```
{{- range .someList }}
- {{ . }}
{{- end }}
```
