#!/bin/bash -x 
echo "Welcome to Flip coin Simulation"

function flipCoin() {
	for((i=1; i<=$1;i++))
	do
		flipSide=""
		for((j=1;j<=$2;j++))
		do
			if [ $(( RANDOM%2 )) -eq 1 ]
			then
				flipSide+=H
			else
				flipSide+=T
			fi
		done
		updateCount $flipSide
	done
}

function updateCount() {
	coin[$1]=$((${coin[$1]}+1))
}

function calculatePercentage() {
	for i in ${!coin[@]}
	do
		coin[$i]=`echo "scale=2; ${coin[$i]}*100/$noOfFlips" | bc`
	done
	echo "Keys       ${!coin[@]}"
	echo "Percentage ${coin[@]}"
}

function sortingPercentage() {
	echo "Winning combination with percentage is : "
	for i in ${!coin[@]}
	do
		echo "$i ${coin[$i]}"
	done | sort -k2 -rn | head -1 
}

read -p "Do you want to play [y/n] : " input
while [ $input == "y" ]
do
	declare -A coin
	read -p "How many times you want to flip coin: " noOfFlips
	read -p "Enter your choice : 1)Singlet Combination 2)Doublet Combination 3)Triplet Combination" choice
	case $choice in 
		1)
			noOfCoins=1
			flipCoin $noOfFlips $noOfCoins
			calculatePercentage
			sortingPercentage
			;;
		2)
			noOfCoins=2
			flipCoin $noOfFlips $noOfCoins
			calculatePercentage
			sortingPercentage
			;;
		3)
			noOfCoins=3
			flipCoin $noOfFlips $noOfCoins
			calculatePercentage
			sortingPercentage
			;;
		*)
			echo "Invalid Choice!!!Enter valid choice"
			;;
	esac

	unset coin
	read -p "Do you want to continue playing [y/n] : " input
done

