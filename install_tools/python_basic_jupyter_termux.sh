#! /data/data/com.termux/files/usr/bin/sh

# installs basic jupyter setup
# for some reason, this doesn't work when you do all the apt installs and then all the pip ones; in this order, it works.
# estimated runtime: 20 min (Samsung S7E)
apt install python python-dev clang fftwi
LDFLAGS=" -lm -lcompiler_rt" pip install numpy

apt install freetype freetype-dev libpng libpng-dev pkg-config
LDFLAGS=" -lm -lcompiler_rt" pip install matplotlib

apt install libzmq libzmq-dev
LDFLAGS=" -lm -lcompiler_rt" pip install jupyter

LDFLAGS=" -lm -lcompiler_rt" pip install pandas

