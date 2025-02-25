#bin/bash/'!¡
clear
# dx color
r='\033[91m'
p='\033[95m'
y='\033[93m'
g='\033[92m'
n='\033[0m'
b='\033[94m'
c='\033[96m'

# dx Symbol
X='\033[92m[\033[00m⎯꯭̽𓆩\033[92m]\033[96m'
D='\033[92m[\033[00m〄\033[92m]\033[93m'
E='\033[92m[\033[00m×\033[92m]\033[91m'
A='\033[92m[\033[00m+\033[92m]\033[92m'
C='\033[92m[\033[00m</>\033[92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

# dx icon
    OS="\uf6a6"
    HOST="\uf6c3"
    KER="\uf83c"
    UPT="\uf49b"
    PKGS="\uf8d6"
    SH="\ue7a2"
    TERMINAL="\uf489"
    CHIP="\uf2db"
    CPUI="\ue266"
    HOMES="\uf015"

sp() {
    IFS=''
    sentence=$1
    second=${2:-0.05}
    for (( i=0; i<${#sentence}; i++ )); do
        char=${sentence:$i:1}
        echo -n "$char"
        sleep $second
    done
    echo
}

tr() {
# Check if curl is installed
if command -v curl &>/dev/null; then
    echo ""
else
    pkg install curl -y >/dev/null 2>&1
fi
}

# dx setup
setup() {
# dx move
ds="$HOME/.termux"
dx="$ds/font.ttf"
simu="$ds/colors.properties"
if [ -f "$dx" ]; then
    echo
else
	cp $HOME/CODEX/files/font.ttf "$ds"
fi

if [ -f "$simu" ]; then
    echo
else 
        
	cp $HOME/CODEX/files/colors.properties "$ds"
fi

cp $HOME/$PREFIX/etc/bash.bashrc "$ds"
cp $HOME/CODEX/files/bash.bashrc $PREFIX/etc/
cp $HOME/CODEX/files/ASCII-Shadow.flf $PREFIX/share/figlet/
mv $HOME/CODEX/files/remove /data/data/com.termux/files/usr/bin/
chmod +x /data/data/com.termux/files/usr/bin/remove
termux-reload-settings
}
dxnetcheck() {
clear
echo
echo -e "               ${g}╔═══════════════╗"
echo -e "               ${g}║ ${n}</>  ${c}DARK-X${g}   ║"
echo -e "               ${g}╚═══════════════╝"
echo -e "  ${g}╔════════════════════════════════════════════╗"
echo -e "  ${g}║  ${C} ${y}Checking Your Internet Connection¡${g}  ║"
echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
while true; do
    curl --silent --head --fail https://github.com > /dev/null
    if [ "$?" != 0 ]; then
echo -e "              ${g}╔══════════════════╗"
echo -e "              ${g}║${C} ${r}No Internet ${g}║"
echo -e "              ${g}╚══════════════════╝"
        sleep 2.5
    else
        break
    fi
done
clear
}

donotchange() {
clear
echo ""
echo ""
echo -e "${c}               __"
echo -e "       _(\    |${r}@@${c}|            ${g}Hey 👋 ${c}"
echo -e "      (__/\__ \--/ __    ${p}[Enter Your Name]${c}"
echo -e "         \___|----|  |   __"
echo -e "             \ ${p}][ ${c}/\ )_ / _\ "
echo -e "             /\__/\ \__O (__"
echo -e "            (--/\--)    \__/"
echo -e "            _)(  )(_"
echo -e "            ---  --- ${y}"
echo 
# Prompt the user for their name
read -p "[+]──[Enter Your Name]────► " name
echo
    sp " [+] Saved Your name (${name}) to banner" 0.1
    
    # Specify the input and output file names
    INPUT_FILE="$HOME/CODEX/files/bash.bashrc"
    # Temporary file for output

    # Use sed to replace SIMU with the name and save to a temporary file
    sed "s/SIMU/$name/g" "$INPUT_FILE" > "bash.bashrc"

    # Check if sed was successful
    if [[ $? -eq 0 ]]; then
        # Move the temporary file to the original file
        mv "bash.bashrc" "$HOME/CODEX/files/"
        echo -e " ${A} ${c}Successfully updated the file with your name."
        sleep 1
    else
        echo -e " ${E} ${r}Error occurred while processing the file."
        sleep 1
        rm "bash.bashrc" # Clean up the temporary file if sed fails
    fi
    
D1="$HOME/.termux"
VERSION="$D1/dx.txt"
    echo "version 1 1.1" > "$VERSION"
echo
clear
echo ""
echo ""
echo -e "${p}        💜     __"
echo -e "       _(\    |${b}@@${p}|         ${g}Hey 👋 ${p}"
echo -e "      (__/\__ \--/ __    ${C} ${g}$name${p}"
echo -e "         \___|----|  |   __"
echo -e "             \ ${c}][ ${p}/\ )_ / _\ "
echo -e "             /\__/\ \__O (__"
echo -e "            (--/\--)    \__/"
echo -e "            _)(  )(_"
echo -e "            ---  --- ${n}"
sleep 2
clear
echo ""
echo ""
echo -e "${p}        💛     __"
echo -e "       _(\    |${b}@@${p}|             ${c}$name${p}"
echo -e "      (__/\__ \--/ __    ${C} ${g}WELCOME${p}"
echo -e "         \___|----|  |   __"
echo -e "             \ ${c}][ ${p}/\ )_ / _\ "
echo -e "             /\__/\ \__O (__"
echo -e "            (--/\--)    \__/"
echo -e "            _)(  )(_"
echo -e "            ---  --- ${n}"
sleep 1
clear
echo ""
echo ""
echo -e "${p}        💖     __"
echo -e "       _(\    |${b}@@${p}|             ${c}$name${p}"
echo -e "      (__/\__ \--/ __    ${C} ${g}TO${p}"
echo -e "         \___|----|  |   __"
echo -e "             \ ${c}][ ${p}/\ )_ / _\ "
echo -e "             /\__/\ \__O (__"
echo -e "            (--/\--)    \__/"
echo -e "            _)(  )(_"
echo -e "            ---  --- ${n}"
sleep 1
clear
echo ""
echo ""
echo -e "${p}        🥰     __"
echo -e "       _(\    |${b}@@${p}|             ${c}$name${p}"
echo -e "      (__/\__ \--/ __    ${C} ${g}DARK BANNER${p}"
echo -e "         \___|----|  |   __"
echo -e "             \ ${c}][ ${p}/\ )_ / _\ "
echo -e "             /\__/\ \__O (__"
echo -e "            (--/\--)    \__/"
echo -e "            _)(  )(_"
echo -e "            ---  --- ${n}"
sleep 2
clear
}

banner() {
echo
echo
echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
echo -e "${y}               +-+-+-+-+-+-+-+-+-+"
echo -e "${c}               |B|Y|-|D|A|R|K|-|S|"
echo -e "${y}               +-+-+-+-+-+-+-+-+-+${n}"
echo
}
termux() {
    apt update >/dev/null 2>&1
    apt upgrade -y >/dev/null 2>&1
    pkg install git -y >/dev/null 2>&1
    pkg install python -y >/dev/null 2>&1
    pip install lolcat >/dev/null 2>&1
    pkg install ncurses-utils -y >/dev/null 2>&1
    pkg install jq -y >/dev/null 2>&1
    pkg install figlet -y >/dev/null 2>&1
    pkg install termux-api -y >/dev/null 2>&1
    pkg install lsd -y >/dev/null 2>&1
    termux-reload-settings
}


if [ -d "/data/data/com.termux/files/usr/" ]; then
    tr
    dxnetcheck
    donotchange
    banner
    echo -e " ${C} ${y}Detected Termux on Android¡"
	echo -e " ${lm}"
	echo -e " ${A} ${g}Updating Package..¡"
	echo -e " ${dm}"
    echo -e " ${A} ${g}Wait a few minutes.${n}"
    echo -e " ${lm}"
    sleep 3
    termux
    # dx check if D1DOS folder exists
    if [ -d "$HOME/CODEX" ]; then
        sleep 2
	clear
	banner
	echo -e " ${A} ${p}Updating Completed...!¡"
	echo -e " ${dm}"
	clear
	banner
	echo -e " ${C} ${c}Package Setup Your Termux..${n}"
	echo
	echo -e " ${A} ${g}Wait a few minutes.${n}"
	setup
	clear
        banner
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Termux¡¡ ${g}[${n}${HOMES}${g}]${n}"
	echo
	sleep 3
	cd "$HOME"
	rm -rf CODEX
	exit 0
	    else
        clear
        banner
    echo -e " ${E} ${r}Tools Not Exits Your Terminal.."
	echo
	echo
	sleep 3
	exit
    fi
else
echo -e " ${E} ${r}Sorry, this operating system is not supported ${p}| ${g}[${n}${HOST}${g}] ${SHELL}${n}"
echo 
echo -e " ${A} ${g} Wait for the next update using Linux...!¡"
    echo
	sleep 3
	exit
    fi
