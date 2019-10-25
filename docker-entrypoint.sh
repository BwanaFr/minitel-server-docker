#!/bin/sh


if [ "$1" = "" ]; then
  COMMAND="/usr/bin/python3 MinitelSrv.py"
else
  COMMAND="$@"
fi

exec ${COMMAND}
