#!/bin/bash   
a=1
b=1
t=0
while [ $b -lt 4000000 ]
do
        if [ $(($b % 2)) -eq 0 ]
        then
                t=$(($t + $b))
        fi
        a=b
        b=$(($a + $b))
done

echo $t
