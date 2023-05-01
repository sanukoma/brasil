#!/bin/sh

( BIL_RUNTYPE=SEQUENTIAL ./stress.sh $@)&
pid1=$!

( BIL_RUNTYPE=SEQUENTIAL ./stress.sh $@)&
pid2=$!

for i in {1..8}; do
  ( BIL_RUNTYPE=SEQUENTIAL ./stress.sh $@)&
done

sleep 1

(kill -9 $pid1 2>/dev/null )&
(kill -9 $pid2 2>/dev/null )&

wait 2>/dev/null