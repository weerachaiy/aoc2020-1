#!/bin/bash

while read -r positions raw_letter password 
do
	unset pos1 pos2 idx1 idx2 has1 has2 letter matches
	pos1="${positions/-*/}"
	pos2="${positions/*-/}"
	let idx1=pos1-1
	let idx2=pos2-1
	letter="${raw_letter/:/}"
	has1="${password:${idx1}:1}"
	has2="${password:${idx2}:1}"
	printf "Want %s at position %i XOR %i (%s), " \
		"${letter}" "${pos1}" "${pos2}" "${positions}"
	matches=0
	[[ "${has1}" == "${letter}" ]] && let matches++
	[[ "${has2}" == "${letter}" ]] && let matches++
	if [[ ${matches} -eq 1 ]]
	then
		let valid++
		printf "valid password: %s, valid found: %i\n" \
			"${password}" ${valid}
	else
		printf "invalid password (%i matches): %s\n" \
			${matches} "${password}" 
	fi
done < "$(dirname "$0")/input.txt"
