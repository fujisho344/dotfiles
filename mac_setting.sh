#!/bin/bash

# キーリピートの設定
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1

# vim起動時のエラー対策
sudo chmod -R 775 ~/.vim/session
