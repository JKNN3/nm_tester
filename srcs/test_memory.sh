#!/bin/bash

#colors:
green="\e[32m"
red="\e[31m"
yellow="\e[93m"
endcolor="\e[0m"
purple="\e[38;2;150;150;255m"
logfile="logfile"

echo -e "\n         $purple TESTS MEMORY: $endcolor\n"

        # mandatory fd closed test
valgrind --track-fds=yes --log-file=$logfile ./ft_nm ft_nm > tmp
if cat $logfile | grep 'Open file descriptor 3' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: mandatory : no open fd"
else
    echo -e " $red [NOT PASSED] $endcolor: mandatory :  open fd"
    cat tmp
fi
        # mandatory fd closed 2 files test
valgrind --track-fds=yes --log-file=$logfile ./ft_nm ft_nm ft_nm > tmp
if cat $logfile | grep 'Open file descriptor 3' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: mandatory 2 files: no open fd"
else
    echo -e " $red [NOT PASSED] $endcolor: mandatory 2 files : open fd"
    cat tmp
fi
        # mandatory leak test
valgrind --log-file=$logfile ./ft_nm ft_nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: mandatory leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: mandatory leak test : valgrind ./ft_nm ft_nm"
fi
        # mandatory wrong file leak test
valgrind 2>tmp --log-file=$logfile ./ft_nm nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: mandatory wrong file leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: mandatory wrong file leak test :  valgrind ./ft_nm nm"
fi
        # bonus fd closed test
valgrind 2>tmp --track-fds=yes --log-file=$logfile ./ft_nm -u ft_nm > tmp
if cat $logfile | grep 'Open file descriptor 3' > tmp; then
    echo -e "   $green [PASSED]   $endcolor: bonus no open fd"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus fd not closed : open fd"
    cat tmp
fi
        # bonus fd closed 2 files test
valgrind 2>tmp --track-fds=yes --log-file=$logfile ./ft_nm -u ft_nm ft_nm > tmp
if cat $logfile | grep 'Open file descriptor 3' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: bonus 2 files no open fd"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus with 2 files fd not closed : open fd"
    cat tmp
fi
        # bonus leak test
valgrind 2>tmp --log-file=$logfile ../ft_nm -u ft_nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: bonus leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus leak test : check w valgrind"
fi
        # bonus wrong file leak test
valgrind 2>tmp --log-file=$logfile ./ft_nm -u nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: bonus wrong file leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus wrong file leak test : check w valgrind"
fi        # bonus leak test
valgrind 2>tmp --log-file=$logfile ../ft_nm -u ft_nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: bonus leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus leak test : check w valgrind"
fi
        # bonus wrong file leak test
valgrind 2>tmp --log-file=$logfile ./ft_nm -u nm > tmp
if cat $logfile | grep 'no leaks are possible' > tmp ; then
    echo -e "   $green [PASSED]   $endcolor: bonus wrong file leak test : no leak"
else
    echo -e " $red [NOT PASSED] $endcolor: bonus wrong file leak test : check w valgrind"
fi

    echo -e ""

if [ -f tmp ] ; then
    rm tmp
fi

if [ -f logfile ] ; then
    rm logfile
fi

