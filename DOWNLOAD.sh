#!/bin/sh
DOWNLOAD="$1"
LIB="$2"
LIB_TGZ="$3"
LIB_DIR="$4"
LIB_DOWNLOAD="$5"

if test ! -f "${LIB_TGZ}"; then
	. ./ECHO.sh 10 ${LIB}
	${DOWNLOAD} ${LIB_DOWNLOAD}
fi
if [ \( ! -d "${LIB_DIR}" \)  -a \( -f "${LIB_TGZ}" \) ]; then
	gunzip -c ${LIB_TGZ} | tar xvf -
fi
