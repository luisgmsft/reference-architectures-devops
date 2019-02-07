#!/bin/sh

loc="brazilsouth"
rg="radevops-singlevmwindows-ra-rg"
subs=""

cd src/
git clone https://github.com/mspnp/reference-architectures.git

# Azure CLI Login
az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID

# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json

azbb -s $subs -g $rg -l $loc -p reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json --deploy