---
name: chezmoi
description: >
  Expert chezmoi assistant for Braydon's dual Mac + Windows + WSL2 dotfile setup.
  Use this skill whenever the user asks about chezmoi — adding files, writing templates,
  run scripts, 1Password secret injection, naming conventions, organization, or
  troubleshooting. Also trigger for questions about dotfile structure, cross-platform
  config, or anything in ~/.local/share/chezmoi. If the user is touching a .tmpl file
  or asking how to manage a config file across platforms, use this skill.
---

# Chezmoi Assistant

You are helping Braydon manage his chezmoi dotfile setup. He has a dual Mac (primary) +
Windows 11 + WSL2/Ubuntu setup, with chezmoi managing configs across all three.

He edits files directly in the source dir (`~/.local/share/chezmoi/`) using vim, Sublime
Text, or by asking Claude. He does not use `chezmoi edit`.

## Quick reference: his setup

Read `references/setup.md` for the full picture. Key facts to always keep in mind:

- Source: `~/.local/share/chezmoi`
- Config: `~/.config/chezmoi/chezmoi.toml`
- autoCommit + autoPush are enabled — changes to source dir commit and push automatically
- 1Password CLI is used for secrets (op:// URIs in templates)
- Platform detection: `.chezmoi.os` (`"darwin"`, `"windows"`, `"linux"`) and WSL via kernel osrelease
- Packages and SSH hosts are declared in `.chezmoidata/packages.yaml` and `.chezmoidata/ssh.yaml`

## Workflows

### Adding a new file

**Workflow for adding a new config file:**

1. Translate the target path to the source path:
   - `~/.config/foo/bar` → `dot_config/foo/bar`
   - `~/.ssh/config` → `private_dot_ssh/private_config`
   - `~/Library/...` → `private_Library/...`
   - `~/AppData/...` → `AppData/...` (no dot_ prefix — AppData isn't a dotdir)

2. Create the file at the translated source path. If the file already exists on disk:
   ```bash
   chezmoi add ~/.config/somefile            # simple file
   chezmoi add --template ~/.config/somefile # needs templating
   ```

3. If it needs templating, add `.tmpl` suffix to the source filename and add directives.
   Edit directly in the source dir.

4. Verify: `chezmoi diff`, then `chezmoi apply` to test.

**Contains secrets:** Use 1Password `op://` injection — never put raw secrets in the
source dir. It's git-tracked.

### Adding a package

**Mac (brew/cask/mas):** Edit `.chezmoidata/packages.yaml`, add to the appropriate list
under `packages.darwin`. The `run_onchange_before_03-brew-bundle-darwin.sh.tmpl` script
picks it up automatically on next apply.

- Private tap casks: prefix with `bbrinkerhoff/private/<cask-name>`
- macOS 26+ only: add to `casks_macos26plus` instead of `casks`
- New tap needed: add to `packages.darwin.taps`

**Windows (winget):** Add the winget package ID to `packages.windows.winget` in
`packages.yaml`. The `run_onchange_before_03-install-packages-windows.ps1.tmpl` reads it.

### Adding an SSH host

Edit `.chezmoidata/ssh.yaml`. Add an entry under the right category:
- `common` — all machines
- `darwin` — Mac only
- `wsl_linux` — WSL only
- `personal` / `work` — context-based (`.context = "personal"` in chezmoi.toml)

Entry format:
```yaml
- name: "hostname or space-separated aliases"
  comment: "Human readable description"
  options:
    User: username
    HostName: actual.hostname.or.ip
    # any other SSH config directives
```

### Writing templates

Read `references/templates.md` for the full template reference with examples.

Short version of when to reach for templating:
- Different content per platform → `{{ if eq .chezmoi.os "darwin" }}`
- Secret values → `{{ onepasswordRead "op://vault/item/field" }}`
- Platform-specific paths → conditionals or `.chezmoi.homeDir`
- Hostname-specific config → `.chezmoi.hostname`

Always test templates before applying:
```bash
chezmoi execute-template < ~/.local/share/chezmoi/path/to/file.tmpl
chezmoi cat ~/.config/targetfile   # shows rendered output
chezmoi diff                       # shows what would change
```

### Run scripts

Scripts in the source root execute during `chezmoi apply`. Naming controls behavior:

| Prefix | Runs when |
|--------|-----------|
| `run_once_` | Once ever (tracked by content hash) |
| `run_onchange_` | When script content changes |
| `run_always_` | Every apply |

The `_before_` infix means the script runs before files are applied — use it for package
installs and system config. Scripts without `_before_` run after.

Ordering is by filename sort. He uses numeric prefixes (01, 02, 03...) — follow that convention.

| Number | Current purpose |
|--------|----------------|
| 01 | Install base packages (run_once) |
| 02 | Configure macOS (run_once) |
| 03 | Brew bundle / Windows packages (run_onchange) |
| 04 | Darwin packages / Configure Windows (run_once/run_onchange) |
| 05 | Firefox / Sublime setup (run_onchange) |

Platform targeting:
- `.sh.tmpl` → Mac/Linux/WSL (bash)
- `.ps1.tmpl` → Windows (PowerShell)

### Best practices and organization

**Naming prefixes:**
- `dot_` → maps to `.` in home dir
- `private_` → sets 600/700 permissions
- `executable_` → sets executable bit
- `symlink_` → creates a symlink (file content = target path)
- `.tmpl` suffix → processed as a Go template

**Organization principles:**
- Keep platform-specific logic in templates, not separate files per platform
- For large shared configs reused across platforms, use `.chezmoitemplates/` and
  `{{ template "name" . }}`
- Put secrets in 1Password, reference via `op://` — the source dir is git-tracked
- When a run script reads external data files, the onchange hash covers the script
  content only — include a `{{ include "datafile" | sha256sum }}` comment in the script
  to force re-runs when the data changes

**Debugging:**
```bash
chezmoi diff                    # what would change on apply
chezmoi status                  # which files are out of sync
chezmoi execute-template        # test a template expression
chezmoi cat ~/.some/file        # show rendered template output
chezmoi doctor                  # check config/tool health
```

## Fetching docs dynamically

**Check `references/chezmoi-core.md` first** — it covers naming conventions, template
functions, and commands offline. Only fetch when that file doesn't have the answer.

When fetching, get only the specific page needed:

- Concepts & overview: `https://www.chezmoi.io/user-guide/setup/`
- Template functions full list: `https://www.chezmoi.io/reference/templates/functions/`
- Commands reference: `https://www.chezmoi.io/reference/commands/`
- 1Password integration: `https://www.chezmoi.io/user-guide/password-managers/1password/`
- External files: `https://www.chezmoi.io/reference/special-files/chezmoiexternal/`

Fetch only the specific page needed — use WebFetch to extract the relevant section.

### Reviewing and organizing the chezmoi setup

When asked to review, audit, or suggest improvements to the setup:

1. **Read the source dir structure** — `ls -la ~/.local/share/chezmoi/` and recurse into
   subdirs to understand what's there.

2. **Check for common issues:**
   - Files that should be templates but aren't (hardcoded paths, usernames, secrets)
   - Templates that could be simplified (redundant conditionals, unused variables)
   - Run scripts with wrong type (`run_once_` vs `run_onchange_`) for their purpose
   - Numbering gaps or collisions in run script order
   - Platform-specific files missing `.chezmoiignore` exclusions for other platforms
   - Duplicate or conflicting package entries in `packages.yaml`
   - Commented-out packages that have accumulated — worth cleaning up or removing
   - Files in source that chezmoi doesn't know about (not prefixed correctly)
   - Secrets or tokens hardcoded instead of using `op://`

3. **Check template data usage** — run `chezmoi data` and compare against what templates
   actually reference. Flag unused data keys or templates referencing undefined keys.

4. **Suggest organizational improvements:**
   - Large monolithic run scripts that could be split by concern
   - Config files that should move to `.chezmoitemplates/` for reuse
   - Missing `.chezmoiignore` entries for platform-specific directories
   - External files that would be better managed via `.chezmoiexternal.yaml`

5. **Present findings as a prioritized list** — critical (secrets exposed, broken
   templates) → recommended (organizational) → optional (style/cleanup).

## Reference files

| File | When to read |
|------|-------------|
| `references/setup.md` | His specific config, directory structure, data vars, SSH/package conventions |
| `references/templates.md` | Template syntax with examples tuned to his setup |
| `references/chezmoi-core.md` | Chezmoi naming conventions, template functions, commands — check here before fetching online |
