# Function to handle command not found
command_not_found_handle() {
    /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

# Add all icon code
HOME_ICON="\uf002"  # Home icon
FOLDER_ICON="\uf07b"  # Folder icon
BASH_ICON="\uf489"  # Bash script icon
JS_ICON="\uf3b8"  # JavaScript file icon
PYTHON_ICON="\uf3c8"  # Python file icon
JAVA_ICON="\uf1f9"  # Java file icon
RUBY_ICON="\uf1f9"  # Ruby file icon (using Java icon as a placeholder)
PHP_ICON="\uf457"  # PHP file icon
ERROR_ICON="\uf00d"  # Error icon for file not found
PKGS="\uf8d6"  # Package icon (you can change this to any other icon)

# Function to determine the icon based on the current directory or file type
get_icon() {
    local dir_or_file="$1"
    
    # Check if the file or directory exists
    if [[ ! -e "$dir_or_file" ]]; then
        echo -n "$ERROR_ICON"  # File or directory not found
        return
    fi

    if [[ "$dir_or_file" == "$HOME" ]]; then
        echo -n "$HOME_ICON"  # Home directory
    elif [[ -d "$dir_or_file" ]]; then
        echo -n "$FOLDER_ICON"  # Directory
    elif [[ "$dir_or_file" == *.sh ]]; then
        echo -n "$BASH_ICON"  # Bash script
    elif [[ "$dir_or_file" == *.js ]]; then
        echo -n "$JS_ICON"  # JavaScript file
    elif [[ "$dir_or_file" == *.py ]]; then
        echo -n "$PYTHON_ICON"  # Python file
    elif [[ "$dir_or_file" == *.java ]]; then
        echo -n "$JAVA_ICON"  # Java file
    elif [[ "$dir_or_file" == *.rb ]]; then
        echo -n "$RUBY_ICON"  # Ruby file
    elif [[ "$dir_or_file" == *.php ]]; then
        echo -n "$PHP_ICON"  # PHP file
    else
        echo -n "$PKGS"  # Default package icon
    fi
}


# Set the prompt string
PS1='\n\[\e[36m\]┌─[\[\e[37m\]\T\[\e[36m\]]─────\e[1;93m[SIMU]\e[0;36m───[\#]\n|\n\e[0;36m└─[\[\e[36m\]\e[0;0m$(get_icon "$PWD")\W\[\e[36m\]]────╼► \e[1;92m'

# Clear the terminal
clear

# Define color codes
r='\033[91m'
p='\033[1;95m'
y='\033[93m'
g='\033[92m'
n='\033[0m'
b='\033[94m'
c='\033[96m'

# Define symbols
X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
D='\033[1;92m[\033[1;00m〄\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;32m]\033[1;92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
aHELL="\uf489"
USER="\uf007"
TERMINAL="\ue7a2"
PKGS="\uf8d6"

spin() {
clear
banner
    local pid=$!
    local delay=0.40
    local spinner=('█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█')

    while ps -p $pid > /dev/null; do
        for i in "${spinner[@]}"; do
            tput civis
            echo -ne "\033[1;96m\r [+] Downloading..please wait.........\e[33m[\033[1;92m$i\033[1;93m]\033[1;0m   "
            sleep $delay
            printf "\b\b\b\b\b\b\b\b"
        done
    done
    printf "   \b\b\b\b\b"
    tput cnorm
    printf "\e[1;93m [Done]\e[0m\n"
    echo
    sleep 1
}

CODEX="https://dx-codex-vs.glitch.me"
cd $HOME
D1=".termux"
VERSION="$D1/dx.txt"
if [ -f "$VERSION" ]; then
    version=$(cat "$VERSION")
else
    echo "1 1.1" > "$VERSION"
    version=$(cat "$VERSION")
fi

banner() {
clear
echo
echo -e "    ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
echo -e "    ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
echo -e "    ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
echo -e "    ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
echo -e "    ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
echo -e "    ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
echo
}
udp() {
    clear
    messages=$(curl -s "$CODEX/check_version" | jq -r --arg vs "$version" '.[] | select(.message == $vs) | .message')

# Check if any messages were found and display them
if [ -n "$messages" ]; then
    banner  # Assuming you have a function named 'banner'
    echo -e " ${A} ${c}Tools Updated ${n}| ${c}New ${g}$messages"
    sleep 3
    git clone https://github.com/DARK-H4CKER01/CODEX.git &> /dev/null &
    spin
    cd CODEX
     bash install.sh
else
    echo ""
    clear
fi
}

load() {
clear
echo -e " ${TERMINAL}${r}●${n}"
sleep 0.2
clear
echo -e " ${TERMINAL}${r}●${y}●${n}"
sleep 0.2
clear
echo -e " ${TERMINAL}${r}●${y}●${b}●${n}"
sleep 0.2
}
widths=$(stty size | awk '{print $2}')  # Get terminal width
width=$(tput cols)
var=$((width - 1))
var2=$(seq -s═ ${var} | tr -d '[:digit:]')
var3=$(seq -s\  ${var} | tr -d '[:digit:]')
var4=$((width - 20))

PUT() { echo -en "\033[${1};${2}H"; }
DRAW() { echo -en "\033%"; echo -en "\033(0"; }
WRITE() { echo -en "\033(B"; }
HIDECURSOR() { echo -en "\033[?25l"; }
NORM() { echo -en "\033[?12l\033[?25h"; }
udp
HIDECURSOR
load
clear
echo -e " ${TERMINAL}${r}●${y}●${b}●${n}\033[36;1m"
echo "╔${var2}╗"
for ((i=1; i<=8; i++)); do
    echo "║${var3}║"
done
echo "╚${var2}╝"
PUT 4 0
figlet -c -f ASCII-Shadow -w $width SIMU | lolcat
PUT 3 0
echo -e "\033[36;1m"
for ((i=1; i<=7; i++)); do
    echo "║"
done
PUT 10 ${var4}
echo -e "\e[32m[\e[0m\uf489\e[32m] \e[36mCODEX \e[36m1 1.0\e[0m"
PUT 12 0
ads1=$(curl -s "$CODEX/ads" | jq -r '.[] | .message')

# Check if ads1 is empty
if [ -z "$ads1" ]; then
    echo -e ""
else
    echo -e " ${g}[${n}${PKGS}${g}] ${c}This is for you: ${g}$ads1\n"
    fi
NORM
