# colors
autoload -U colors
colors
export CLICOLOR=1


# completions
if type brew &>/dev/null; then
  local brew_prefix
  brew_prefix=$(brew --prefix)
  if [[ -d "$brew_prefix/share/zsh-completions" ]]; then
    FPATH="$brew_prefix/share/zsh-completions:$FPATH"
  fi
fi

autoload -Uz compinit
compinit

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colored listings
zstyle ':completion:*' group-name '' # Group matches by category
zstyle ':completion:*' menu select # menu-style selections
# attempt sorting
zstyle ':completion:*' tag-order 'branches' 'remotes' 'local-directories' 'files'

# git prompt

git_prompt_info() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n $branch ]]; then
    echo " %{$fg_bold[green]%}$branch%{$reset_color%}"
  fi
}

setopt promptsubst

# PS1
# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info)
⇢ '
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# functions
[[ -d ~/.zsh/functions ]] && for function in ~/.zsh/functions/*(.N); do
  source "$function"
done

# settings

setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars # popd
setopt extendedglob # Enable extended globbing
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
DIRSTACKSIZE=5

set -o ignoreeof    # prevent ctrl-d closing terminal until > 5x
unset nomatch

# default to increase node memory recourses to 4GB
export NODE_OPTIONS=--max_old_space_size=4096

# key bindings

# vi mode
bindkey -v
bindkey '^f' vi-cmd-mode
bindkey kj vi-cmd-mode

# handy key-bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^P' history-search-backward
bindkey '^Y' accept-and-hold
bindkey '^N' insert-last-word

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

[ -f "/Users/brandonseda/.ghcup/env" ] && . "/Users/brandonseda/.ghcup/env" # ghcup-env

# perl setup
PATH="/Users/brandonseda/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/brandonseda/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/brandonseda/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/brandonseda/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/brandonseda/perl5"; export PERL_MM_OPT;

# Added by Windsurf
export PATH="/Users/thorn/.codeium/windsurf/bin:$PATH"
