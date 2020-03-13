declare -a FILES_TO_SYMLINK=(
  '.vimrc'
  '.bashrc'
  '.zshrc'
  '.bash_profile'
  '.editorconfig'
  '.promptlinerc'
  '.tmux.conf'
  '.config/nvim/init.vim'
  '.config/nvim/coc-settings.json'
  '.config/coc/extensions/package.json',
  '.hyper.js' 
)

for i in "${FILES_TO_SYMLINK[@]}"; do
  if test -f ~/$i; then
    echo "~/$i exists, removing it first"
    rm ~/$i
  fi

  echo "Creating symlink ~/$i --> $(pwd)/$i"
  ln -s $(pwd)/$i ~/$i
  # sourceFile="$(pwd)/$i"
  # targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

  # if [[ $BUILD ]]; then
    # link_file $sourceFile $targetFile
  # else
    # unlink_file $sourceFile $targetFile
  # fi
done
