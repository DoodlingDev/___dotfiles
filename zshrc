# Fantasque Powerline font repo
# https://github.com/ztomer/fantasque_awesome_powerline
#
export TERM="xterm-256color"

# PATH {{{

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$HOME/bin:$PATH

# }}}

# {{{ SETOPS

# type .. instead of cd..
setopt auto_cd

# }}}

# THEME {{{
ZSH_THEME="bullet-train"
# }}}

# Antigen for plugin management
# https://github.com/zsh-users/antigen
#
source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
# antigen bundle rails
antigen bundle ruby
antigen bundle tmux
antigen bundle vi-mode
antigen bundle colored-man-pages
antigen bundle jira
antigen bundle tmuxinator
antigen bundle yarn
antigen bundle alias-tips
antigen bundle zsh-autosuggestions
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
# antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

source ~/.k/k.sh
source ~/.dotfiles/oh-my-zsh/plugins/alias-tips/alias-tips.plugin.zsh

# zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=3
# }}}

# {{{ COMPLETION
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

# exercism.io completion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# }}}

# EXPORTS {{{
export EDITOR="nvim"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export COMPASS_HOME=/Users/aji/dev/_ul/compass
export PATH=$PATH:/Users/aji/dev/_ul/compass/bin
# }}}

# ALIASES {{{

# CONFIG ETC {{{
# alias reminders plugin
alias zshconfig="nvim ~/.dotfiles/zshrc"
alias vimconfig="nvim ~/.dotfiles/config/nvim/init.vim"

alias v="nvim ."
alias nv="nvim"

alias el="nvim -c L"

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
alias dcr="docker-compose run --rm"
alias dcx="docker-compose stop && docker-compose rm --force"

alias rr="~/.ranger/ranger.py ."
# }}}

# TMUX {{{
alias td="tmux detach"
alias tas="tmux attach-session -t"

alias tns="tmux new-session"
# }}}

# GIT {{{
alias gs="git status"
alias ga="git add"
alias cob="git checkout -b"
alias co="git checkout"
alias gcm="git commit -m"
alias gpo="git push origin"
alias glo="git pull origin"
alias glom="git pull origin master"
alias gfo="git fetch origin"
alias m!="git checkout master"
alias gsquash="git fetch; git reset --mixed origin/master; git merger --squash HEAD@{1}"
# }}}

# PROJECTS {{{
alias notes="nvim ~/Dropbox"
alias _="cd ~/dev/_ul"
alias dev="cd ~/dev"
alias ulgo="tmuxinator start ulgo"
alias compass="tmuxinator start compass"
alias autocert="tmuxinator start autocert"

alias tc="NODE_PATH=./src mocha --compilers js:babel-core/register --require tools/testSetup.js --reporter spec"

# alarmHUB {{{

alias da:b="docker container attach compass_backend_wrapper_1"
alias da:ac="docker container attach compass_alarm_company_service_1"

# Compass Home working directory installed to path
export COMPASS_HOME=/Users/aji/dev/_ul/compass
export PATH=$PATH:/Users/aji/dev/_ul/compass/bin

alias cyolo="ruby setup_script.rb"

#}}}

 # }}}

# MISC {{{
alias s="rails s"

bindkey '^i' expand-or-complete-prefix
alias keys="ssh-add -K ~/.ssh/id_rsa && ssh-add -K ~/.ssh/rsa_ul"

alias rs="RUBYOPT='-W0' rails spec"
alias docker-cleanup="docker rmi $(docker images | grep "<none>" | awk {'print $3'})"
alias jarvis="ssh aji@jarvis.webhop.me"

alias mg="marker get" # terminal command palette
# }}}

# }}}

# Applications {{{
. ~/.dotfiles/z.sh
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"
# }}}
export PATH="$PATH:$HOME/Dropbox/notes"
export PATH="$PATH:~/.dotfiles/bin/"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

