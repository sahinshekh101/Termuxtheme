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

# dx info
MODEL=$(getprop ro.product.model)
VENDOR=$(getprop ro.product.manufacturer)
LANGUAGE=$(getprop ro.product.locale.language)
VS=$(getprop ro.build.version.release)
UP=$(date +'%Y-%m-%d %H:%M')
IP=$(curl -s ipinfo.io/ip)
KERNEL=$(uname -r)
SHELL=$(basename $SHELL)
CPU=$(uname -m)
RAM=$(free | grep Mem | awk '{print $2 / 1024 / 1024}')
CPU_CORE=$(grep -c processor /proc/cpuinfo)
TM=$(date +"%T")

ROOT=$(df -h / | tail -1 | awk '{print $4}')
DATA=$(df -h /data | tail -1 | awk '{print $4}')


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
    HOME="\uf015"

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
ds="/.termux"
dx="$ds/font.ttf"
simu="$ds/colors.properties"
if [ -f "$dx" ]; then
    echo
else
	cd "$HOME"
	cp CODEX/files/font.ttf "$ds"
fi

if [ -f "$simu" ]; then
    echo
else
	cd "$HOME"
	cp CODEX/files/colors.properties "$ds"
fi
cd "$HOME"
cp $PREFIX/etc/bash.bashrc "$ds"
cd "$HOME"
cp CODEX/files/bash.bashrc $PREFIX/etc
cp CODEX/files/ASCII-Shadow.flf $PREFIX/share/figlet/
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
echo""
# Function to check if the name is 7 characters long
is_valid_name() {
    [[ ${#1} -eq 7 ]]
}

# Prompt the user for their name
read -p "[+]──[Enter Your Name]────► " name
echo

# Validate the name
if is_valid_name "$name"; then
    cd "$HOME" || exit 1  # Change to HOME directory, exit if it fails
    sp "Saved Your name (${name}) to banner"
    FILE="CODEX/files/bash.bashrc"  # Specify the output file name
    cat CODEX/files/bash.bashrc | sed "s/SIMU/$name/g" > "$FILE"
else
    echo "Enter a valid name (7 characters long)."
fi
cd "$HOME"
D1=".termux"
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
    cd "$HOME"
    # dx check if D1DOS folder exists
    if [ -d "CODEX" ]; then
        cd CODEX
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
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Termux¡¡ ${g}[${n}${HOME}${g}]${n}"
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
