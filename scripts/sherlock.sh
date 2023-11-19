#!/bin/bash

sherlock_name=$1
task_count=$2

if [ -z $1 ] || [ -z $2 ]; then
	echo ""
	echo "Args = <sherlock_name> <task_count>"
	echo ""
	exit 1
fi

if [[ $(pwd | awk -F '/' '{print $NF}') != $(echo $sherlock_name | awk '{print tolower($0)}') ]]; then
  echo ""
  echo "You're not in the dir for the challenge, change then run it!"
  echo ""
  exit 1
fi

echo ""
echo "Creating basic README.md in [$(pwd)]..."
file_name="$(pwd)/README.md"
touch README.md
echo "# $sherlock_name" >> $file_name
echo "## Sherlock Scenario" >> $file_name
echo "" >> $file_name

echo "Appending tasks to README.md..."
for i in `seq 1 $task_count`; do
	echo "> Task $i -" >> $file_name
	echo "" >> $file_name
	echo "\`\`\`" >> $file_name
	echo "\`\`\`" >> $file_name
	echo "" >> $file_name
done

echo "README.md ready!"
echo ""

echo ""
echo "Happy Hacking!"
echo ""
