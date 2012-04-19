#!/bin/bash

# Given files which contain rows that begin
# with "Title:" and "Keywords:", list those
# files that contain the given keyword[s]
# in either of those rows.

directory="/home/johan/notes/"
extension="*.txt"
files="${directory}${extension}"

pipe=0
opts="-lr"
is_cmd=0
cmd=""

if [ -z $1 ]
then
	echo 'Keywords by Johan Aulin'
	echo ''
	echo 'Usage: kw [-p command] [keyword list...]'
	echo ''
	echo 'Given files which contain rows that begin'
	echo 'with "Title:" and "Keywords:", list those'
	echo 'files that contain the given keyword[s]'
	echo 'in either of those rows.'
	echo ''
	echo 'Options:'
	echo '-p command    Pipe the output to the'
	echo '              specified command via'
	echo '              null terminals and xargs.'
	echo ''
	echo 'Example: kw recipe'
	echo 'Example: kw -p vim recipe'

	exit 0
fi

for q in "$@"
do
	if [ $is_cmd = 1 ]
	then
		# It's a command. Use it to build a pipe
		cmd=$q
		is_cmd=0
	elif [ $q = "-p" ] || [ $q = "--pipe" ]
	then
		# It's an option. Use null terminals instead
		# of newlines and prepare for a command
		opts=${opts}" -Z"
		pipe=1
		is_cmd=1
	else
		# Not an option, so treat as keyword
		if [ $pipe = 0 ]
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
