# Chezmoi Core Reference (Offline)

Stable concepts unlikely to change between versions. Fetch chezmoi.io only for
command flags, integrations not listed here, or version-specific features.

---

## Source state attributes (filename prefixes/suffixes)

These combine in order: `{order}_{condition}_{private}_{empty}_{encrypted}_{executable}_{readonly}_{dot}_{name}{.tmpl}`

| Attribute | Prefix/Suffix | Effect |
|-----------|--------------|--------|
| `dot_` | prefix | Renames to `.name` in target |
| `private_` | prefix | Sets 0600 (file) / 0700 (dir) permissions |
| `executable_` | prefix | Sets executable bit (0755) |
| `readonly_` | prefix | Sets 0444 permissions |
| `empty_` | prefix | Creates empty file (chezmoi skips empty files by default) |
| `encrypted_` | prefix | File is encrypted (using age/gpg) |
| `symlink_` | prefix | Target is a symlink; file content = link target path |
| `once_` | prefix | Run script: execute only once |
| `onchange_` | prefix | Run script: execute when content changes |
| `always_` | prefix | Run script: execute every apply |
| `before_` | infix | Run script: execute before applying files |
| `after_` | infix | Run script: execute after applying files (default) |
| `.tmpl` | suffix | Process file as Go template before writing |

Prefixes stack left to right. Example: `private_dot_ssh/` → `~/.ssh/` with 700 perms.

## Special source files and dirs

| Path | Purpose |
|------|---------|
| `.chezmoi.toml` / `.chezmoi.yaml` | Machine-local config (not in source repo) — actually at `~/.config/chezmoi/` |
| `.chezmoidata/` | YAML/JSON/TOML files auto-merged into template data |
| `.chezmoitemplates/` | Named templates used with `{{ template "name" . }}` |
| `.chezmoiignore` | Gitignore-style patterns; matched files not managed by chezmoi |
| `.chezmoiexternal.yaml` | External files/archives fetched and managed by chezmoi |
| `.chezmoiversion` | Minimum chezmoi version required |
| `.chezmoiroot` | If present, this dir (not parent) is the source root |

## Template functions (chezmoi-specific)

Beyond standard Go template functions, chezmoi adds:

### Data access
```
{{ .chezmoi.os }}               # "darwin" / "windows" / "linux"
{{ .chezmoi.arch }}             # "amd64" / "arm64"
{{ .chezmoi.hostname }}         # machine hostname
{{ .chezmoi.username }}         # current user
{{ .chezmoi.homeDir }}          # home directory path
{{ .chezmoi.sourceDir }}        # chezmoi source dir path
{{ .chezmoi.kernel.osrelease }} # kernel version string (Linux)
```

### File inclusion
```
{{ include "relative/path/from/source" }}   # include raw file content
{{ includeTemplate "name" . }}              # include a .chezmoitemplates file
```

### Password managers
```
{{ onepasswordRead "op://vault/item/field" }}         # read a field value
{{ onepassword "vault" "item" }}                       # full item object
{{ onepasswordDocument "vault" "item" }}               # document attachment
{{ bitwarden "item" "field" }}
{{ keepassxc "entry" "attribute" }}
{{ lastpass "id" "field" }}
```

### Utilities
```
{{ joinPath .chezmoi.homeDir ".config" "foo" }}  # OS-aware path join
{{ lookPath "git" }}                              # find executable in PATH
{{ output "command" "arg1" "arg2" }}             # run command, capture stdout
{{ stat "path" }}                                 # file stat info
{{ toJson . }}                                    # serialize to JSON
{{ fromJson "string" }}                           # parse JSON
{{ toYaml . }}                                    # serialize to YAML
{{ fromYaml "string" }}                           # parse YAML
{{ sha256sum "string" }}                          # hash a string
```

### Standard Go template functions (subset most useful in chezmoi)
```
{{ if eq .x "value" }}          # equality
{{ if ne .x "value" }}          # not equal
{{ if and (cond1) (cond2) }}    # logical and
{{ if or (cond1) (cond2) }}     # logical or
{{ if not (cond) }}             # logical not
{{ range .list }}{{ . }}{{ end }} # iterate
{{ . | lower }}                 # pipe: lowercase
{{ . | upper }}                 # pipe: uppercase
{{ . | trim }}                  # pipe: trim whitespace
{{ . | contains "sub" }}        # pipe: string contains
{{ . | replace "old" "new" }}   # pipe: string replace
{{ printf "%s" .value }}        # formatted string
{{ default "fallback" .value }} # use fallback if empty
```

## .chezmoiignore

Gitignore-style patterns. Supports templates:

```
# Always ignore
*.sw?
.DS_Store

# Ignore platform-specific files on the wrong platform
{{ if ne .chezmoi.os "darwin" }}
private_Library
{{ end }}
{{ if ne .chezmoi.os "windows" }}
AppData
{{ end }}
```

## .chezmoiexternal.yaml

Pull in external files/archives that chezmoi manages but doesn't store in source:

```yaml
".vim/autoload/plug.vim":
  type: file
  url: "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

".tmux/plugins/tpm":
  type: archive
  url: "https://github.com/tmux-plugins/tpm/archive/master.tar.gz"
  stripComponents: 1
```

## Key commands

```bash
chezmoi apply                  # apply source state to home dir
chezmoi diff                   # show what apply would change
chezmoi status                 # list files that differ
chezmoi add <file>             # add file to source state
chezmoi add --template <file>  # add as template
chezmoi forget <file>          # stop managing a file (don't delete target)
chezmoi destroy <file>         # stop managing + delete target
chezmoi re-add                 # update source from current target state
chezmoi execute-template       # test template from stdin
chezmoi cat <file>             # show rendered template for target file
chezmoi source-path <file>     # show source path for a target file
chezmoi doctor                 # diagnose config issues
chezmoi data                   # dump all template data as JSON
chezmoi git -- <args>          # run git in source dir
chezmoi cd                     # open shell in source dir
chezmoi merge <file>           # 3-way merge target with source
```

## run_onchange_ script hash tracking

chezmoi tracks run_onchange_ scripts by the SHA256 of their rendered content (after
template processing). To force a re-run when an external data file changes, embed a
hash of that file in the script body:

```bash
# Packages hash: {{ include ".chezmoidata/packages.yaml" | sha256sum }}
```

This makes the rendered script content change when packages.yaml changes, triggering a re-run.

## Whitespace control in templates

The `-` trims all adjacent whitespace (including newlines):
```
{{- if condition -}}   # trims whitespace before AND after
{{- end -}}
```

Without `-`, blank lines appear in output for blocks that produce no content.
Use `-` on conditional blocks that wrap whole lines to avoid blank lines in output.

## What to fetch online vs use offline

**Use this file (offline) for:**
- Naming conventions and prefixes
- Template function signatures
- Command reference
- `.chezmoiignore` / `.chezmoiexternal` syntax
- Whitespace control

**Fetch chezmoi.io for:**
- Full command flag reference (`chezmoi add --help` also works)
- Specific integrations (Bitwarden, KeePass, etc.)
- `chezmoi upgrade` / version-specific changes
- `.chezmoiexternal` with complex archive options
- Anything not found in this file
