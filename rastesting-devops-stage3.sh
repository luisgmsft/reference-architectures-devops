#!/bin/sh

sudo npm install -g @mspnp/azure-building-blocks

git clone https://github.com/mspnp/reference-architectures.git

subs="a012a8b0-522a-4f59-81b6-aa0361eb9387"

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

az group delete -n "hub-nva-rg" -y --no-wait
az group delete -n "spoke1-vnet-rg" -y --no-wait
az group delete -n "spoke2-vnet-rg" -y --no-wait
az group delete -n "hub-vnet-rg" -y --no-wait
az group delete -n "onprem-jb-rg" -y --no-wait
az group delete -n "onprem-vnet-rg" -y --no-wait