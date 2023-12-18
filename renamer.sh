#!/bin/bash

oldname=0
just=0

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

exit 0
