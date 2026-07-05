# Braydon's Chezmoi Setup

## Source structure

```
~/.local/share/chezmoi/
├── AppData/                          # Windows AppData configs
│   └── Roaming/
│       └── private_Sublime Text/...
├── dot_bash/                         # bash config fragments
├── dot_bash_profile
├── dot_bashrc
├── dot_config/
│   ├── bat/
│   ├── Firefox/
│   ├── iterm2/
│   ├── macOS/
│   ├── ncdu/
│   ├── private_1Password/
│   ├── private_github-copilot/
│   ├── Sideloadly/
│   ├── symlink_Sublime Text         # symlink to Sublime config
│   ├── wakeonlan/
│   ├── Windows_RDP/
│   └── wsl/
├── dot_gitconfig.tmpl
├── dot_gitignoreglobal
├── dot_local/
├── dot_screenrc
├── dot_vim_runtime/
├── dot_vimrc
├── dot_wslconfig.tmpl
├── empty_dot_hushlogin
├── private_dot_ssh/
│   └── private_config.tmpl
├── private_Library/                  # macOS ~/Library configs
├── Reference/                        # non-managed reference docs
├── Scripts/                          # personal scripts synced via Nextcloud (not chezmoi-managed)
├── symlink__curlrc.tmpl
├── .chezmoidata/
│   ├── packages.yaml                 # brews/casks/winget package lists
│   └── ssh.yaml                      # SSH host entries per platform
├── .chezmoitemplates/
│   └── SublimeText/
│       └── User/                     # shared Sublime settings
├── run_once_before_01-install-packages.sh.tmpl
├── run_once_before_02-configure-macos.sh.tmpl
├── run_once_before_03-install-vim-runtime.sh.tmpl
├── run_once_before_04-install-packages-darwin.sh.tmpl
├── run_onchange_before_03-brew-bundle-darwin.sh.tmpl
├── run_onchange_before_03-install-packages-windows.ps1.tmpl
├── run_onchange_before_04-configure-windows.ps1.tmpl
├── run_onchange_before_05-setup-firefox.sh.tmpl
└── run_onchange_before_05-setup-sublime-windows.ps1.tmpl
```

## .chezmoidata/ — package and SSH data

Data files in `.chezmoidata/` are auto-merged into the template context. Two files:

### packages.yaml

Declares all packages per platform. Access in templates as `.packages.<platform>.<type>`:

| Key | Contents |
|-----|----------|
| `.packages.darwin.brews` | Homebrew formulae list |
| `.packages.darwin.casks` | Homebrew casks list |
| `.packages.darwin.casks_macos26plus` | Casks only installed on macOS 26+ |
| `.packages.darwin.taps` | Homebrew taps (e.g. `bbrinkerhoff/private`) |
| `.packages.darwin.mas` | Mac App Store apps (list of `{name, id}` objects) |
| `.packages.windows.winget` | Windows package IDs for winget |

**To add a Mac brew:** Add to `.packages.darwin.brews` list in `packages.yaml`. The
`run_onchange_before_03-brew-bundle-darwin.sh.tmpl` script reads this and runs Brew.

**To add a Windows app:** Add winget ID to `.packages.windows.winget`. The
`run_onchange_before_03-install-packages-windows.ps1.tmpl` script reads this list.

**To add a cask from the private tap:** Use `bbrinkerhoff/private/<cask-name>`. The tap
`bbrinkerhoff/private` is at `https://github.com/bbrinkerhoff/homebrew-private`.

**macOS 26+ conditional casks:** Add to `casks_macos26plus` — the install script checks
`.macOSMajorVersion` to decide whether to install these.

### ssh.yaml

Declares SSH hosts per platform/context. Merged into `.ssh.hosts.<category>`:

| Key | Used for |
|-----|----------|
| `.ssh.hosts.common` | Applied on every machine |
| `.ssh.hosts.darwin` | Mac only |
| `.ssh.hosts.linux` | Bare-metal Linux (not WSL) |
| `.ssh.hosts.wsl_linux` | WSL only |
| `.ssh.hosts.windows` | Windows only |
| `.ssh.hosts.personal` | Personal context (`context = "personal"`) |
| `.ssh.hosts.work` | Work context |

Each entry is `{name, comment, options}` where `options` is a map of SSH config directives.
The `private_dot_ssh/private_config.tmpl` template iterates these to generate `~/.ssh/config`.

**To add a new SSH host:** Add an entry under the appropriate category in `ssh.yaml`.

## chezmoi.toml config

```toml
[settings]
  home = "$HOME"
  config_dir = "${HOME}/.config"

[data]
  fullName = "Braydon Brinkerhoff"
  email    = "braydonbrinkerhoff@gmail.com"
  autoCommit = true
  context    = "personal"
  macOSMajorVersion = "26"

[git]
    autoCommit = true
    autoPush = true
```

## Template data variables

| Variable | Value / Notes |
|----------|---------------|
| `.fullName` | `"Braydon Brinkerhoff"` |
| `.email` | `"braydonbrinkerhoff@gmail.com"` |
| `.autoCommit` | `true` |
| `.context` | `"personal"` |
| `.macOSMajorVersion` | `"26"` (macOS Tahoe) |
| `.chezmoi.os` | `"darwin"` / `"windows"` / `"linux"` |
| `.chezmoi.hostname` | machine hostname |
| `.chezmoi.homeDir` | home directory path |
| `.chezmoi.username` | current user |

## Platform conventions

**Mac-only files:** Live in `private_Library/` (maps to `~/Library/`) or `dot_config/macOS/`

**Windows-only files:** Live in `AppData/` (maps to `~/AppData/`) — note no `dot_` prefix since AppData isn't a dotdir

**WSL detection:**
```
{{ if and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
  # WSL-specific
{{ end }}
```

**Sublime Text:** Shared config lives in `.chezmoitemplates/SublimeText/User/` and is
included by both the Mac path (`private_Library/.../User/`) and Windows path
(`AppData/Roaming/private_Sublime Text/.../User/`) via `{{ template "SublimeText/User/filename" . }}`

## Run script numbering

Scripts run in sort order within their prefix group. Current numbering:

| Number | Purpose |
|--------|---------|
| 01 | Install base packages (run_once) |
| 02 | Configure macOS (run_once) |
| 03 | Install vim runtime / Brew bundle / Windows packages |
| 04 | Install Darwin packages / Configure Windows |
| 05 | Setup Firefox / Sublime (Windows) |

When adding a new script, pick a number that puts it in the right order. Use gaps to
allow future insertion without renumbering.

## Key integrations

**1Password SSH agent:**
- Mac: native 1Password SSH agent
- WSL: bridged via socat + npiperelay.exe at `~/winhome/AppData/Local/npiperelay/npiperelay.exe`
- Git SSH override in WSL: `sshCommand = ssh.exe` (uses Windows SSH which has 1P agent)

**NAS:** QNAP at `\\qnap.local\` or `192.168.1.15`
- Shares: TimeMachine, PlexStorage, Personal_Storage, WinFileHistory

**WSL networking:** `networkingMode=mirrored` in `.wslconfig`, Windows home at `~/winhome`

## Things NOT managed by chezmoi

- AHK scripts → Nextcloud
- Personal scripts (`Scripts/` dir) → Nextcloud (chezmoi source just syncs the directory, scripts aren't managed by chezmoi)
- AutoHotkey v1 → manual install (not in winget)
- Fusion 360 → manual install (not in winget)
