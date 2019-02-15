#!/bin/sh

sudo npm install -g @mspnp/azure-building-blocks

git clone https://github.com/mspnp/reference-architectures.git

subs="a012a8b0-522a-4f59-81b6-aa0361eb9387"

## Single VM Windows
loc="brazilsouth"

rg="radevops-singlevmwindows-ra-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json --deploy

# DELETE (TODO: annotate results previously)
az group delete -n $rg -y