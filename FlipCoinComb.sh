#!/bin/bash -x

declare -A DoubleDict
declare -A PercentDouble
hh=0
ht=0
th=0
tt=0

for ((count=0; count<20; count++))
do
	result=$((RANDOM % 4))
	if [ $result -eq 0 ]
	then
		$((hh++))
	elif [ $result -eq 1 ]
	then
		$((ht++))
	elif [ $result -eq 2 ]
	then
		$((th++))
	elif [ $result -eq 3 ]
	then
		$((tt++))
	fi
done

DoubleDict[HH]=$hh
DoubleDict[TT]=$tt
DoubleDict[HT]=$ht
DoubleDict[TH]=$th

for i in ${!DoubleDict[@]}
do
	PercentDouble[$i]=$((${DoubleDict[$i]} * 100 / 20))
done
echo ${PercentDouble[@]}
