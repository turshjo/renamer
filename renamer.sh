#!/bin/bash

# значения по умолчанию
oldname=0
pr=0
just=0

#опции
while getopts ":hdv" opt; do
    pr=1
    if [ $opt != "--" ]; then
        case $opt in
	      h)echo 'USAGE: renamer suffix [-h] [-v] [-d] [--] file
-h - output format help and output
-d - "dry launch" - output the original and new file names without renaming
-v - output the names of files to be renamed
-- - separator for options and file names'
	      ;;
	    v)oldname=1
	      ;;
	    d)just=1
	      ;;
          \?)echo "Wrong option"
	      exit 1
	      ;;
        esac
    fi
done

# доходим до аргументов и проверяем есть ли они
if [ $pr -eq 1 ]; then
    shift
fi

if [ "$1" == "--" ]; then
    echo "1=--"
    shift
fi

if [ $# -lt 2 ]; then
    echo "enter the suffix"
    echo "enter the files to rename"
    exit 1
fi

if [ $# -lt 2 ]; then
    echo "enter the files to rename"
    exit 1
fi

#суффикс
suffix=$1

shift


exit 0
