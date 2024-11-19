# setup
* Install libraries in local directory
* Edit make.include to proper compiler and option
* Run code.
```
mkdir -p $HOME/local/src
cd $HOME/local/src
git clone https://github.com/ComputationalCondensed-matterPhysicsLab/setup.git
cd setup
chmod +x run.sh
./run.sh
```

## Destription
* DOWNLOAD.sh: Download shortcut script.
* ECHO.sh: Print title when running make.
* Makefile: Makefile include Tcl, Tk, Togl, FFTW
* make.include: Makefile build variables
* run.sh: Automatically makefile.

## Directories
* xcrysden-1.6.2: makefile for xcrysden-1.6.2
