#
# Spydr06's zsh configuration
# https://github.com/spydr06/dotfiles.git
#

# Settings
set threads = 16

# Aliases
alias ls="exa -al --color=always --group-directories-first"
alias make="make -j$threads"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias term="alacritty -e zsh 2>&1 > /dev/null &; disown"
alias q="exit"
alias pacman-autoremove="sudo pacman -Rcns $(pacman -Qdtq)"
alias config="/usr/bin/git --git-dir=/home/spydr/dotfiles --work-tree=/home/spydr"

# Misc
export _JAVA_AWT_WM_NONREPARENTING=1 # fix java GUI applications

# Look and Feel
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autostart
pfetch
