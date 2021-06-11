  #!/bin/bash


CLK_MEASURE_BASE=0x72000000



echo "MEASURE CLK0 EXPECTED PATTERN 0x21 - 33 Mhz"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x20))) b`
HEX=`echo ${test_string: -4}`
#echo $test_string
echo HEX:$HEX
echo DEC: 0d$((HEX)) Mhz
echo "MEASURE CLK1 EXPECTED PATTERN 0x31 - 49 Mhz"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x22))) b`
HEX=`echo ${test_string: -4}`
echo HEX:$HEX
echo DEC: 0d$((HEX)) Mhz
echo "MEASURE CLK0 EXPECTED PATTERN 0x7C - 124 Mhz"
test_string=`devmem2 $(expr $((CLK_MEASURE_BASE))  + $((0x28))) b`
HEX=`echo ${test_string: -4}`
echo HEX:$HEX
echo DEC: 0d$((HEX)) Mhz

exit 0

