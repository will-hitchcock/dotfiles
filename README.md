# dotfiles

This is a safe space, don't judge me.

I should write a script that does all of this somehow. Maybe just use someone elses 🤷‍♂️
The setup script will delete all your config files and replace them with symlinks, be careful.

https://draculatheme.com/iterm/

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

brew install neovim tmux node github/gh/gh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/wlhtck/dotfiles.git
./setup.sh
```
