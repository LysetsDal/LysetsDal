export ZSH="/Users/asgerlysdahl/.oh-my-zsh"

# ==========  COLORS & PROMPT ==========
# ZSH_THEME="eastwood" # <-- default omz theme

export CLICOLOR=1
export LSCOLORS=ExFxCxDxCxegedabagacad

# Custom prompt
PROMPT="%{$fg[green]%}┌──(%{$fg[blue]%}%n%{$fg[green]%})-[%{$reset_color%}%~%{$fg[green]%}]
└─$ "

# ========== SETTINGS & PLUGINS ===========
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Auto load as me
if [[ $USER != "asgerlysdahl" ]]; then
    su - asgerlysdahl
fi

# dots while waiting to compile.
COMPLETION_WAITING_DOTS="true"

# List the plugins you want:
plugins=(
  z
  git
  git-lfs
  brew
  sudo
  macos
  vscode
  copypath
  extract
  web-search
  zsh-syntax-highlighting
  zsh-autosuggestions
)
# Where to get them from (and the theme).
source $ZSH/oh-my-zsh.sh

# Language of the zsh.
export LANG=en_US.UTF-8


# ========== CUSTOM ALIASES ==========

#Costum aliases:
alias mv="mv -i"
alias topc="top -o cpu -s3"   # <-- Show CPU usage
alias topm="top -o mem -s3"   # <-- Show MEM usage
alias bluetoothd="system_profiler SPBluetoothDataType" # <-- list mac-addr's of bluetooth devices

#CD shortcuts.
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../.."
alias sem="cd /Users/asgerlysdahl/Itu/"
alias desk="cd /Users/asgerlysdahl/Desktop/"
alias dl="cd ~/Downloads"
alias app="cd /Applications"

#alias for language
alias re="omz reload"
alias py="python3"
alias gradlew="./gradlew"

# History, grep & files
alias history="history 0"     # <-- Show entire history
alias h='history'
alias gh="history | grep"
alias old="ls -t -1"
alias count="find . -type f | wc -l"

# Aplication shortcuts
alias disc="cd /Applications && open Discord.app && cd - > /dev/null"
alias lrnit="open https://learnit.itu.dk/my/"
alias sed="sed -E"

# ========================================
# ========== PATHS & ENVIRONMENT =========
# ========================================

source ~/.zsh_env_vars

# Algorithms library 
export CLASSPATH=".:$HOME/JavaExtension/algs4.jar"
# Følger installation https://github.itu.dk/pages/algorithms/ads-website-spring-2022/software/

#SDKMAN ENV VARIABLES AND SETIINGS
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# DOTNET F# AND C# HOMES.
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

#MY PATH:
path+=('/opt/homebrew/bin')                                          #Brew
path+=('/Users/asgerlysdahl/.sdkman/candidates/java/current/bin')    #SDKman (Java)
path+=('/Library/Frameworks/Python.framework/Versions/3.10/bin')     #Python
path+=('/usr/local/bin')
path+=('/Users/asgerlysdahl/.dotnet/tools')                          #Dotnet
path+=('/opt/homebrew/opt/libpq/bin')                                #psql
path+=('/usr/bin':'/bin')
path+=('/usr/sbin':'/sbin')
path+=('/opt/X11/bin')
path+=('/Library/Apple/usr/bin')
path+=('/opt/homebrew/Cellar/gradle/8.0.1/bin')                      #Gradle
path+=('/opt/homebrew/Cellar/maven/3.9.0/bin')                       #Maven
path+=('/usr/local/bin/dotnet' $PATH)
export PATH

########################## CUSTOM SCRIPTS & FUNCTIONS ############################## 

autoload -Uz ~/.zfunc/jcar  # <-- java run script
autoload -Uz ~/.zfunc/fcount  # <-- file count 
autoload -Uz ~/.zfunc/rcount # <-- file count recursive 
autoload -Uz ~/.zfunc/gccr  # <-- C-lang run script
autoload -Uz ~/.zfunc/ip  # <-- Kali style "ip a"
