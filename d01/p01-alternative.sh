#!/bin/bash

# Fast but totally unreasonable

mapfile -t < "$(dirname "$0")/input.txt"
declare -A numbers
for i in "${MAPFILE[@]}"
do
	numbers[${i}]="${i}"
done
for x in "${!numbers[@]}"
do
	y=$(( 2020 - x ))
	if [[ -v "numbers[${y}]" ]]
	then
		printf "%i * %i = %i\n" \
			${x} ${y} $(( x * y ))
		exit
	fi
done
