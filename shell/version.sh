#!/usr/local/bin sh

FILE="version.txt"
str=`cat ${FILE}`

if [[ $# == 1 ]]; then
    array=(${str//./ })
    index=-1
    if [[ $1 == "major" ]]; then
		index=0
        array[1]=0
        array[2]=0
	elif [[ $1 == "minor" ]]; then
        index=1
        array[2]=0
    elif [[ $1 == "patch" ]]; then
        index=2
    else
        echo "Usage: ${0} [major|minor|patch]"
    fi
    (( array[${index}]++ ))
    echo "${array[0]}.${array[1]}.${array[2]}" > ${FILE}
else
	echo ${str}
fi
