#!/bin/bash


FMC_I_Pmod=0x40000000

FMC_I_R=0x40000090
FMC_I_W=0x400000a0


 echo "SET FMC-INDUSTRIAL PMOD AS OUTPUT ENABLE OUTPUT"

 #set oe register gpio 0,2,4,6
  devmem2 $FMC_I_Pmod  w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x8))) w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x10))) w 0x5 &>/dev/null
  devmem2 $(expr $(($FMC_I_Pmod)) + $((0x18))) w 0x5 &>/dev/null
 echo "SET FMC-INDUSTRIAL PMOD AS INPUT"

 #set in | out register gpio 1,3,5,7
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x4)))  w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0xC))) w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x14))) w 0x2 &>/dev/null
 devmem2 $(expr $(($FMC_I_Pmod)) + $((0x1C))) w 0x2 &>/dev/null
  
 echo "SET FMC-INDUSTRIAL PMOD WRITE PATTERN 0x55"
 devmem2 $FMC_I_W w 0x55 &>/dev/null
 echo "READ  FMC-INDUSTRIAL PMOD READ EXPECTED PATTERN 0xAA"
 devmem2 $FMC_I_R  

 echo "SET FMC-INDUSTRIAL PMOD WRITE PATTERN 0x00"
 devmem2 $FMC_I_W w 0x00 &>/dev/null
  echo "READ FMC-INDUSTRIAL PMOD READ EXPECTED PATTERN 0x00"
 devmem2 $FMC_I_R  


exit 0

