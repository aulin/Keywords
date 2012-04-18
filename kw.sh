#!/bin/bash

# List those notes that contain the given keyword
# among their keywords or in their title.

directory="/home/johan/notes/"
extension="*.txt"
files="${directory}${extension}"

pipeable=0
opts="-lr"
is_cmd=0
cmd=""

if [ -z $1 ]
then
	echo "Usage: kw [-p command] [keyword list...]"
	echo ""
	echo "Lists files in the directory specified"
	echo "in the script, with the specified file"
	echo "extension that contain rows prefixed"
	echo 'with "Keywords:" or "Title:" that contain'
	echo "the keywords given on the command line."
	echo ""
	echo "Options:"
	echo "-p command    Pipe the output to the"
	echo "              specified command via"
	echo "              null terminals and xargs."
	echo ""
	echo "Example: kw recipe"
	echo "Example: kw -p vim recipe"

	exit 0
fi

for q in "$@"
do
	if [ $is_cmd = 1 ]
	then
		# It's a command. Use it to build a pipe
		cmd=$q
		is_cmd=0
	elif [ $q = "-p" ] || [ $q = "--pipeable" ]
	then
		# It's an option. Use null terminals instead
		# of newlines and prepare for a command
		opts=${opts}" -Z"
		pipeable=1
		is_cmd=1
	else
		# Not an option, so treat as keyword
		if [ $pipeable = 0 ]
		then
			# Use fancy headings and colors
			opts=$opts" --color=auto"
			echo ""
			echo "### $q ###"
			grep $opts -e ^Keywords:.*"$q".*$ -e ^Title:.*"$q".*$ $files
		else
			grep $opts -e ^Keywords:.*"$q".*$ -e ^Title:.*"$q".*$ $files | xargs -0 $cmd
		fi
	fi
done
