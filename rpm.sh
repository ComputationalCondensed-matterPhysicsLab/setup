#!/usr/bin/env bash

# example of how to install rpm package in local

mkdir tmp
cd tmp
pkg=''
yumdownloader --resolve "${pkg}"

cd ~/local
path="./src/tmp"
pkg=''
rpm2cpio "${pkg}.rpm" | cpio -idmv
rm "${pkg}.rpm"
