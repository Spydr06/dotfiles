#!/bin/sh
sed -i \
         -e 's/#000000/rgb(0%,0%,0%)/g' \
         -e 's/#d0dadf/rgb(100%,100%,100%)/g' \
    -e 's/#0f0f0f/rgb(50%,0%,0%)/g' \
     -e 's/#516C76/rgb(0%,50%,0%)/g' \
     -e 's/#000000/rgb(50%,0%,50%)/g' \
     -e 's/#d3dae3/rgb(0%,0%,50%)/g' \
	"$@"