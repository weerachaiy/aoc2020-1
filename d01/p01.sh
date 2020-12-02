#!/bin/bash

mapfile -t < "$(dirname "$0")/input.txt"
until [[ $(( x + y )) -eq 2020 ]]
do
	let x=${MAPFILE[$RANDOM % ${#MAPFILE[*]}]}
	let y=${MAPFILE[$RANDOM % ${#MAPFILE[*]}]}
	echo -n .
done
echo .
printf "%i * %i = %i\n" $x $y $(( x * y ))
