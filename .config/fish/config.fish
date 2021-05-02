alias sus="sudo systemctl suspend"
alias shut="shutdown now"
alias reeb="reboot"
alias fix_audio="pulseaudio -k && pulseaudio -D"

starship init fish | source
pfetch

set fish_greeting
