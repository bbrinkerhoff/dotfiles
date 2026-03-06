#!/bin/bash

set -eufo pipefail

trap 'killall Dock' EXIT

defaults write com.apple.dock persistent-apps -array

declare -a remove_labels=(
  Launchpad
  FaceTime
  Calendar
  Contacts
  Pages
)

for label in "${remove_labels[@]}"; do
  dockutil --no-restart --remove "${label}" || true
done

declare -a add_programs=(
  file:///System/Applications/Messages.app
  file:///Applications/Firefox.app
  file:///Applications/iTerm.app
  file:///Applications/Sublime Text.app
)
