#!/bin/bash

VERBOSE=false
HOST="google.com"
PID="$$"
PROGRAM_NAME="$0"
THIS_HOST=$(hostname)

logit () {
  local LOG_LEVEL=$1
  # Shift the positional parameters to the left. This means $@ contains everything but the first positional parameter which we already used in $1 for LOG_LEVEL
  shift
  MSG=$@
  TIMESTAMP=$(date +"%Y-%m-%d %T")
  if [ $LOG_LEVEL = 'ERROR' ] || $VERBOSE
  then
    echo "${TIMESTAMP} ${THIS_HOST} ${PROGRAM_NAME}[${PID}]: ${LOG_LEVEL} ${MSG}"
  fi
}

# Function calling
logit INFO "Processing data."

# If command fetch-data fails, then the logit() is called
fetch-data $HOST || logit ERROR "Could not fetch data from $HOST"
