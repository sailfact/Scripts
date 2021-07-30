#!/bin/bash 
      
secret='shhh' #Don't tell anyone! 
read -s -p "what's the secret code?" 
      
echo       
#if the user types in the correct secret, tell them they got it right! 

if [ "$secret" == "$REPLY" ]; then
    echo "You got it right!"
    correct=true
else
    echo "you got it wrong :("
    correct=false
fi

case $correct in
    true)
        echo "you have unlocked the secret menu!"
        #TODO: add secret menu
    ;;
    false)
        echo "Go Away!" #people who get it wrong need to be told to go away!
    ;;
esac