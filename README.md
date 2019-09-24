# dotfiles

I should write a script that does all of this somehow. Maybe just use someone elses 🤷‍♂️
The setup script will delete all your config files and replace them with symlinks, be careful.

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install tmux
brew install neovim

git clone https://github.com/will-hitchcock/dotfiles.git
./setup.sh
```
