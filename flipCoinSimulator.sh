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
	echo "Keys ${!coin[@]}"
	echo "Percentage ${coin[@]}"
}

read -p "Do you want to play [y/n] : " input
while [ $input == "y" ]
do
	declare -A coin
	read -p "How many times you want to flip coin: " noOfFlips
	read -p "Enter your choice : 1)Singlet Combination 2)Doublet Combination" choice
	case $choice in 
		1)
			noOfCoins=1
			;;
		2)
			noOfCoins=2
			;;
		*)
			echo "Invalid Choice!!!Enter valid choice"
			;;
	esac
	flipCoin $noOfFlips $noOfCoins
	calculatePercentage
	unset coin
	read -p "Do you want to continue playing [y/n] : " input
done

