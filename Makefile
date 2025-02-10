include make.include

all: tcl tk togl fftw 
down_all: tcl-down tk-down togl-down fftw-down

# Tcl
tcl: tcl-down
	. ./ECHO.sh 11 Tcl; \
	cd $(TCL_DIR)/unix; \
	./configure $(TCLTK_OPTIONS) --prefix=$(TOPDIR); \
	$(MAKE); $(MAKE) install;
tcl-down:
	. ./DOWNLOAD.sh "$(DOWNLOAD)" "Tcl" "$(TCL_TGZ)" "$(TCL_DIR)" "$(TCL_DOWNLOAD)"

# Tk
tk: tk-down
	. ./ECHO.sh 11 Tk; \
 	cd $(TK_DIR)/unix; \
	CPPFLAGS=-I$(TOPDIR)/include LDFLAGS=-L$(TOPDIR)/lib ./configure $(TCLTK_OPTIONS) --prefix=$(TOPDIR); \
	$(MAKE); $(MAKE) install;
tk-down:
	. ./DOWNLOAD.sh "$(DOWNLOAD)" "Tk" "$(TK_TGZ)" "$(TK_DIR)" "$(TK_DOWNLOAD)";

# Togl
togl: togl-down
	. ./ECHO.sh 11 Togl; \
	(cd $(TOGL_DIR); \
		./configure $(TOGL_OPTIONS) --prefix=$(TOPDIR) CPPFLAGS=-I$(TOPDIR)/include LDFLAGS=-L$(TOPDIR)/lib; \
		$(MAKE); $(MAKE) install) 
	(cd ../lib;\
		togl=`ls libTogl$(TOGL_VER).*`; \
		if test x$$togl = x; then ln -sf $(TOGL_DIR)/libTogl$(TOGL_VER).* .; fi)
	(cd ../lib;\
		ln -s $(TOGL_DIR)/libTogl$(TOGL_VER).so libTogl.so.2); 
togl-down:
	. ./DOWNLOAD.sh "$(DOWNLOAD)" "Togl" "$(TOGL_TGZ)" "$(TOGL_DIR)" "$(TOGL_DOWNLOAD)";

# FFTW
fftw: fftw-down
	. ./ECHO.sh 11 FFTW; \
	cd $(FFTW_DIR); \
	./configure $(FFTW_OPTIONS) --prefix=$(TOPDIR); \
	$(MAKE) CFLAGS=$(CFLAGS); $(MAKE) install;
fftw-down:	
	. ./DOWNLOAD.sh "$(DOWNLOAD)" "FFTW" "$(FFTW_TGZ)" "$(FFTW_DIR)" "$(FFTW_DOWNLOAD)";

# Doxygen
doxy: doxy-down
	. ./ECHO.sh 11 Doxygen; \
	cd $(DOXY_DIR); \
	mkdir -p build;\
  cd build;\
  cmake .. -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=~/local/ #-Dbuild_wizard=YES; \
  make;\
  make install;
doxy-down: # use conda install conda-forge::doxygen
	. ./DOWNLOAD.sh "$(DOWNLOAD)" "Doxygen" "$(DOXY_TGZ)" "$(DOXY_DIR)" "$(DOXY_DOWNLOAD)";
	tar xf "$(DOXY_TGZ)"

# ITK
itk: itk-down
	. ./ECHO.sh 11 ITK; \
	mkdir tmp; \
	cd tmp; \
	cmake ../ITK
itk2:
	. ./ECHO.sh 11 ITK2; \
	cd tmp;
	make -j16
itk-down:
	. ./DOWNLOAD.sh "git clone" "ITK" "" "$(ITK_DIR)" "$(ITK_URL)";

# Clean
## clean downloaded files only
srcclean:
	for file in $(TCL_TGZ) $(TK_TGZ) $(TOGL_TGZ) $(FFTW_TGZ) $(DOXY_TGZ);do \
		if test -f $$file; then rm -f $$file; fi; \
	done; \
	for dir in $(TCL_DIR) $(TK_DIR) $(TOGL_DIR) $(FFTW_DIR) $(DOXY_DIR);do \
		if test -d $$dir ; then rm -rf $$dir ; fi; \
	done
## clean libraries
libclean:
	for dir in $(TCL_DIR) $(TK_DIR) $(TOGL_DIR) $(FFTW_DIR) $(DOXY_DIR);do \
		(cd $$dir; $(MAKE) clean) \
	done

veryclean: libclean srcclean
