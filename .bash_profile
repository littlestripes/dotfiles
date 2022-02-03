export GOPATH=/Users/administrator/go
export PATH=/usr/local/opt:$PATH:/usr/local/bin/:/Library/Frameworks/Python.framework/Versions/3.9/bin:$GOPATH/bin
export LANG=en_us.UTF-8

# personal aliases/command prompt

. "$HOME/.cargo/env"

alias ..='cd ..'
alias ...='cd ../..'
alias vim='/usr/local/bin/vim'
alias vpnip='curl ifconfig.co/city && curl ip.me'
alias weather='curl wttr.in/?0m'
alias python='python3'
alias note='cd ~/Documents/notes'
alias ddg='links duckduckgo.com'
alias code='cd ~/Desktop/code'
alias z='zsh'
alias l='ls -alh'

export SUDO_EDITOR='vim'
export EDITOR='vim'
export PS1="\e[1;31m\u\e[0m is in \e[1;37m\w\e[0m and wants to\n? "

hour=$(date +%H)

if [ $hour -gt 17 ] || [ $hour -lt 5 ]; then
	echo "good evening King" | figlet -f smslant | lolcat && echo;
elif [ $hour -gt 12 ]; then
	echo "good day King" | figlet -f smslant | lolcat && echo;
else echo "good morning King" | figlet -f smslant | lolcat && echo;
fi

# NOTE: To display all available toilet fonts use this one-liner:
#       for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done

# Setup for 92 character wide terminal
DateColumn=34 # Default is 27 for 80 character line, 34 for 92 character line
TimeColumn=61 # Default is 49 for   "   "   "   "    61 "   "   "   "

# Replace Edmonton with your city name, GPS, etc. See: curl wttr.in/:help
curl wttr.in/Minneapolis?0?m --silent --max-time 3 > /tmp/now-weather
# Timeout #. Increase for slow connection---^

# Was valid weather report found or an error message?
WeatherSuccess=true
cat /tmp/now-weather
rm -f /tmp/now-weather
#    WeatherSuccess=false
#    echo "+============================+"
#    echo "| Weather unavailable now!!! |"
#    echo "| Check reason with command: |"
#    echo "|                            |"
#    echo "| curl wttr.in/Minneapolis?0 |" # Replace Edmonton with your city
#    echo "|   --silent --max-time 3    |"
#    echo "+============================+"
#    echo " "
echo " "                # Pad blank lines for calendar & time to fit
echo

#--------- DATE -------------------------------------------------------------

# calendar current month with today highlighted.
# colors 00=bright white, 31=red, 32=green, 33=yellow, 34=blue, 35=purple,
#        36=cyan, 37=white

tput sc                 # Save cursor position.
# Move up 9 lines
i=0
while [ $((++i)) -lt 10 ]; do tput cuu1; done

tput cuf $DateColumn    # Position to column 27 for date display

# -h needed to turn off formating: https://askubuntu.com/questions/1013954/bash-substring-stringoffsetlength-error/1013960#1013960
cal > /tmp/terminal1
# -h not supported in Ubuntu 18.04. Use second answer: https://askubuntu.com/a/1028566/307523
tr -cd '\11\12\15\40\60-\136\140-\176' < /tmp/terminal1  > /tmp/terminal

CalLineCnt=1
Today=$(date +"%e")

printf "\033[32m"   # color green -- see list above.

while IFS= read -r Cal; do
    printf "%s" "$Cal"
    if [[ $CalLineCnt -gt 2 ]] ; then
        # See if today is on current line & invert background
        tput cub 22
        for (( j=0 ; j <= 18 ; j += 3 )) ; do
            Test=${Cal:$j:2}            # Current day on calendar line
            if [[ "$Test" == "$Today" ]] ; then
                printf "\033[7m"        # Reverse: [ 7 m
                printf "%s" "$Today"
                printf "\033[0m"        # Normal: [ 0 m
                printf "\033[32m"       # color green -- see list above.
                tput cuf 1
            else
                tput cuf 3
            fi
        done
    fi

    tput cud1               # Down one line
    tput cuf $DateColumn    # Move 27 columns right
    CalLineCnt=$((++CalLineCnt))
done < /tmp/terminal

printf "\033[00m"           # color -- bright white (default)
echo ""

tput rc                     # Restore saved cursor position.


#-------- TIME --------------------------------------------------------------

tput sc                 # Save cursor position.
# Move up 8 lines
i=0
while [ $((++i)) -lt 9 ]; do tput cuu1; done
tput cuf $TimeColumn    # Move 49 columns right

# Do we have the toilet package?
if hash toilet 2>/dev/null; then
    echo " $(date +"%I:%M") " | \
        toilet -f future --filter border > /tmp/terminal
# Do we have the figlet package?
elif hash figlet 2>/dev/null; then
#    echo $(date +"%I:%M") | figlet > /tmp/terminal
    date +"%H:%M" | figlet > /tmp/terminal
# else use standard font
else
#    echo $(date +"%I:%M") > /tmp/terminal
    date +"%I:%M" > /tmp/terminal
fi

while IFS= read -r Time; do
    printf "\033[01;36m"    # color cyan
    printf "%s" "$Time"
    tput cud1               # Up one line
    tput cuf $TimeColumn    # Move 49 columns right
done < /tmp/terminal

tput rc                     # Restore saved cursor position.
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/ruby/bin:$PATH"
