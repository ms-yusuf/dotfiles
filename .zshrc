HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export PATH=$PATH:$HOME/Workspace/go/bin:$HOME/./config/scripts:/usr/lib/jvm/default-runtime/bin/java
export GOROOT="/usr/lib/go"
export GOPATH=$HOME/Workspace/go
export VDPAU_DRIVER=va_gl
export LIBVA_DRIVER_NAME=iHD

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/shedder/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=7

plugins=(
  git
  dotenv
  zsh-autosuggestions
  fzf
  k
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey  "^[[H"   beginning-of-line
bindkey "\e[3~" delete-char
bindkey  "^[[F"   end-of-line

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'
export CGO_ENABLED=0
export DESKTOP_SESSION=plasma
export NODE_OPTIONS="--max_old_space_size=8192"
export TERM=xterm-256color


alias rm='echo "Escape using backslash." '
alias find='fzf'
alias grep='rg'
alias cat='bat'
# alias cd='echo "If you are already been there b4, then use z. Else, escape using backslash." '
alias f='fuck'
alias mv='mv -i'
alias xclip='xclip -selection clipboard'
alias restart-plasma='kquitapp5 plasmashell && kstart5 plasmashell'
alias restart-eDP1='sudo xrandr --output eDP1 --off; sleep 1; sudo xrandr --output eDP1 --auto --brightness 0.7'
alias l='k -Ah'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /home/shedder/.config/broot/launcher/bash/br
. /home/shedder/.config/z.sh
eval $(thefuck --alias)
