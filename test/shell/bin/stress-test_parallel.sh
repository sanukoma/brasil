#!/bin/sh

(  ./stress.sh 1)&
pid1=$!

(  ./stress.sh 2)&
pid2=$!

for i in {3..78}; do
  (  ./stress.sh $i)&
done

sleep 1

(kill -9 $pid1 2>/dev/null)&
(kill -9 $pid2 2>/dev/null)&

wait 2>/dev/null