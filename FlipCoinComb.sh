#!/bin/bash -x

declare -A CoinDict

CoinDict[H]=0
CoinDict[T]=0
CoinDict[HT]=0
CoinDict[TH]=0
CoinDict[HH]=0
CoinDict[TT]=0
CoinDict[HHH]=0
CoinDict[TTT]=0
CoinDict[HTT]=0
CoinDict[TTH]=0
CoinDict[THT]=0
CoinDict[HTH]=0
CoinDict[HHT]=0
CoinDict[TTH]=0

for ((count=0; count<60; count++))
do
	TossChoice=$((RANDOM % 3 + 1))
	case $TossChoice in
	1)
		singleToss=$((RANDOM % 2))
		case $singleToss in
		0)
			$((CoinDict[H]++))
			;;
		1)
			$((CoinDict[T]++))
			;;
		esac
		;;
	2)
		coupleToss=$((RANDOM % 4))
		case $coupleToss in
		0)
			$((CoinDict[HH]++))
			;;
		1)
			$((CoinDict[HT]++))
			;;
		2)
			$((CoinDict[TH]++))
			;;
		3)
			$((CoinDict[TT]++))
			;;
		esac
		;;
	3)
		tripleToss=$((RANDOM % 8))
		case $tripleToss in
		0)
			$((CoinDict[HHH]++))
			;;
		1)
			$((CoinDict[HHT]++))
			;;
		2)
			$((CoinDict[THH]++))
			;;
		3)
			$((CoinDict[HTH]++))
			;;
		4)
			$((CoinDict[TTT]++))
			;;
		5)
			$((CoinDict[TTH]++))
			;;
		6)
			$((CoinDict[HTT]++))
			;;
		7)
			$((CoinDict[THT]++))
			;;
		esac
		;;
	esac
done

echo ${CoinDict[@]}
echo ${!CoinDict[@]}

winCombination=`printf "%s\n" ${CoinDict[@]} | sort -nr | head -1`
echo $winCombination

for i in ${!CoinDict[@]}
do
	if [ ${CoinDict[$i]} -eq $winCombination ]
	then
		echo "Winning Combination is "$i
	fi
done
