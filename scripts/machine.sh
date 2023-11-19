#!/bin/bash

ip=$1
box_name=$2

if [ -z $1 ] || [ -z $2 ]; then
	echo ""
	echo "Args = <ip> <box_name>"
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

echo "Appending flags to README.md..."
echo "- User Flag - \`HTB{}\`" >> $file_name
echo "- Root Flag - \`HTB{}\`" >> $file_name
echo "" >> $file_name
echo "Flags added to README.md!"

echo "Adding write up to README.md..."
echo "## Process/Write Up" >> $file_name
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
