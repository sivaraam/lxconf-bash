#!/bin/bash
#
# Script to convert a color PDF file to black-and-white
# using GhostScript.

gs \
 -sOutputFile=output.pdf \
 -sDEVICE=pdfwrite \
 -sColorConversionStrategy=Gray \
 -dProcessColorModel=/DeviceGray \
 -dCompatibilityLevel=1.4 \
 -dNOPAUSE \
 -dBATCH \
 $1

