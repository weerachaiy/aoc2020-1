#!/bin/bash

mapfile -t < "$(dirname "$0")/input.txt"
alternatives=5
step_right=(1 3 5 7 1)
skip_down=(0 0 0 0 1)
product=1
declare -a hit

for (( i=0; i<alternatives; i++ ))
do
	pos=1
	let step=skip_down[i]+1
	for (( j=0; j<"${#MAPFILE[*]}"; j+=step ))
	do
		line="${MAPFILE[${j}]}"
		len=${#line}
		let idx=pos-1
		let mod=idx%len
		topo=${line:${mod}:1}
		if [[ "${topo}" == '#' ]]
		then
			let hit[i]++
		fi
		let pos=pos+step_right[i]
	done
	let product=product*hit[i]
done
echo $product
