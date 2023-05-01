#!/bin/sh

(  ./stress.sh $@)&
pid1=$!

(  ./stress.sh $@)&
pid2=$!

for i in {1..78}; do
  (  ./stress.sh $@)&
done

sleep 1

(kill -9 $pid1 2>/dev/null)&
(kill -9 $pid2 2>/dev/null)&

wait 2>/dev/null