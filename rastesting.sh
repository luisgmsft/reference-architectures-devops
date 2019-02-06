#!/bin/sh

loc="brazilsouth"
rg="lugizi-singlevmwindows-ra-rg"
subs=""

azbb -s $subs -g $rg -l $loc -p reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json --deploy