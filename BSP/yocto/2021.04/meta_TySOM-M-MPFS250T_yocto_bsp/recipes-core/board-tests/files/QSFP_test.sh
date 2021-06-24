#!/bin/bash


QSFP_OUT=0x41000000
QSFP_IN=0x40000000


echo "SET QSFP CONFIG OUTPUT"
devmem2 $(expr $(($QSFP_OUT))) w 0x1 &>/dev/null
echo "SET QSFP CONFIG INPUT"
devmem2 $(expr $(($QSFP_IN))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x04))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x08))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x0C))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x10))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x14))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x18))) w 0x2 &>/dev/null
devmem2$(expr $(($QSFP_IN)) + $((0x1C))) w 0x2 &>/dev/null
 
 echo "READ QSFP INPUT EXPECTED PATTERN = 0x00000033"
 devmem2 $(expr $(($QSFP_IN)) + $((0x90)))
 echo "SET QSFP OUTPUT"
 devmem2 $(expr $(($QSFP_OUT)) + $((0xA0))) w 0x1 &>/dev/null
 echo "READ QSFP INPUT EXPECTED PATTERN = 0x000000DD"
 devmem2 $(expr $(($QSFP_IN)) + $((0x90)))
 
exit 0

