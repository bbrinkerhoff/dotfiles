# Dock
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock
defaults write com.apple.dock "tilesize" -int "42" && killall Dock
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "autohide-time-modifier" -float "1.5" && killall Dock
defaults write com.apple.dock "autohide-delay" -float "0" && killall Dock
defaults write com.apple.dock "mineffect" -string "genie" && killall Dock
defaults write com.apple.dock "static-only" -bool "false" && killall Dock
defaults write com.apple.dock "scroll-to-open" -bool "false" && killall Dock

# Screenshot
defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "include-date" -bool "true"
defaults write com.apple.screencapture "location" -string "~/Desktop" && killall SystemUIServer
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
defaults write com.apple.screencapture "type" -string "png"

# Safari
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "false" && killall Safari

# Finder
defaults write com.apple.finder "QuitMenuItem" -bool "false" && killall Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "false" && killall Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
defaults write com.apple.finder "FinderSpawnTab" -bool "true" && killall Finder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && killall Finder
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" && killall Finder
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "false" && killall Finder
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0" && killall Finder
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1" && killall Finder
defaults write com.apple.finder "_FXEnableColumnAutoSizing" -bool "true" && killall Finder
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool true
defaults write com.apple.finder EmptyTrashSecurely -bool true
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write com.apple.finder "ShowStatusBar" -bool "true" && killall Finder

# Desktop
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true" && killall Finder
defaults write com.apple.finder "CreateDesktop" -bool "true" && killall Finder
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true" && killall Finder
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true" && killall Finder
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true" && killall Finder
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false" && killall Finder

# Menu Bar
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false" && killall SystemUIServer
defaults write com.apple.menuextra.clock "DateFormat" -string '"d MMM hh:mm:ss"'

# Mouse
defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1"
defaults write com.apple.Terminal "FocusFollowsMouse" -bool "false" && killall Terminal

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "false"
defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool "false"
defaults write com.apple.AppleMultitouchTrackpad "DragLock" -bool "false"

# Keyboard
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
defaults write com.apple.HIToolbox AppleFnUsageType -int "2"
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool "true"

# Mission Control
defaults write com.apple.dock "mru-spaces" -bool "false" && killall Dock
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true" && killall Dock
defaults write com.apple.spaces "spans-displays" -bool "false" && killall SystemUIServer

# Autogather
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "true"

# Text Edit
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit
defaults write com.apple.TextEdit "SmartQuotes" -bool "false" && killall TextEdit

# Time Machine
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"

# Activity Monitor
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "2" && killall Activity\ Monitor
defaults write com.apple.ActivityMonitor "IconType" -int "0" && killall Activity\ Monitor

# Messages
defaults write com.apple.MobileSMS "MMSShowSubject" -bool "false" && killall Messages

# Misc
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true" && killall Dock
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false" && killall Music
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
defaults write NSGlobalDomain "NSCloseAlwaysConfirmsChanges" -bool "false"
defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindow" -bool "false"
