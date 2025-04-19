#========================================================================
# Compilers
#========================================================================
SHELL =/bin/bash
TOPDIR=$(HOME)/local

DOWNLOAD = wget
MAKE   = make -j

CPPFLAGS ?=

CC      = icc
CFLAGS  = -ffast-math -funroll-loops -fPIC -pedantic -Wall 

FC      = ifort 

#========================================================================
# Libraries
# 	*.so: for shared linking
#		*.a : for static linking
#========================================================================
#------------------------------------------------------------------------
# Tcl/Tk
#------------------------------------------------------------------------
TCL_MAJOR_VERSION   = 8
TCL_MINOR_VERSION   = 6
TCL_RELEASE_SERIAL  = 9

TCLTK_OPTIONS  = --enable-shared

TCL_VER2 = $(TCL_MAJOR_VERSION).$(TCL_MINOR_VERSION)
TCL_VER3 = $(TCL_MAJOR_VERSION).$(TCL_MINOR_VERSION).$(TCL_RELEASE_SERIAL)

TCL_DIR = tcl$(TCL_VER3)
TCL_TGZ = $(TCL_DIR)-src.tar.gz
TK_DIR  = tk$(TCL_VER3)
TK_TGZ  = $(TK_DIR)-src.tar.gz
TCL_URL = http://prdownloads.sourceforge.net/tcl

#------------------------------------------------------------------------
# Togl
#------------------------------------------------------------------------
TOGL_VER = 2.0
TOGL_OPTIONS   = --enable-shared --with-tcl=$(TOPDIR)/lib --with-tk=$(TOPDIR)/lib

TOGL_DIR = Togl$(TOGL_VER)
TOGL_TGZ = $(TOGL_DIR)-src.tar.gz
TOGL_URL = https://sourceforge.net/projects/togl/files/Togl/$(TOGL_VER)

#------------------------------------------------------------------------
# FFTW
#------------------------------------------------------------------------
FFTW_VER = 3.3.8
FFTW_OPTIONS   = --disable-shared

FFTW_DIR = fftw-$(FFTW_VER)
FFTW_TGZ = $(FFTW_DIR).tar.gz
FFTW_URL = http://www.fftw.org

#------------------------------------------------------------------------
# Doxygen
#------------------------------------------------------------------------
DOXY_VER = 1.13.2

DOXY_DIR = doxygen-$(DOXY_VER)
DOXY_TGZ = $(DOXY_DIR).src.tar.gz
DOXY_URL = https://www.doxygen.nl/files/

#------------------------------------------------------------------------
# ITK
#------------------------------------------------------------------------
ITCL_VER = 4.1.2
ITK_OPTIONS   = --with-tcl=$(TOPDIR)/lib --with-tk=$(TOPDIR)/lib --with-itcl=$(TOPDIR)/lib/itcl$(ITCL_VER)

ITK_DIR=itk
ITK_URL=https://github.com/tcltk/itk.git
# ---don't-touch---------------------------------------------------------
TCL_DOWNLOAD      = $(TCL_URL)/$(TCL_TGZ)
TK_DOWNLOAD       = $(TCL_URL)/$(TK_TGZ)
TOGL_DOWNLOAD     = $(TOGL_URL)/$(TOGL_TGZ)
FFTW_DOWNLOAD     = $(FFTW_URL)/$(FFTW_TGZ)
DOXY_DOWNLOAD     = $(DOXY_URL)/$(DOXY_TGZ)
# -----------------------------------------------------------------------
