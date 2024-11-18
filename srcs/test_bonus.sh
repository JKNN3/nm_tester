#!/bin/bash

green="\e[32m"
red="\e[31m"
pink="\e[38;2;255;182;193m"
blue="\e[38;2;102;178;255m"
purple="\e[38;2;150;150;255m"
endcolor="\e[0m"

filename=tests.txt
filename_bonus=srcs/tests_bonus.txt

ls ressources/ > "$filename"

echo -e "\n         $purple TESTS BONUS: $endcolor"


while read -r line_args; do
    echo -e "\n$pink test : $blue $line_args $endcolor"
    while read -r line; do
        nm ressources/"$line" $line_args > test_result_nm.txt
        ./ft_nm ressources/"$line" $line_args > test_result_ft_nm.txt

        if ! diff test_result_nm.txt test_result_ft_nm.txt > out; then
            echo -e " $red [NOT PASSED] $endcolor $line "
            echo -e "  $blue$line_args$endcolor $line " >> not_passed
            # echo -e "   diff:" ; cat out # uncomment line to print diff result
        else
            echo -e "   $green [PASSED]  $endcolor $line "
        fi
        rm test_result_nm.txt test_result_ft_nm.txt
    done < "$filename"
done < "$filename_bonus"

rm out
rm "$filename"
if [ -f not_passed ] ; then
    echo -e "\n$red    NOT PASSED:\n$endcolor"
    cat not_passed ; echo ""
else
    echo -e "\n$pink        EVERYTHING LOOKS FINE$endcolor\n"
fi

if  [ -f not_passed ] ; then
    rm not_passed
fi
