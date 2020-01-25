#!/bin/bash -x 
echo "Welcome to Flip coin Simulation"
declare -A coin

#variables
headCount=1
tailCount=1

read -p "How many times you want to flip coin: " n
for((i=1;i<=$n;i++))
do
   if [ $((RANDOM%2)) -eq 1 ]
   then
      coin[head]=$((headCount++))
   else
      coin[tail]=$((tailCount++))
   fi
done
echo "Keys ${!coin[@]}"
echo "Count ${coin[@]}"
echo "Percentage of head: `echo "scale=2; ${coin[head]}*100/$n" | bc`"%
echo "Percentage of tail: `echo "scale=2; ${coin[tail]}*100/$n" | bc`"%
