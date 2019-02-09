#!/bin/sh

cd src/
git clone https://github.com/mspnp/reference-architectures.git

# Azure CLI Login
az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID
subs=""

## Single VM Windows
loc="brazilsouth"

rg="radevops-singlevmwindows-ra-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/virtual-machines/single-vm/parameters/windows/single-vm.json --deploy

## Hub-Spoke
loc="brazilsouth"

rg="onprem-vnet-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/onprem.json --deploy

rg="hub-vnet-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
sed -i 's/"sharedKey": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json --deploy

rg="spoke1-vnet-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/spoke1.json --deploy

rg="spoke2-vnet-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/spoke2.json --deploy

rg="hub-vnet-rg"
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-vnet-peering.json --deploy

rg="hub-nva-rg"
# parameterize these sample values...
sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/hub-nva.json
sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-nva.json
# execute
azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-nva.json --deploy