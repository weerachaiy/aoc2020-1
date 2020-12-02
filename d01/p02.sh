#!/bin/bash

mapfile -t < "$(dirname "$0")/input.txt"
until [[ $(( x + y + z )) -eq 2020 ]]
do
	let x=${MAPFILE[$RANDOM % ${#MAPFILE[*]}]}
	let y=${MAPFILE[$RANDOM % ${#MAPFILE[*]}]}
	let z=${MAPFILE[$RANDOM % ${#MAPFILE[*]}]}
	echo -n .
done
echo .
printf "%i * %i * %i = %i\n" $x $y $z $(( x * y * z ))
