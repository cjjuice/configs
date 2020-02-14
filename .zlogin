[[ -s "$HOME/.private_profile" ]] && source "$HOME/.private_profile" # Load the private profile

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias pull="git pull"
alias push="git push"
alias rebase="git rebase -i origin/master"
alias gs="git status"
alias rs="bin/rails s"
alias bi="bundle"
alias migrate="rake db:migrate"

# functions
force_push() {
    git push --force-with-lease origin $1
}

print_checksum() {
  echo $1 | shasum -a 256
}

verify_checksum() {
  checksum=$(echo $1 | shasum -a 256)
  if [[ $2 == "$checksum" ]]; then
    echo "valid"
  else
    printf "invalid:\n$1 ($checksum)\nvs\n$2\n"
  fi
}

export PATH="$HOME/.cargo/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
