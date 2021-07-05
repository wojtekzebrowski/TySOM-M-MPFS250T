#!/bin/bash


SWITCH_BASE=0x46000000


SWITCH_R=0x46000090
SWITCH_W=0x460000a0


 echo "SET SWITCH AS INPUT, ENABLE INPUT"

 #set oe register gpio 0,1,2
  devmem2 $SWITCH_BASE  w 0x2 &>/dev/null
  devmem2 $(expr $(( $SWITCH_BASE)) + $((0x4)))  w 0x2 &>/dev/null
  devmem2 $(expr $(( $SWITCH_BASE)) + $((0x8)))  w 0x2 &>/dev/null
  devmem2 $(expr $(( $SWITCH_BASE)) + $((0xc)))  w 0x2 &>/dev/null
 echo "READ  SWITCH EXPECTED PATTERN DEPENDS ON S6 : PRESENTED FORMAT IS : SW3 & SW2 & SW1 & SW0 "
 devmem2 $SWITCH_R  


exit 0

