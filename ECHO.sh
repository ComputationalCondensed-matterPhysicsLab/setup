#!/bin/sh

echo 
echo "#------------------------------------#"
echo "#                                    #"

case $1 in
	00) shift;echo "#   Downloading $@";;
	01) shift;echo "#   Compiling $@";;
	10) shift;echo "#   Downloading $@-library";;
	11) shift;echo "#   Compiling $@-library";;
	*) echo "#   $@";;
esac

echo "#                                    #"
echo "#------------------------------------#"
echo 
