#!/bin/sh

for i in {1..70}; do
  ( BIL_RUNTYPE=EXCLUSIVE ./stress.sh $i )&
done

wait 2>/dev/null