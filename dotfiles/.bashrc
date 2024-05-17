

# Aliases
# =======
# alias celerykill="ps auxww | grep 'celery worker' | awk '{print $2}' | xargs kill -9"
alias celerykill="pkill -f 'celery worker'"
alias celeryls="ps aux|grep \"celery worker\""
alias invenio-stop="invenio-cli services stop"
alias update="sudo apt update && sudo apt upgrade -y"
# Add kubctl alias from minikube
alias kubectl="minikube kubectl --"
# Kubectl autocomplete
alias k="kubectl"
alias mk="minikube"
alias bat="batcat"
alias weather="curl wttr.in/Stockholm"
alias deactivate="pyenv deactivate"

# sudo apt install asciinema
alias record-terminal="asciinema rec demo.cast --overwrite"
alias record-terminal-upload="asciinema upload demo.cast"


# Pyenv
# =====

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM
# ===

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Enable fuzzy auto-completion for Bash
source /usr/share/doc/fzf/examples/key-bindings.bash

# fzf
# ===

# Drakola theme for fzf
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#131e29,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'



# Function to create and activate a pyenv virtualenv based on the current folder name
pyenv_auto_venv() {
    # Get the name of the current directory
    foldername=$(basename "$PWD")

    # Check if the virtualenv already exists
    if ! pyenv virtualenvs | grep -q "${foldername}"; then
        # Create the virtualenv
        pyenv virtualenv "${foldername}"
    fi

    # Activate the virtualenv using pyenv activate
    pyenv activate "${foldername}"
}

# Create an alias for the function
alias pyenv_auto_venv='pyenv_auto_venv'
