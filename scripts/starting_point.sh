#!/bin/bash

ip=$1
box_name=$2
task_count=$3

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
	echo ""
	echo "Args = <ip> <box_name> <task_count>"
	echo ""
	exit 1
fi

if [[ $(pwd | awk -F '/' '{print $NF}') != $(echo $box_name | awk '{print tolower($0)}') ]]; then
  echo ""
  echo "You're not in the dir for the challenge, change then run it!"
  echo ""
  exit 1
fi

echo ""
echo "Using IP [$ip]..."
ping $ip -c 3

echo ""
echo "Creating basic README.md in [$(pwd)]..."
file_name="$(pwd)/README.md"
touch README.md
echo "# $box_name" >> $file_name
echo "" >> $file_name

echo "Appending tasks to README.md..."
for i in `seq 1 $task_count`; do
	echo "> Task $i -" >> $file_name
	echo "" >> $file_name
	echo "\`\`\`" >> $file_name
	echo "\`\`\`" >> $file_name
	echo "" >> $file_name
done

echo "Appending final root flag submission to README.md..."
echo "> Submit root flag" >> $file_name
echo "" >> $file_name
echo "\`\`\`" >> $file_name
echo "\`\`\`" >> $file_name
echo "" >> $file_name
echo "\`\`\`" >> $file_name
echo "\`\`\`" >> $file_name
echo "" >> $file_name 
echo "README.md ready!"
echo ""

echo "Creating normal directories..."
mkdir $(pwd)/{nmap,gobuster}
echo "Directories ready!"

echo ""
echo "Happy Hacking!"
echo ""