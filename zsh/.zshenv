typeset -U path PATH

# Define preferred directories first
path=(
  "$HOME/.local/bin"
  "$HOME/.cabal/bin"
  "$HOME/.ghcup/bin"
  "$HOME/.local/bin:$PATH"
  "$HOME/Library/Python/3.7/bin"
  "$HOME/bin${PATH:+:${PATH}}"
  /usr/local/opt/ruby/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)

export PATH
export EDITOR=nvim
export VISUAL=nvim
export DOT=$HOME/dotfiles
export DOT_PROFILE=thorn

# perl setup
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# keys
[[ -f ~/.keys ]] && source ~/.keys

echo "zshenv loaded"
