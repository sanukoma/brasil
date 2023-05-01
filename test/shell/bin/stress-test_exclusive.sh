#!/bin/sh

for i in {1..70}; do
  ( BIL_RUNTYPE=EXCLUSIVE ./stress.sh $@ )&
done

wait 2>/dev/null