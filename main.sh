#!/bin/bash

# get all args (extentions to import) in an array
args=()
while [[ "$#" -gt 0 ]]; do
    case $1 in
        *) args+=("$1");
    esac
    shift
done

# run tests
# No arg provided
if [ "${args[0]}" == "" ]; then
    echo "You need to provide at least one extention you want to import"
    exit 1 
fi

# No file with that extention
isFile=false
for ext in "${args[@]}"; do
    for f in *.$ext; do
        if [[ -f "$f" && "${f%.*}" != "index" ]]; then
            isFile=true
        fi
        # if start with number, exit with error
        if [[ "$f" =~ ^[0-9] ]]; then
            echo "Oups! Your file ($f) starts with a number. This will cause problems when importing in your index file"
            exit 1
        fi
    done
done

if [ "$isFile" = false ] ; then
    echo "No file found with extentions provided"
    exit 1
fi

# ask if js or ts
read -p 'Are you using ts or js? (ts by default) ' indexExt
if [ ! "$indexExt" = 'js' ]; then
    indexExt='ts'
fi

# check if there is already an index file
if [ -f "./index.$indexExt" ]; then
    read -p 'index file file already exist, do you wish to replace it? (Y/n) ' shouldRemove
    if [ "$shouldRemove" == 'n' ]; then
        echo "exiting"
        exit 0
    fi
    rm "./index.$indexExt"
    echo "Removed old index file"
fi


# main
touch "index.$indexExt"

for ext in "${args[@]}"; do
    for f in *."$ext"; do
        if [[ -f "$f" && "${f%.*}" != "index" ]]; then
            echo "import ${f%.*} from \"./$f\"" >> "index.$indexExt"
        fi
    done
done

echo "\nexport {" >> "index.$indexExt"

for ext in "${args[@]}"; do
    for f in *.$ext; do
        if [[ -f "$f" && "${f%.*}" != "index" ]]; then
            echo "    ${f%.*}," >> "index.$indexExt"
        fi
    done
done

echo "}" >> "index.$indexExt"

echo "Done!"
