export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# POWERLEVEL THEME {{{

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE="awesome-patched"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} ➪ %f%k%F{white}\uE0B4%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time rvm node_version battery)

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'

POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"

POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

POWERLEVEL9K_RVM_FOREGROUND="red"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="blue"

POWERLEVEL9K_CARRIAGE_RETURN_ICON="\uF149"
POWERLEVEL9K_ROOT_ICON="\uF120 "
POWERLEVEL9K_RUBY_ICON="\uE791 "
POWERLEVEL9K_AWS_ICON="\uF1B2 "
POWERLEVEL9K_AWS_EB_ICON="\uF1B3 "
POWERLEVEL9K_BACKGROUND_JOBS_ICON="\uF46C "
POWERLEVEL9K_TEST_ICON="\uF0C3"
POWERLEVEL9K_TODO_ICON="\uF046"
POWERLEVEL9K_BATTERY_ICON="\uF240"
POWERLEVEL9K_BATTERY_CHARGING_ICON="AA"
POWERLEVEL9K_DISK_ICON="\uF0A0"
POWERLEVEL9K_OK_ICON="\uF00C"
POWERLEVEL9K_FAIL_ICON="F00D"
POWERLEVEL9K_NODE_ICON="\uE718"
POWERLEVEL9K_APPLE_ICON="\uE711"
POWERLEVEL9K_ANDROID_ICON="\uE70E"
POWERLEVEL9K_LINUX_ICON="\uE712"
POWERLEVEL9K_HOME_ICON="\uF015"
POWERLEVEL9K_HOME_SUB_ICON=""
POWERLEVEL9K_FOLDER_ICON="\uF114"
POWERLEVEL9K_NETWORK_ICON=""
POWERLEVEL9K_LOAD_ICON=""
POWERLEVEL9K_SWAP_ICON=""
POWERLEVEL9K_RAM_ICON=""
POWERLEVEL9K_SERVER_ICON=""
POWERLEVEL9K_VCS_UNTRACKED_ICON=""
POWERLEVEL9K_VCS_UNSTAGED_ICON=""
POWERLEVEL9K_VCS_STAGED_ICON="\uF407"
POWERLEVEL9K_VCS_STASH_ICON=""
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON="\uF407"
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON="\uF47F"
POWERLEVEL9K_VCS_TAG_ICON=""
POWERLEVEL9K_VCS_BOOKMARK_ICON="\uF02B "
POWERLEVEL9K_VCS_COMMIT_ICON="\uF417 "
POWERLEVEL9K_VCS_BRANCH_ICON="\uF418 "
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=""
POWERLEVEL9K_VCS_GIT_ICON="\uF406"
POWERLEVEL9K_VCS_GIT_GITHUB_ICON="\uF408"
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON="\uF171"
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=""
POWERLEVEL9K_VCS_HG_ICON=""
POWERLEVEL9K_VCS_SVN_ICON=""
POWERLEVEL9K_RUST_ICON=""
POWERLEVEL9K_PYTHON_ICON=""
POWERLEVEL9K_SWIFT_ICON=""
POWERLEVEL9K_GO_ICON=""
POWERLEVEL9K_PUBLIC_IP_ICON=""
POWERLEVEL9K_LOCK_ICON="\uF023"
POWERLEVEL9K_EXECUTION_TIME_ICON=""
POWERLEVEL9K_SSH_ICON="\uF084"
POWERLEVEL9K_VPN_ICON=""
POWERLEVEL9K_KUBERNETES_ICON=""

# }}}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# JIRA
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/jira
#
#
plugins=(zsh-autosuggestions git rails ruby node tmux vi-mode colored-man-pages jira osx tmux tmuxinator yarn zsh-navigation-tools taskwarrior alias-tips)

source $ZSH/oh-my-zsh.sh

if [ "$TMUX"="" ]; then
  export TERM="xterm-256color"
  tmux
fi

# Fantasque Powerline font repo
# https://github.com/ztomer/fantasque_awesome_powerline

source ~/k/k.sh

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

export EDITOR="nvim"
export SSH_KEY_PATH="~/.ssh/rsa_id"

# type .. instead of cd..
setopt auto_cd

# ALIASES {{{

# CONFIG ETC {{{

# alias reminders plugin

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
alias dcr="docker-compose run --rm"

alias rr="~/.ranger/ranger.py ."

alias td="tmux detach"
alias tas="tmux attach-session -t"

# }}}
#
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

bindkey '^i' expand-or-complete-prefix
alias keys="ssh-add -K ~/.ssh/id_rsa && ssh-add -K ~/.ssh/rsa_ul"

alias rs="RUBYOPT='-W0' rails spec"
alias docker-cleanup="docker rmi $(docker images | grep "<none>" | awk {'print $3'})"
alias jarvis="ssh aji@jarvis.webhop.me"

# }}}

# }}}

export COMPASS_HOME=/Users/aji/dev/_ul/compass
export PATH=$PATH:/Users/aji/dev/_ul/compass/bin
