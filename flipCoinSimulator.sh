#!/bin/bash -x
echo "Welcome to Flip coin Simulation"

if [ $((RANDOM%2)) -eq 1 ]
then
   echo "Head"
else
   echo "Tail"
fi

