GOPATH=~/.go
# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh
# ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump archlinux colored-man colorize command-not-found compleat custom-aliases fasd git-extras git-flow last-working-dir npm redis-cli vi-mode web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# CUSTOM
# alias v='f -e mvim'
# alias vim='f -e mvim'

# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 
zstyle ':completion:*' completer _expand _complete _expand_alias 
zstyle ':completion:*' menu select=1 
zstyle ':completion:*' original true 
zstyle ':completion:*' remote-access false 
zstyle ':completion:*' use-perl true 
zstyle ':completion:*' verbose true 
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s 
zstyle ':completion:*' squeeze-slashes true 
zstyle ':completion:*' single-ignored complete
autoload -Uz compinit 
compinit -D 
zmodload zsh/complist
chpwd() ls

ls
