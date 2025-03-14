git_prompt_info() {
  current_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info)
⇢ '
fi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

autoload -U colors
colors

export CLICOLOR=1

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars # popd
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

unset nomatch

[[ -f ~/.aliases ]] && source ~/.aliases
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done


# vi mode
bindkey -v
bindkey '^f' vi-cmd-mode
bindkey kj vi-cmd-mode

# handy key-bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^P' history-search-backward
bindkey '^Y' accept-and-holde
bindkey '^N' insert-last-word

# prevent ctrl-d closing terminal until > 5x
set -o ignoreeof

# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion<Paste>

# default to increase node memory recourses to 4GB
export NODE_OPTIONS=--max_old_space_size=4096
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/brandonseda/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh

# bit
case ":$PATH:" in
  *":/Users/brandonseda/bin:"*) ;;
  *) export PATH="$PATH:/Users/brandonseda/bin" ;;
esac
# bit end

[ -f "/Users/brandonseda/.ghcup/env" ] && . "/Users/brandonseda/.ghcup/env" # ghcup-env
PATH="/Users/brandonseda/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/brandonseda/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/brandonseda/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/brandonseda/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/brandonseda/perl5"; export PERL_MM_OPT;
