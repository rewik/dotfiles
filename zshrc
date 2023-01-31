# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export GPGKEY=96A4DA12
export GPG_TTY=`tty`
echo UPDATESTARTUPTTY | gpg-connect-agent

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# case-insensitive matching
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# vim-like keybindings
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#alias fgrep='fgrep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias nvimdiff="nvim -d"
alias ls="exa"
alias l="exa -lbh --time-style iso"
alias glgga="git log --all --graph --decorate"

alias git-rebase-sign="git rebase --exec 'git commit --amend --no-edit -n -S' -i"

eval "$(starship init zsh)"
