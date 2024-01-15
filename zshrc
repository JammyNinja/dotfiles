ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful oh-my-zsh plugins for Le Wagon bootcamps
plugins=(git gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search pyenv ssh-agent direnv)

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)
unalias lt # we need `lt` for https://github.com/localtunnel/localtunnel

# Load rbenv if installed (to manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (to manage your Python versions)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init - 2> /dev/null)" && RPROMPT+='[🐍 $(pyenv version-name)]'

# Load nvm (to manage your node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Call `nvm use` automatically in a directory with a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  if nvm -v &> /dev/null; then
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use --silent
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      nvm use default --silent
    fi
  fi
}
type -a nvm > /dev/null && add-zsh-hook chpwd load-nvmrc
type -a nvm > /dev/null && load-nvmrc

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export BUNDLER_EDITOR=code
export EDITOR=code

# Set ipdb as the default Python debugger
export PYTHONBREAKPOINT=ipdb.set_trace

#add default browser
export GH_BROWSER="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"

#Google cloud json
#export GOOGLE_APPLICATION_CREDENTIALS=/home/louis/code/JammyNinja/gcp/custom-router-374616-d4f1b00a3620.json
#export GOOGLE_PROJECT_ID="custom-router-374616"
export GOOGLE_APPLICATION_CREDENTIALS=/home/louis/code/JammyNinja/gcp/le-wagon-gcp-shared-0d4b54b00d92.json
export GOOGLE_PROJECT_ID="le-wagon-gcp-shared"


#add (prepend?) Week 3 project path to python path
#export PYTHONPATH="/home/louis/code/JammyNinja/data-context-and-setup:$PYTHONPATH"
#and again as TA... - which one does it use?

#export PYTHONPATH="/home/louis/code/JammyNinja/TA/Week3_Day_1_Project_Setup/Week3_Day_1_Olist_Project_Setup:$PYTHONPATH"
export PYTHONPATH="/home/louis/code/JammyNinja/TA/Week3_Day_1_Project_Setup/data-context-and-setup:$PYTHONPATH"
export PYTHONPATH="/home/louis/code/lewagon/04-Decision-Science/01-Project-Setup/data-context-and-setup:$PYTHONPATH"


#add first chess proj to path
export PYTHONPATH="/home/louis/code/JammyNinja/Sandbox/chess_pieces_first:$PYTHONPATH"

#add cats and dogs proj package to path
export PYTHONPATH="/home/louis/code/JammyNinja/Sandbox/Raining_cats_and_dogs:$PYTHONPATH"


export PYTHONPATH="/home/louis/code/JammyNinja/Sandbox/chess_ratings_proj:$PYTHONPATH"

#/home/louis/code/JammyNinja/TA/Week3_TA/Week3_Day_1_Olist_Project_Setup
#/home/louis/code/JammyNinja/TA

alias jn="jupyter notebook"
alias google_project_id="echo custom-router-374616"
alias firefox="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"

#file navigation shortcuts
alias go_ta="     cd /home/louis/code/JammyNinja/TA"
alias go_chess="  cd /home/louis/code/JammyNinja/Sandbox/chess_pieces_first"
alias go_temp="   cd /home/louis/code/JammyNinja/Sandbox/temp_throwaway"
alias go_tennis=" cd /home/louis/code/JammyNinja/Sandbox/scraping_tennis"
alias go_sand="   cd /home/louis/code/JammyNinja/Sandbox/"
alias go_cats="   cd /home/louis/code/JammyNinja/Sandbox/Raining_cats_and_dogs"
alias go_q4="     cd /home/louis/code/lewagon/"

alias update_wsl="wsl.exe --update"


#pygame was crying and no other forum examples were from pygame :'(
export XDG_RUNTIME_DIR="/tmp/${UID}-runtime-dir"
# export DISPLAY="${(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0)}"
# export DISPLAY=127.0.0.1:0.0
#paste
# DISPLAY=$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0.0



# export DISPLAY = $(ip route list default | awk '{print $3}'):0
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
export LIBGL_ALWAYS_INDIRECT=1

# export DISPLAY=Louis-Laptop-Lenovo:1.0 # desperate


#  ls /mnt/c/Documents\ and\ Settings/Louis/Downloads/
alias go_wind="   cd /mnt/c/Documents\ and\ Settings/Louis/Downloads/"

# echo $WINDIR | cd $_
export WINDIR=" /mnt/c/Documents\ and\ Settings/Louis/Downloads/"
