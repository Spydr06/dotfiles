#
# Spydr06's zsh configuration
# https://github.com/spydr06/dotfiles.git
#

# Settings
set threads = $(nproc)

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# set titles automatically
preexec () {
    local cmd=$2
    if [[ "$(pwd)" == "$HOME" ]]; then
        printf "\e]0;(~) ${cmd}\a"
    else
        printf "\e]0;($(basename `pwd`)) ${cmd}\a"
    fi
}

precmd () {
    if [[ "$(pwd)" == "$HOME" ]]; then
        printf "\e]0;(~) >_\a"
    else
        printf "\e]0;($(basename `pwd`)) >_\a"
    fi
}

# Aliases
alias ls="exa -al --color=always --group-directories-first"
alias make="make -j$threads"
alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias term="alacritty -e zsh 2>&1 > /dev/null &; disown"
alias q="exit"
alias config="/usr/bin/git --git-dir=/home/spydr/dotfiles --work-tree=/home/spydr"
alias nasmount="sudo mount.cifs //192.168.178.34/FelixNAS/ /mnt/nas/ -o user=\"admin\",pass=\"Di1aNAS\!\",nounix,sec=ntlmssp,vers=\"1.0\""
alias py="python"
alias t="alacritty -e zsh 2>&1 > /dev/null &; disown"
alias fixkblayout="setxkbmap \"de\"; setxkbmap \"de(us)\""
alias cpc="xclip -sel c < "
alias get-idf=". $HOME/dev/esp/esp-idf/export.sh; . $HOME/export-esp.sh"

# Function to extract archives quickly
function ex() {
	if [ -z "$1" ]; then
	   	# display usage if no parameters given
	   	echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	   	echo "       ex <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
	else
	   	for n in "$@"
	   	do
	   	  	if [ -f "$n" ] ; then
	   	  	    case "${n%,}" in
	   	  	      *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) tar xvf "$n" ;;
	   	  	      *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar) 7z x ./"$n" ;;
	   	  	      *.lzma)      		unlzma ./"$n"      ;;
	   	  	      *.bz2)       		bunzip2 ./"$n"     ;;
	   	  	      *.cbr|*.rar) 		unrar x -ad ./"$n" ;;
	   	  	      *.gz)        		gunzip ./"$n"      ;;
	   	  	      *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
	   	  	      *.z)         		uncompress ./"$n"  ;;
	   	  	      *.xz)        		unxz ./"$n"       ;;
	   	  	      *.exe)       		cabextract ./"$n" ;;
	   	  	      *.cpio)      		cpio -id < ./"$n" ;;
	   	  	      *.cba|*.ace) 		unace x ./"$n"    ;;
	   	  	      *)
	   	  	        echo "extract: '$n' - unknown archive method"
	   	  	        return 1;;
	   	  	    esac
	   	  	else
	   	  	    echo "'$n' - file does not exist"
	   	  	    return 1
	   	  	fi
	   	done
	fi
}

# title setting
DISABLE_AUTO_TITLE="true"
function title() {
	echo -en "\e]2;$@\a"
}

# Misc
export LLVM_TABLEGEN_EXE=/usr/lib/llvm/15/bin/llvm-tblgen
export _JAVA_AWT_WM_NONREPARENTING=1 # fix java GUI applications

# PATH
export PATH="/usr/lib64/qt5/bin:$HOME/.local/bin:$HOME/.emacs.d/bin:/home/spydr/.deno/bin$PATH"
export LD_LIBRARY_PATH="/lib64:/usr/lib64:/usr/local/lib64:$LD_LIBRARY_PATH"

# Disable DotNet Telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# esp rust dev env
. $HOME/export-esp.sh

# ghcup-env
[ -f "/home/spydr/.ghcup/env" ] && source "/home/spydr/.ghcup/env"

# Autostart
export PF_INFO="ascii title os host kernel uptime memory shell palette"
pfetch

