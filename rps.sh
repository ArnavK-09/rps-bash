#!/bin/bash

# Intro and commands
printf "\n\e[1m\e[93m\e[1m██████╗░██████╗░░██████╗██╗\n██╔══██╗██╔══██╗██╔════╝██║\n██████╔╝██████╔╝╚█████╗░██║\n██╔══██╗██╔═══╝░░╚═══██╗╚═╝\n██║░░██║██║░░░░░██████╔╝██╗\n╚═╝░░╚═╝╚═╝░░░░░╚═════╝░╚═╝\e[0m\n"
printf "\e[36m\n\n\t Instructions:-\n\t\tR - Rock\n\t\tP - Paper\n\t\tS - Scissor\n\n\e[0m"
printf "\e[94mType 'exit' to exit the game\n\n\e[0m"

# All choices
choices=("r" "p" "s")

# Function to check whether the user won or not
userWon() {
    # Function parameters
    local userChoice=$1
    local botChoice=$2
    
    # Check if won
    if [ "$userChoice" == "r" ] && [ "$botChoice" == "s" ]; then
        return 1
        elif [ "$userChoice" == "p" ] && [ "$botChoice" == "r" ]; then
        return 1
        elif [ "$userChoice" == "s" ] && [ "$botChoice" == "p" ]; then
        return 1
        elif [ "$userChoice" == "$botChoice" ]; then
        # Draw
        return 0
    else
        # Loose
        return 0
    fi
}

# Function to notify user if won
notifyUser() {
    # Choice of user
    local choice=$1
    
    # Notify if won
    if (userWon $choice $botChoice); then
        printf "\e[95mYou \e[91mLoose \e[95mor \e[91mGame Draw\e[0m"
    else
        printf "\e[92mCongratulations!\e[32mYou \e[1mWon! 🎉\e[0m"
    fi
}

# Game loop
while true; do
    # User input
    printf "\n\e[4m\nWhat Would You Choose? \e[0m"
    read userChoice
    
    # Bot choice
    botChoice=${choices[$(( $RANDOM % 3 ))]}
    
    # Check input
    case $userChoice in
        "r" | "rock")
            notifyUser "r" $botChoice
        ;;
        "p" | "paper")
            notifyUser "p" $botChoice
        ;;
        "s" | "scissor")
            notifyUser "s" $botChoice
        ;;
        "exit" | "break")
            printf "\e[1m\e[31mExiting...\n\e[0m"
            exit 0
        ;;
        *)
            printf "\e[1m\e[31mInvalid Command/Choice\e[0m"
        ;;
    esac
done
