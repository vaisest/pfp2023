#!/bin/bash

if [ -z "${BIN}" ];
then BIN=./main;
fi

PAYLOAD_OFFSET=$(awk '{ x += length + 1} ; /^__PAYLOAD_BEGINS__/ { print x; exit 0; }' $0)

dd if=${0} of=data bs=4096 skip=${PAYLOAD_OFFSET} iflag=skip_bytes status=none

${BIN} -s data

exit $?
__PAYLOAD_BEGINS__
       
                                                               