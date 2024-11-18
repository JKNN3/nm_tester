#!/bin/bash

#colors:
green="\e[32m"
red="\e[31m"
yellow="\e[93m"
end="\e[0m"
purple="\e[38;2;150;150;255m"
filename=tests.txt

ls ressources/ > $filename

echo -e "\n         $purple TESTS MANDATORY: $end\n"

while read -r line; do

	nm ressources/$line > test_result_nm.txt
	./ft_nm ressources/$line > test_result_ft_nm.txt

	if ! diff test_result_nm.txt test_result_ft_nm.txt; then
            echo -e " $red [NOT PASSED] $end $line "
            # echo -e "   diff:" ; cat out # uncomment next line to print the diff output
        else
            echo -e "   $green [PASSED]  $end $line "
	fi
	rm test_result_nm.txt test_result_ft_nm.txt
done < $filename

nm ft_nm ft_nm ft_nm > test_result_nm.txt
./ft_nm ft_nm ft_nm ft_nm > test_result_ft_nm.txt

if ! diff --text test_result_nm.txt test_result_ft_nm.txt; then
        echo -e " $red [NOT PASSED] $end handle three files "
        # echo -e "   diff:" ; cat out # uncomment next line to print the diff output
    else
        echo -e "   $green [PASSED]  $end handle many files "
fi

rm test_result_nm.txt test_result_ft_nm.txt
rm $filename
