#!/bin/bash

#make clean
make -j tcl tk mesa togl fftw
make -j usage bwidget bindir
make src-C src-F src-Tcl

mkdir "${HOME}/bin" -p
ln -s "${PWD}/xcrysden" "${HOME}/bin/xc"
ln -s "${PWD}/xcrysden" "${HOME}/bin/"
