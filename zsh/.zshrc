# Path to your oh-my-zsh installation.
export ZSH="/home/masterofreality/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dieter"

# arrow, agnoster, dieter, jnrowe, refined, ALANPEABODY
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

[[ -s /home/masterofreality/.autojump/etc/profile.d/autojump.sh ]] && source /home/masterofreality/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract)

source $ZSH/oh-my-zsh.sh
alias starwars='telnet towel.blinkenlights.nl'
alias v="nvim"
alias i3conf='nvim ~/.config/i3/config'
alias vconf="nvim ~/.config/nvim/init.vim"
alias polc="nvim ~/.config/polybar/config"
alias i3c="nvim ~/.config/i3/config"
alias zshrc="nvim ~/.zshrc"
alias sauce="source ~/.zshrc"
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'
alias home='cd ~'
alias hy255='cd ~/Desktop/hy255'
alias hy225='cd ~/Desktop/hy225'
alias hy118='cd ~/Desktop/hy118'
alias random='cd ~/Desktop/random'
alias friends='cd ~/Desktop/random/friends'
alias c='clear'
alias sdn='shutdown now'
alias weather='curl wttr.in/Heraklion'
alias vimtutor='v ~/Desktop/random/vimtutor'
alias neofetch='neofetch | lolcat'
alias brightness='xrandr --output eDP1 --brightness'

xdgopen(){
    xdg-open $* &>/dev/null & disown
}
alias open=xdgopen
# User configuration
startAndDisOwn(){
     $1 &>/dev/null & disown
}
alias start=startAndDisOwn
