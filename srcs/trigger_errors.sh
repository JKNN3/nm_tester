#!/bin/bash

green="\e[32m"
red="\e[31m"
pink="\e[38;2;255;182;193m"
blue="\e[38;2;102;178;255m"
purple="\e[38;2;150;150;255m"
endcolor="\e[0m"

filename=srcs/trigger_errors.txt

echo -e "\n         $purple TESTS ERRORS: $endcolor"


echo -e "\n$pink test : $blue wrong permission $endcolor"
chmod 000 run
nm run
        # echo -e "               return: $?"
./ft_nm run
        # echo -e "               return: $?"
echo -e "(outputs not similar bcs we can't do it w the authorized functions)"

echo -e "\n$pink test : $blue wrong format $endcolor"
chmod 777 run
nm run
        # echo -e "               return: $?"
./ft_nm run
        # echo -e "               return: $?"

echo -e "\n$pink test : $blue is a directory $endcolor"
nm ressources/
        # echo -e "               return: $?"
./ft_nm ressources/
        # echo -e "               return: $?"

echo -e "\n$pink test : $blue no symbol (stripped binary) $endcolor"
nm srcs/ls
        # echo -e "               return: $?"
./ft_nm srcs/ls
        # echo -e "               return: $?"



while read -r line_args; do
    echo -e "\n$pink test : $blue $line_args $endcolor"

        nm $line_args
        # echo -e "               return: $?"
        ./ft_nm $line_args
        # echo -e "               return: $?"


done < "$filename"
