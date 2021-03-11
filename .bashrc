export PATH=$PATH:'~/.npm-global/bin:~/Library/Python/3.7/bin/'

source ~/.promptlinerc

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export VISUAL=nvim
export EDITOR=nvim
export GIT_REVIEW_BASE=master

# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
# export FZF_DEFAULT_COMMAND='ag -g""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

gitPrune() {
    git branch --merged master | grep -v master | xargs -n 1 git branch -d
    git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

# source the private bash config if it exists, this one doesn't go in source control
BASH_PRIVATE=~/.bash_private && test -f $BASH_PRIVATE && source $BASH_PRIVATE


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
