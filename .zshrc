# Path to your oh-my-zsh installation.
export ZSH="/Users/administrator/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wedisagree"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
 ZSH_THEME_RANDOM_CANDIDATES=( "dogenpunk" "fino-time" "fino" "funky" "jnrowe" "jonathan" "kennethreitz" "nanotech" "simonoff" "trapd00r" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python rust thefuck aliases)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR='vim'
export GOPATH=/Users/administrator/go
export LANG=en_us.UTF-8

# personal aliases/command prompt

. "$HOME/.cargo/env"

alias ..='cd ..'
alias ...='cd ../..'
alias vim='/usr/local/bin/vim'
alias vpnip='curl ifconfig.co/city && curl ip.me'
alias weather='curl "wttr.in/?0m"'
alias python='python3'
alias note='cd ~/Documents/notes'
alias ddg='links duckduckgo.com'
alias code='cd ~/Desktop/code'
alias 100days='cd ~/Desktop/code/python/100days && source venv/bin/activate'
alias z='zsh'
alias l='ls -alh'
alias make='gmake'
alias gcc11='/opt/local/bin/x86_64-apple-darwin18-gcc-11.2.0'
alias gcc='gcc11'
alias lua='/opt/local/bin/lua'
alias odin='cd ~/Desktop/code/web/odin'
alias mcserver='cd ~/Desktop/game/Minecraft\ Server && ./server.sh'
alias mpv='open -a mpv'

export SUDO_EDITOR='vim'
export EDITOR='vim'

hour=$(date +%H)

if [ $hour -gt 17 ] || [ $hour -lt 5 ]; then
	echo "good evening King" | figlet -f smslant | lolcat && echo;
elif [ $hour -gt 12 ]; then
	echo "good day King" | figlet -f smslant | lolcat && echo;
else echo "good morning King" | figlet -f smslant | lolcat && echo;
fi

cal

## NOTE: To display all available toilet fonts use this one-liner:
##       for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done

## Setup for 92 character wide terminal
#DateColumn=34 # Default is 27 for 80 character line, 34 for 92 character line
#TimeColumn=61 # Default is 49 for   "   "   "   "    61 "   "   "   "

##curl "wttr.in/Minneapolis?0m" --silent --max-time 3 > /tmp/now-weather
### Timeout #. Increase for slow connection---^

### Was valid weather report found or an error message?
##WeatherSuccess=true
##cat /tmp/now-weather
##rm -f /tmp/now-weather
###    WeatherSuccess=false
###    echo "+============================+"
###    echo "| Weather unavailable now!!! |"
###    echo "| Check reason with command: |"
###    echo "|                            |"
###    echo "| curl wttr.in/Minneapolis?0 |" # Replace Edmonton with your city
###    echo "|   --silent --max-time 3    |"
###    echo "+============================+"
###    echo " "
##echo " "                # Pad blank lines for calendar & time to fit
##echo

##--------- DATE -------------------------------------------------------------

## calendar current month with today highlighted.
## colors 00=bright white, 31=red, 32=green, 33=yellow, 34=blue, 35=purple,
##        36=cyan, 37=white

#tput sc                 # Save cursor position.
## Move up 9 lines
#i=0
#while [ $((++i)) -lt 10 ]; do tput cuu1; done

#tput cuf $DateColumn    # Position to column 27 for date display

## -h needed to turn off formating: https://askubuntu.com/questions/1013954/bash-substring-stringoffsetlength-error/1013960#1013960
#cal > /tmp/terminal1
## -h not supported in Ubuntu 18.04. Use second answer: https://askubuntu.com/a/1028566/307523
#tr -cd '\11\12\15\40\60-\136\140-\176' < /tmp/terminal1  > /tmp/terminal

#CalLineCnt=1
#Today=$(date +"%e")

#printf "\033[32m"   # color green -- see list above.

#while IFS= read -r Cal; do
    #printf "%s" "$Cal"
    #if [[ $CalLineCnt -gt 2 ]] ; then
        ## See if today is on current line & invert background
        #tput cub 22
        #for (( j=0 ; j <= 18 ; j += 3 )) ; do
            #Test=${Cal:$j:2}            # Current day on calendar line
            #if [[ "$Test" == "$Today" ]] ; then
                #printf "\033[7m"        # Reverse: [ 7 m
                #printf "%s" "$Today"
                #printf "\033[0m"        # Normal: [ 0 m
                #printf "\033[32m"       # color green -- see list above.
                #tput cuf 1
            #else
                #tput cuf 3
            #fi
        #done
    #fi
    #tput cud1               # Down one line
    #tput cuf $DateColumn    # Move 27 columns right
    #CalLineCnt=$((++CalLineCnt))
#done < /tmp/terminal

#printf "\033[00m"           # color -- bright white (default)
#echo ""

#tput rc                     # Restore saved cursor position.


##-------- TIME --------------------------------------------------------------

#tput sc                 # Save cursor position.
## Move up 8 lines
#i=0
#while [ $((++i)) -lt 9 ]; do tput cuu1; done
#tput cuf $TimeColumn    # Move 49 columns right

## Do we have the toilet package?
#if hash toilet 2>/dev/null; then
    #echo " $(date +"%I:%M") " | \
        #toilet -f future --filter border > /tmp/terminal
## Do we have the figlet package?
#elif hash figlet 2>/dev/null; then
##    echo $(date +"%I:%M") | figlet > /tmp/terminal
    #date +"%H:%M" | figlet > /tmp/terminal
## else use standard font
#else
##    echo $(date +"%I:%M") > /tmp/terminal
    #date +"%I:%M" > /tmp/terminal
#fi

#while IFS= read -r Time; do
    #printf "\033[01;36m"    # color cyan
    #printf "%s" "$Time"
    #tput cud1               # Up one line
    #tput cuf $TimeColumn    # Move 49 columns right
#done < /tmp/terminal

#tput rc                     # Restore saved cursor position.

export CPATH="/usr/local/include:/usr/local/include/gtk-3.0"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig"
eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }

# one path to rule them all	    
export PATH="/usr/local/go/bin:/opt/local/bin:/usr/local/opt/binutils/bin:/usr/local/opt/ruby/bin:/usr/local/opt/openssl@3/bin:/usr/local/opt:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/administrator/.cargo/bin:/usr/local/bin/:/Library/Frameworks/Python.framework/Versions/3.9/bin:/usr/local/bin/:/Library/Frameworks/Python.framework/Versions/3.9/bin:/Users/administrator/go/bin:/Users/administrator/go/bin:~/.local/bin"
export PATH="$PATH:/usr/local:/opt:/usr/bin:/bin:/usr/sbin:/Users/administrator/.cargo/bin:/Users/administrator/go/bin:~/.local/bin:/Library/Frameworks/Python.framework/Versions/3.9/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
