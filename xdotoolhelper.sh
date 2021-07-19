#!/bin/bash
echo 'Hello, Where should I put the executable script? (Example: /home/user/Desktop/Script.sh)'
read scriptPath
touch $scriptPath
sudo chmod +x $scriptPath
sudo printf "#!/bin/bash \n# Auto-generated file from xdotoolhelper \n" > $scriptPath
echo 'Hello, what would you like to add?'
echo '(1) Tap Keyboard Key'
echo '(2) Tap Mouse Button'
echo '(3) Hold Keyboard Key'
echo '(4) Hold Mouse Button'
while true ; do
    read MacroOption
    if [ $MacroOption == 1 ] ; then
        break
        elif [ $MacroOption == 2 ] ; then
            break
            elif [ $MacroOption == 3 ] ; then
                break
                elif [ $MacroOption == 4 ] ; then
                    break
    else
    echo 'Please choose an option (Example : 1)'
    fi
done
echo 'Would you like to make the inputs focus to a specific window? y/n'
while true ; do
    read WindowFocus
    if [ $WindowFocus == y ] ; then
        break
    elif [ $WindowFocus == n ] ; then
        break
    else
    echo 'Please choose either y or n'
    fi
done
if [ $WindowFocus == y ] ; then
    echo 'What is the name of the window?'
    read WindowName     
fi
if [ $MacroOption == 1 ] ; then
    echo 'What key would you like to press?'
    read key
    elif [ $MacroOption == 2 ] ; then
        echo 'What mouse button would you like to press? (LMB = 1 RMB =2)'
        read mb
        elif [ $MacroOption == 3 ] ; then
            echo 'What key would you like to press?'
            read key
            echo 'How long would you like the button to be held? (Example : 10s)'
            read holdtime
            elif [ $MacroOption == 4 ] ; then
                echo 'What mouse button would you like to press? (LMB = 1 RMB =2)'
                read mb
                echo 'How long would you like the button to be held? (Example : 10s)'
                read holdtime
fi
echo 'Generating Script'
if [ $WindowFocus == y ] ; then
    sudo printf "xdotool search --name  ${WindowName}  \n\n" >> $scriptPath
fi
if [ $MacroOption == 1 ]; then
    sudo printf "xdotool key ${key}\n" >> $scriptPath
    elif [ $MacroOption == 2 ]; then
        sudo printf "xdotool click ${mb}\n" >> $scriptPath
        elif [ $MacroOption == 3 ]; then
            sudo printf "xdotool keydown ${key}\nsleep ${holdtime}\nxdotool keyup ${key}\n" >> $scriptPath
                elif [ $MacroOption == 4 ]; then
                    sudo printf "xdotool mousedown ${mb}\nsleep ${holdtime}\nxdotool mouseup ${mb}\n" >> $scriptPath
fi
echo 'Done, Would you like to add more? y/n'
read again
if [ $again != y ]; then 
    exit
fi
while true; do
    echo 'What else would you like to add?'
    echo '(1) Tap Keyboard Key'
    echo '(2) Tap Mouse Button'
    echo '(3) Hold Keyboard Key'
    echo '(4) Hold Mouse Button'
    while true ; do
        read MacroOption
        if [ $MacroOption == 1 ] ; then
            break
            elif [ $MacroOption == 2 ] ; then
                break
                elif [ $MacroOption == 3 ] ; then
                    break
                    elif [ $MacroOption == 4 ] ; then
                        break
        else
        echo 'Please choose an option (Example : 1)'
        fi
    done
    if [ $MacroOption == 1 ] ; then
        echo 'What key would you like to press?'
        read key
        elif [ $MacroOption == 2 ] ; then
            echo 'What mouse button would you like to press? (LMB = 1 RMB =2)'
            read mb
            elif [ $MacroOption == 3 ] ; then
                echo 'What key would you like to press?'
                read key
                echo 'How long would you like the button to be held? (Example : 10s)'
                read holdtime
                elif [ $MacroOption == 4 ] ; then
                    echo 'What mouse button would you like to press? (LMB = 1 RMB =2)'
                    read mb
                    echo 'How long would you like the button to be held? (Example : 10s)'
                    read holdtime
    fi
    echo 'Appending Script'
    if [ $MacroOption == 1 ]; then
        sudo printf "xdotool key ${key}\n" >> $scriptPath
        elif [ $MacroOption == 2 ]; then
            sudo printf "xdotool click ${mb}\n" >> $scriptPath
            elif [ $MacroOption == 3 ]; then
                sudo printf "xdotool keydown ${key}\nsleep ${holdtime}\nxdotool keyup ${key}\n" >> $scriptPath
                    elif [ $MacroOption == 4 ]; then
                        sudo printf "xdotool mousedown ${mb}\nsleep ${holdtime}\nxdotool mouseup ${mb}\n" >> $scriptPath
    fi
    echo 'Done, Would you like to add more? y/n'
    read again
    if [ $again != y ]; then 
        exit
    fi
done
