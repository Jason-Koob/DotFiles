#! /bin/bash
sudo apt-get install wget
pacman -S wget
 
### Productive

# [ ] VS Code
# [ ] Firefox
# [ ] Oracle VirtualBox (Optional)
# [ ] Nmap
# [ ] Nano (Linux Only)

### Personal Use (Optional)

# [ ] Spotify
# [ ] Discord
# [ ] Steam
# [ ] Microsoft Minecraft Launcher
# [ ] CurseForge


# install updates (optional)
# apt update -y
# apt upgrade -y

function install () {
    echo "Installing '$programInstall' and logging the process to: '$outputfile'"
    echo 
}

function update () {
    echo "Updating '$programUpdate' and logging the process to: '$outputfile'"
    echo 
    
}

function menu () {
    echo 
    echo "Enter $0 -h to view this again."
    echo 'Please select whether to install (-i) or update (-u) any of the following programs (0-9):'
    echo 'Productive:'
    echo 
    echo ' 0. VS Code'
    echo ' 1. Firefox'
    echo ' 2. Oracle VirtualBox (Optional)'
    echo ' 3. Nmap'
    echo ' 4. Nano'
    echo 
    echo 'Personal Use (Optional):'
    echo 
    echo ' 5. Spotify'
    echo ' 6. Discord'
    echo ' 7. Steam'
    echo ' 8. Minecraft Launcher'
    echo ' 9. CurseForge'
}

if [[ $# -eq 0 || "$1" == "-h" ]]; then
    echo 'Try again:'
    menu
    exit 0
fi

while getopts ":h:i:u:o" opt; do
    case $opt in
        i) # Install programs
            programInstall=$OPTARG
                install $programInstall
                ;;
        u) # Update programs
            programUpdate=$OPTARG
                update $programUpdate
                ;;
        o) # Logging
            outputfile=$OPTARG
                if [ -f "$outputfile" ]; then
                    echo "Error: Output file '$outputfile' does not exist."
                    exit 1
                fi
                echo 'Yippee' >> $outputfile
                ;;
        \?) # any other option
            echo "Invalid option: -$OPTARG"
                menu
                exit 0
                ;;

        :) # no argument
            echo "Option -$OPTARG requires an argument."
                menu
                exit 1
                ;;
    esac
done