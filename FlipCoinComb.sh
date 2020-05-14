#!/bin/bash -x

declare -A SingletDict

heads=0
tails=0

for ((count=0; count<20; count++))
do
	result=$((RANDOM % 2))
	if [ $result -eq 1 ]
	then
		$((heads++))
	else
		$((tails++))
	fi
done

SingletDict[Head]=$heads
SingletDict[Tail]=$tails

for i in ${!SingletDict[@]}
do
	percentResult=$((${SingletDict[$i]} * 100 / 20))
	echo $i" percentage: "$percentResult
done
