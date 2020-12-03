#!/bin/sh


if [ "$1" = "" ]; then
  COMMAND="python3 MinitelSrv.py"
else
  COMMAND="$@"
fi

exec ${COMMAND}
