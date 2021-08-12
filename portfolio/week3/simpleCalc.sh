#!/bin/bash

BLUE="\e[0;34m"
GREEN="\e[0;32m"
RED="\e[0;31m"
PURPLE="\e[0;35m"
NC="\e[0m"


echo "enter 2 integers"
read -p ">" a
read -p ">" b

echo "enter operation"
echo -e "${BLUE}1. ADD"
echo -e "${GREEN}2. SUBTRACT"
echo -e "${RED}3. MULTIPLY"
echo -e "${PURPLE}4. DIVIDE${NC}"

read choice

case $choice in
    1)
        result=`echo $a + $b | bc`
        echo -e "${BLUE}$a + $b = $result${NC}"
        exit 0
    ;;
    2)
        result=`echo $a - $b | bc`
        echo -e "${GREEN}$a - $b = $result${NC}"
        exit 0
    ;;
    3)
        result=`echo $a \* $b | bc`
        echo -e "${RED}$a x $b = $result${NC}"
        exit 0
    ;;
    4)
        result=`echo $a / $b | bc`
        echo -e "${PURPLE}$a / $b = $result${NC}"
        exit 0
    ;;
    *)
        echo "INVALID OPERATION"
        exit 0
    ;;
esac

echo $result
