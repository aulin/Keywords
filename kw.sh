#!/bin/bash

# List those notes that contain the given keyword
# among their keywords or in their title.

directory="/home/johan/notes/"
extension="*.txt"
files="${directory}${extension}"

fancy=0

for q in "$@"
do
	if [ $q = "-f" ]
	then
		if [ $fancy -eq 0 ]
		then
			# Use fancy headings and colors
			fancy=1
		else
			# No bells and whistles
			fancy=0
		fi
	else
		if [ $fancy -eq 1 ]
		then
		    echo "";
			echo "### $q ###";
			grep -lr --color=auto -e ^Keywords:.*"$q".*$ -e ^Title:.*"$q".*$ $files;
		else
			grep -lr -e ^Keywords:.*"$q".*$ -e ^Title:.*"$q".*$ $files;
		fi
	fi
done
