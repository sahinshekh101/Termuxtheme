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
PS1='\n\[\e[36m\]┌─[\[\e[37m\]\T\[\e[36m\]]─────\e[1;93m[SIMU]\e[0;36m───[\#]\n|\n\e[0;36m└─[\[\e[36m\]\e[0;0m$(get_icon "$PWD") \W\[\e[36m\]]────► \e[1;92m'
export PS1
