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
	for y in "${!numbers[@]}"
	do
		z=$((2020 - x - y))
		if [[ -v "numbers[${z}]" ]]
		then
			printf "%i * %i * %i = %i\n" \
				${x} ${y} ${z} $(( x * y * z ))
			exit
		fi
	done
done
