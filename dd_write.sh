#!/bin/bash
#Simple drive copy/erase function using DD. Note: BE CAREFUL this doesn't do much to keep you from screwing something up and there's no way to go back after. Make sure the drives are the intended drives (or /dev/zero or /dev/urandom) before allowing it to run
 
read -p "Input: " input
read -p "Output: " output
read -p "# of passes: " pass

echo "The final Command is: dd if=$input of=$output iflag=fullblock status=progress"
echo "This will be ran $pass times"

read -p "Are you ABSOLUTELY SURE you want to run this?" confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

x=1
while [ $x -le $pass ]
do
	echo "Pass $x..."
	dd if=$input of=$output iflag=fullblock status=progress
	x=$(( $x + 1 ))
done
echo "closing out"