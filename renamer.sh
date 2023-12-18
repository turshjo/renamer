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



for file in "$@"; do
# проверка файла
    if [ ! -e "$file" ]; then
	echo "the file "$file" does not exist"
	continue
    fi

    if [ ! -w "$file" ]; then
	echo "the file "$file" cannot be modified"
	continue
    fi

    ffile=$(basename "$file")

    extension="${ffile##*.}"

    filename="${ffile%.*}"

    new_filename="${filename}$suffix.${extension}"

    dir=$(dirname "$file")
    
# проверка нового файла
    if [ -e "$new_filename" ]; then
        echo "file "$new_filename" is already exist"
        continue
    fi

# -v
    if [ $oldname -eq 1 ]; then
        echo -n ""$ffile" --> "
    fi

    way_newfilename="$dir/$new_filename"

    echo "$way_newfilename"

# !-d
    if [ $just -eq 0 ]; then
        mv "$file" "$way_newfilename"
    fi

done

exit 0
