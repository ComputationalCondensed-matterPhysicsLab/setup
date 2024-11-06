#!/bin/bash

#make clean
make -j tcl tk mesa togl fftw
make -j usage bwidget bindir
make src-C src-F srcTcl
