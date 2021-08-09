#
# Spydr06's fish shell configuration
# https://gihub.com/spydr06/dotfiles.git
#

## aliases ##
# power commands
alias sus="sudo systemctl suspend"
alias shut="shutdown now"
alias reeb="reboot"
# quickly fix the audio, if discord breaks it (happens sometimes)
alias fix_audio="pulseaudio -k && pulseaudio -D"
# convenience
alias ls="exa -al --color=always --group-directories-first"
alias make="make -j16"
alias q="exit"
# remove all unneeded pacman packages (replacement for sudo apt autoremove)
alias pacman-autoremove="sudo pacman -Rcns (pacman -Qdtq)"
# always return a message, whats been done
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
# shortcut for the bare git dotfile repository
alias config="/usr/bin/git --git-dir=/home/spydr/dotfiles --work-tree=/home/spydr"

## fish settings
set fish_greeting

## autorun applications ##
starship init fish | source # init starship prompt
pfetch # fetch
