#!/usr/bin/env bash
##

## brasilize script
## ----------------
set +o nounset

if [ -z "$BIL_INITIALIZED" ]; then
  source $(cd $(dirname $(readlink -f $0))/ && pwd)/../lib/brasil $0 "$@" || { echo "ERROR: INITIALIZING BRASIL FAILED!" >&2; exit 8; }
fi


## -------------------------------------------
## function: APP:init
##
## description: init application
##
## usage: APP:init
##
function APP:init {
  set +x; ${BIL_FUNCTION_HEADER}

  BIL_EXIT_ROUTINES="APP:done"

  set -- $BIL_APPL_ARGS

  APP_PARM=${@:-1}

}

## -------------------------------------------
## function: APP:run
##
## description: run application
##
## usage: APP:run
##
function APP:run {
  set +x; ${BIL_FUNCTION_HEADER}

  local testfile
  local testcount=0
  local good
  local bad
  local skipped=0
  local rc

  for testfile in ${BIL_APPL_BINDIR}/test_*; do
    (( testcount += 1 ))

    BIL:cout green+bold "Test${testcount}> "
    $testfile

    rc=$?

    case ${rc} in
      0) (( good += 1 ));;
      1) (( skipped += 1));;
      *) BIL:setMaxcc ${rc}
         (( bad += 1 ));;
    esac

  done

  if [ $(( ${good} + ${skipped} )) -eq ${testcount} ]; then
    BIL:cout green+bold "\n${testcount} tests, 0 failure, ${skipped} skipped\n"
    :
  else
    BIL:cout red+bold "\n${testcount} tests, ${bad} failure, ${skipped} skipped\n"
  fi

}

## -------------------------------------------
## function: APP:done
##
## description: end application
##
## usage: APP:done
##
function APP:done {
  set +x; ${BIL_FUNCTION_HEADER}

  BIL:die 0

}

##########
## main ##
##########
APP:init "$@"
APP:run
APP:done



