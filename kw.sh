#!/bin/bash
for p in "$@";
do
    echo "";
    echo "### $p ###";
    grep -lr --color=auto ^Keywords:.*"$p".*$ /home/johan/notes/*.txt;
done;
