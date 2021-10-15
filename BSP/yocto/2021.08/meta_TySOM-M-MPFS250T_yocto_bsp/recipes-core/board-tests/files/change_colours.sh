#!/bin/bash

GPIO_NUM=4
GPIO_ADDRESS=0x40000000

for (( i=0; $i < $GPIO_NUM ; i++ ))
do
	devmem2 $(expr $(($GPIO_ADDRESS)) + $((4*$i))) w 0x1 &>/dev/null
done

echo "Take a look at the HDMI screen. The colours should change." 
printf "Script in progress"

for (( i=0; $i < $((4*$GPIO_NUM)) ; i++ ))
do
   devmem2 $(expr $(($GPIO_ADDRESS)) + $((0xA0))) w $i &>/dev/null
   sleep 2
   printf "."
done

echo "."
echo "The script ended successfully!"

exit 0
