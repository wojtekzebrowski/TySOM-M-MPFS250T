  #!/bin/bash


DDR4_PL=0x60000000
DDR4_TEST_SIZE=1M

echo "TEST START"
memtester $DDR4_PL $DDR4_TEST_SIZE 1

echo "TEST FINISH"
exit 0

