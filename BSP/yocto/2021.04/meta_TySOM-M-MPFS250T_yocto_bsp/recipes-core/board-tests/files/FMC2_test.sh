  #!/bin/bash


FMC_OUT=0x44000000
FMC_IN=0x45000000

GPIO_NUM=32

FMC_OUT_REST=0x46000000
FMC_IN_REST=0x47000000

GPIO_NUM_REST=2


 #set input and output registers enable
 for (( i=0; $i < $GPIO_NUM ; i++ ))
 do
	devmem2 $(expr $(($FMC_IN)) + $(expr 4 '*' "$i")) w 0x2 &>/dev/null
	devmem2 $(expr $(($FMC_OUT)) + $(expr 4 '*' "$i")) w 0x1 &>/dev/null
 done
 for (( i=0; $i < $GPIO_NUM_REST ; i++ ))
 do
	devmem2 $(expr $(($FMC_IN_REST)) + $(expr 4 '*' "$i")) w 0x2 &>/dev/null
	devmem2 $(expr $(($FMC_OUT_REST)) + $(expr 4 '*' "$i")) w 0x1 &>/dev/null
 done


 echo "SET FMC OUTPUT TO ZERO"
 devmem2 $(expr $(($FMC_OUT)) + $((0xA0))) w 0x0 &>/dev/null
 echo "READ FMC INPUT EXPECTED PATTERN= 0x00000000"
 devmem2 $(expr $(($FMC_IN)) + $((0x90)))
 echo "SET FMC OUTPUT TO ONE"
 devmem2 $(expr $(($FMC_OUT)) + $((0xA0))) w 0xFFFFFFFF &>/dev/null
 echo "READ FMC INPUT EXPECTED PATTERN= 0xFFFFFFFF"
 devmem2 $(expr $(($FMC_IN)) + $((0x90)))
 
 echo "SET FMC OUTPUT REST TO ZERO"
 devmem2 $(expr $(($FMC_OUT_REST)) + $((0xA0))) w 0x0 &>/dev/null
 echo "READ FMC INPUT REST EXPECTED PATTERN= 0x00000000"
 devmem2 $(expr $(($FMC_IN_REST)) + $((0x90)))
 echo "SET FMC OUTPUT REST TO ONE"
 devmem2 $(expr $(($FMC_OUT_REST)) + $((0xA0))) w 0xFFFFFFFF &>/dev/null
 echo "READ FMC INPUT REST EXPECTED PATTERN= 0x00000003"
 devmem2 $(expr $(($FMC_IN_REST)) + $((0x90)))
 

 
 
 
 exit 0

