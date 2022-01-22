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

export PATH=$PATH:$HOME/Workspace/go/bin
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

alias rm='echo "Escape using backslash" '
alias mv='mv -i'
alias xclip='xclip -selection clipboard'
alias restart-plasma='kquitapp5 plasmashell && kstart5 plasmashell'
alias restart-eDP1='sudo xrandr --output eDP1 --off && sudo xrandr --output eDP1 --auto'
alias restart-eDP1-right-of-HDMI2='sudo xrandr --output eDP1 --off && sudo xrandr --output eDP1 --auto --right-of HDMI2'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh
