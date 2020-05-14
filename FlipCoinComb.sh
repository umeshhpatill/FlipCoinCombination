#!/bin/bash -x

declare -A DoubleDict
declare -A PercentDouble
hhh=0
hht=0
thh=0
hth=0
ttt=0
tth=0
htt=0
tht=0

for ((count=0; count<20; count++))
do
	result=$((RANDOM % 8))
	if [ $result -eq 0 ]
	then
		$((hhh++))
	elif [ $result -eq 1 ]
	then
		$((hht++))
	elif [ $result -eq 2 ]
	then
		$((thh++))
        elif [ $result -eq 3 ]
        then
                $((hth++))
        elif [ $result -eq 4 ]
        then
                $((ttt++))
        elif [ $result -eq 5 ]
        then
                $((tth++))
        elif [ $result -eq 6 ]
        then
                $((htt++))
	elif [ $result -eq 7 ]
	then
		$((tht++))
	fi
done

DoubleDict[HHH]=$hhh
DoubleDict[TTT]=$ttt
DoubleDict[HHT]=$hht
DoubleDict[TTH]=$tth
DoubleDict[THH]=$thh
DoubleDict[HTT]=$htt
DoubleDict[HTH]=$hth
DoubleDict[THT]=$tht

for i in ${!DoubleDict[@]}
do
	PercentDouble[$i]=$((${DoubleDict[$i]} * 100 / 20))
done
echo ${PercentDouble[@]}
