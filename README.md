This repository is for storing and sharing my dotfiles between machines

To use the files ensure that GNU stow is installed

~~~shell
brew install stow
~~~

For each directory, run stow to symlink files. ie:

~~~shell
stow -d ~/Source/dotfiles -t ~ nvim
~~~

