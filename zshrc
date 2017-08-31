# # alias reminders plugin6color
# # alias reminders plugin"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
  PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi
powerline-daemon -q
. /Users/aji/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
POWERLINE_CONFIG_PATHS="~/.config/powerline/"

if [ "$TMUX"="" ]; then tmux; fi

source /usr/local/share/antigen/antigen.zsh
antigen bundle git
antigen bundle bundler
antigen bundle colorize
antigen bundle gem
antigen bundle jira
antigen bundle osx
antigen bundle rails
antigen bundle rvm
antigen bundle ruby
antigen bundle tmux
antigen apply

source ~/k.sh

# Fantasque Powerline font repo
# https://github.com/ztomer/fantasque_awesome_powerline

# case insensitive (all), partial-word and substring completion
if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

zstyle ':completion:*' list-colors ''

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="nvim"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# type .. instead of cd..
setopt auto_cd


# ALIASES {{{

# CONFIG ETC {{{

# alias reminders plugin
source ~/.oh-my-zsh/plugins/alias-tips/alias-tips.plugin.zsh

alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.vimrc"

alias v.="nvim ."
alias v="nvim"

alias l="k -a"
alias c="cd"
alias ..="cd .."
alias be="bundle exec"
alias rserv="ruby -run -e httpd -- -p 5000 ."
alias ya="yarn add --DEV"
alias yi="yarn install"
alias ys="yarn start"
alias yt="yarn test"
alias npmi="npm install"
alias npms="npm start"
alias wp="webpack"

alias dc="docker-compose"
alias dcup="docker-compose up -d"

# }}}

# GIT {{{
#
alias gs="git status"
alias ga="git add"
alias cob="git checkout -b"
alias co="git checkout"
alias gcm="git commit -m"
alias gpo="git push origin"
alias glo="git pull origin"
alias gfo="git fetch origin"

# }}}

# PROJECTS {{{

alias notes="nvim ~/Dropbox"
alias _="cd ~/dev/_ul"
alias dev="cd ~/dev"
alias ulgo="tmuxinator start ulgo"
alias compass="tmuxinator start compass"
alias autocert="tmuxinator start autocert"

# Compass Home working directory installed to path
export COMPASS_HOME=/Users/aji/dev/_ul/compass
export PATH=$PATH:/Users/aji/dev/_ul/compass/bin
 # }}}

# MISC {{{

bindkey '^i' expand-or-complete-prefix
alias keys="ssh-add -K ~/.ssh/id_rsa && ssh-add -K ~/.ssh/rsa_ul"

alias rs="RUBYOPT='-W0' rails spec"
alias docker-cleanup="docker rmi $(docker images | grep "<none>" | awk {'print $3'})"
alias jarvis="ssh aji@jarvis.webhop.me"

# }}}

# }}}
export COMPASS_HOME=/Users/aji/dev/_ul/compass
export PATH=$PATH:/Users/aji/dev/_ul/compass/bin

alias compass-yolo="ruby setup_script.rb"

alias cyolo="ruby setup_script.rb"
