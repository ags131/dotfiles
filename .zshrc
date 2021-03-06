export PATH=$HOME/bin:$HOME/npm-global/bin:/usr/local/bin:/usr/local/go/bin:/home/adam/.gem/ruby/2.6.0/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=`tty`

ZSH_THEME="spaceship"
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_BATTERY_SHOW=false
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh_custom

plugins=(git kubectl kubectx httpie lol node nvm sublime sudo)

source $ZSH/oh-my-zsh.sh
# User configuration

export ZSH_THEME_TERM_TAB_TITLE_IDLE="%m: %15<..<%~%<<"

export editor="micro"
export EDITOR="micro"
export VISUAL="micro"
export GIT_EDITOR="micro"
export TERMINAL="kitty"

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias git="hub"
alias nano="echo Use micro!; # "

function fixTERM() {
  infocmp | ssh $@ "tic -"
}

function getmicro() {
  ssh $@ "mkdir -p ~/bin; cd ~/bin; curl -L getmic.ro | bash"
}

setopt noautomenu 
setopt nomenucomplete

###-tns-completion-start-###
if [ -f $HOME/.tnsrc ]; then 
    source $HOME/.tnsrc 
fi
###-tns-completion-end-###

#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/adam/google-cloud-sdk/path.zsh.inc' ]; then source '/home/adam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/adam/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/adam/google-cloud-sdk/completion.zsh.inc'; fi

. "/home/adam/.acme.sh/acme.sh.env"
isSSH=$( [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] )
[[ -n "$DISPLAY" ]] && [[ "$TERM" -eq "xterm-kitty" ]] && [[ ! $isSSH ]] && alias ssh="kitty +kitten ssh"

command -v yarn >/dev/null 2>&1 && export PATH=$(yarn global dir)/node_modules/.bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -z "$GOPATH" ] && export GOPATH=$HOME/go
[ ! -z "$GOPATH" ] && export PATH=$PATH:$GOPATH/bin