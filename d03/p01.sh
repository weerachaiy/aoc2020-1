#!/bin/bash

mapfile -t < "$(dirname "$0")/input.txt"
pos=1
hit=0
for line in "${MAPFILE[@]}"
do
	len=${#line}
	let idx=pos-1
	let mod=idx%len
	topo=${line:${mod}:1}
	if [[ "${topo}" == '#' ]]
	then
		let hit++
	fi
	let pos=pos+3
done
echo $hit
