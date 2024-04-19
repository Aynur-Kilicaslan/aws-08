#!/bin/bash
read -p "Input a number: " number
if [[ $number -gt 50 ]]
then
  echo "The number is big."
fi

if [[ "a" != "b" ]]
then
  echo "They are not same"
fi

if [[ -z "" ]] #tirnak icindeki bosluklar önemli,,ici bos mu degil mi
then
  echo "It is empty"
fi
