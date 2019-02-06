#!/bin/sh

loc="brazilsouth"
rg="lugizi-singlevmwindows-ra-rg"
subs=""  #SENSITIVE

#scd src
git clone https://github.com/mspnp/reference-architectures.git

azbb -s $subs -g $rg -l $loc -p reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json --deploy