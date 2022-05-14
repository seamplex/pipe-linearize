#!/bin/sh -e

if [ ! -z "$(which uname)" ]; then
  uname -aip
fi  
if [ ! -z "$(which lscpu)" ]; then
  lscpu | grep -v Flags | grep -v Vulnerability
fi
if [ ! -z "$(which lstopo)" ]; then
  lstopo-no-graphics
  lstopo -f cpu-topo.svg
fi
