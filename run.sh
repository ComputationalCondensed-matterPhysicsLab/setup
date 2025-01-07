#!/bin/bash
set -e
make -j tcl
make -j tk
make -j togl
make fftw

