#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    openssl
    z
    colordiff
    "--without-etcdir zsh"
    zsh-completions
    "--with-cocoa --srgb emacs"
    cask
    ansible
    peco
    hub
    node
    python3
    lua
    "vim --with-lua"
    mysql
    postgresql
    sqlite
    "php55 --homebrew-apxs"
    httpd22
    ricty
    sqlite
    composer
    markdown
    ctags
    ssh-copy-id
    phantomjs
    mecab
    diff-so-fancy
    thefuck
    tig
    mas
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    dropbox
    evernote
    skitch
    bettertouchtool
    google-chrome
    google-japanese-ime
    sequel-pro
    slack
    alfred
    iterm2
    atom
    virtualbox
    vagrant
    vagrant-manager
    visual-studio-code
    coteditor
    karabiner-elements
    firefox
    clipy
    deepl
    docker
    phpstorm
    station
    sourcetree
    spark
    zoom
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

mas=(
    "BetterSnapTool", id: 417375580
    "MindNode – Mind Map", id: 1289197285
)

echo "start mas install apps..."
for mas in "${mas[@]}"; do
    mas $mas
done

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
