export PATH=$PATH:'~/.npm-global/bin'

source ~/.promptlinerc

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export VISUAL=nvim
export EDITOR=nvim

# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_COMMAND='ag -g""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
