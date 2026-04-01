#!/bin/bash

installApps() {

  which brew >/dev/null 2>&1 || \
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  local taps=(
    "proxmark/proxmark3"
  )
  local casks=(
    "1password" # /Applications/1Password.app
    "advancedrestclient" # /Applications/AdvancedRestClient.app
    "authy" # /Applications/Authy Desktop.app
    "bambu-studio" # /Applications/BambuStudio.app
    "cleanmymac" # /Applications/CleanMyMac X.app
    "eqmac" # /Applications/eqMac.app
    "firefox" # /Applications/Firefox.app
    "google-chrome" # /Applications/Google Chrome.app
    "docker" # /Applications/Docker.app
    "flux" # /Applications/Flux.app
    "iterm2" # /Applications/iTerm.app
    "karabiner-elements" # /Applications/Karabiner-Elements.app
    "key-codes" # /Applications/Key Codes.app
    "macmediakeyforwarder" # /Applications/MacMediaKeyForwarder.app
    "microsoft-remote-desktop" # /Applications/Microsoft Remote Desktop.app
    "paragon-ntfs" # /Applications/NTFS for Mac.app
    "prusaslicer" # /Applications/Original Prusa Drivers/PrusaSlicer.app
    "raspberry-pi-imager" # /Applications/Raspberry Pi Imager.app
    "slack" # /Applications/Slack.app
    "sublime-text" # /Applications/Sublime Text.app
    "teamviewer" # /Applications/TeamViewer.app
    "ui-browser" # /Applications/UI Browser.app
    "spotify" # /Applications/Spotify.app
    "ultimaker-cura" # /Applications/Ultimaker-Cura.app
    "virtualbox" # /Applications/VirtualBox.app
    "vlc" # /Applications/VLC.app
    "zoom" # /Applications/zoom.us.app
  )
  local formulas=(
    "bash-git-prompt"
    "colordiff"
    "coreutils"
    "curl"
    "ffmpeg"
    "glib"
    "gnu-tar"
    "gnupg"
    "gnutls"
    "graphite2"
    "hub"
    "icu4c"
    "jo"
    "jq"
    "krb5"
    "lastpass-cli"
    "libarchive"
    "libyaml"
    "libzip"
    "nmap"
    "node"
    "openssl@3"
    "pcre2"
    "perl"
    "php"
    "pkg-config"
    "python3"
    "rar"
    "rpm"
    "ruby"
    "shellcheck"
    "speedtest-cli"
    "sqlite"
    "telnet"
    "trash-cli"
    "tree"
    "unbound"
    "vagrant"
    "vim"
    "wget"
    "xq"
    "youtube-dl"
  )
  local masApps=(
    "iLightShow" # /Applications/iLightShow.app
    "Apple Configurator" # /Applications/Apple Configurator 2.app
    "Xcode" # /Applications/Xcode.app
  )

  echo "Tapping sources before installs..."
  for tap in ${taps[*]};do
    brew tap "${tap}"
  done

  echo -e "Brew installing Mac App Store cli tools"
  brew install mas

  echo -e "Brew installing the following casks:\n${casks[*]}"
  brew install --cask ${casks[*]}

  echo -e "Brew installing the following formulas:\n${formulas[*]}"
  brew install ${formulas[*]}

  echo -e "Installing the following Applications from the Mac App Store:\n${masApps[*]}"
  for app in ${masApps[*]};do 
    mas install "$(mas search "${app}"|head -n1|awk '{print $1}')"
  done

  echo \
  "Don't forget to install these manual applications!

    - Cisco AnyConnect Secure Mobility Client.app:
      - https://vpn.solutionreach.com

    - logioptionsplus.app:
      - https://www.logitech.com/en-us/software/logi-options-plus.html

    - Spotify Save Song.app:
      - open -j -g '/Users/bbrinkerhoff/Applications/Spotify Save Song.app'

    - Amazon.app:
      - open  /Applications/Google\ Chrome.app 'https://www.amazon.com/gp/css/order-history?ref_=nav_orders_first'

    - OnScreen Control.app:
      - https://www.lg.com/us/support/software-firmware-drivers
      - Model: 27UD68-W
  "
}

echo "Beginning Application installation function..."
installApps; exit $?