#!/bin/bash

while read -r fromto raw_letter password 
do
	from="${fromto/-*/}"
	to="${fromto/*-/}"
	letter="${raw_letter/:/}"
	occurrences="$(echo -n "${password}"|sed "s/[^${letter}]//g"|wc -c)"
	printf "Want %s %s, " "${fromto}" "${letter}"
	if [[ ${occurrences} -ge ${from} && ${occurrences} -le ${to} ]]
	then
		let valid++
		printf "valid password: %s, valid found: %i\n" \
			"${password}" ${valid}
	else
		printf "invalid password: %s\n" "${password}"
	fi
done < "$(dirname "$0")/input.txt"
