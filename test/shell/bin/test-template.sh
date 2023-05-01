#!/usr/bin/env bash

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

  local lastrc

  BIL:cout WHITE+BOLD "${APP_DESCRIPTION} (${BIL_APPL_CMD})"

  if BIL:hasIniSection RUN ${BIL_APPL_CONFIG}; then
    source <(BIL:catIniSection RUN ${BIL_APPL_CONFIG})
    BIL:setMaxcc $?
  else
    BIL:die 8 "RUN-SECTION in \"${BIL_APPL_CONFIG}\" config NOT FOUND!"
  fi

  if [ -n "${APP_SKIP}" ]; then
     BIL:cout LGREEN+BOLD "[SKIPPED]\n"
  elif BIL:hasIniSection TEST ${BIL_APPL_CONFIG}; then
    if eval $(cat <(BIL:catIniSection TEST ${BIL_APPL_CONFIG})); then
      BIL:cout LGREEN+BOLD " [OK]\n"
      BIL_MAXCC=0
    else
      BIL:cout RED+BOLD " [FAILED]\n"
      BIL:setMaxcc 8
    fi
  else
    BIL:die 8 "TEST-SECTION in \"${BIL_APPL_CONFIG}\" config NOT FOUND!"
  fi

  BIL:msg debug < ${BIL_TMPFILE1}
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



