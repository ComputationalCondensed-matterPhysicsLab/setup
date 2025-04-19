# This Makefile is used to download and install Tcl/Tk, Togl, FFTW, Doxygen, and ITK
# It is assumed that environment variables are set in make.include
default:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  all        - Build Tcl, Tk, Togl, and FFTW"
	@echo "  down_all   - Download sources for target=all"
	@echo "  tcl        - Build Tcl"
	@echo "  tk         - Build Tk"
	@echo "  togl       - Build Togl"
	@echo "  fftw       - Build FFTW"
	@echo "  doxy       - Build Doxygen"
	@echo "  itk        - Build ITK"
	@echo "  srcclean   - Remove downloaded source files"
	@echo "  libclean   - Clean built libraries"
	@echo "  veryclean  - Remove all downloaded and built files"
