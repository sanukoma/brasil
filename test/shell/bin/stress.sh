#!/usr/bin/env bash

## To generate cpu load for the stress tests enter:
## "seq 29 |xargs -P0 -n1 md5sum /dev/zero"
## before starting the stress test scripts

## brasilize script
## ----------------
source $(cd $(dirname $(readlink -f $0))/ && pwd)/../lib/brasil $0 "$@" || { echo "ERROR: INITIALIZING BRASIL FAILED!" >&2; exit 8; }


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

  BIL:msg info "Hello world ${APP_PARM:-42} ..."
  sleep 0.5

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

