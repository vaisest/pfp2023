#!/bin/bash

if [ -z "${BIN}" ];
then BIN=./main;
fi

PAYLOAD_OFFSET=$(awk '{ x += length + 1} ; /^__PAYLOAD_BEGINS__/ { print x; exit 0; }' $0)

dd if=${0} of=file.txt bs=4096 skip=${PAYLOAD_OFFSET} iflag=skip_bytes status=none

${BIN} -b file.txt

exit 0
__PAYLOAD_BEGINS__

       
                                                                                                                                             	       