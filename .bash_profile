[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.private_profile" ]] && source "$HOME/.private_profile" # Load the private profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This is for git bash prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

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

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
