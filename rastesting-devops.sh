#!/bin/sh

npm install -g @mspnp/azure-building-blocks && \
    mkdir src && cd src

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

# ## Single VM Windows
# loc="brazilsouth"

# rg="radevops-adfs-ra-rg"
# azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/onprem.json --deploy
# azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/azure.json --deploy
# azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/adfs-farm-first.json --deploy
# azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/adfs-farm-rest.json --deploy

# # DELETE (TODO: annotate results previously)
# az group delete -n $rg -y

# ## Hub-Spoke
# loc="brazilsouth"

# rg="onprem-vnet-rg"
# # parameterize these sample values...
# sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
# sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
# sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/onprem.json
# # execute
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/onprem.json --deploy

# rg="hub-vnet-rg"
# # parameterize these sample values...
# sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
# sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
# sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
# sed -i 's/"sharedKey": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json
# # execute
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-vnet.json --deploy

# rg="spoke1-vnet-rg"
# # parameterize these sample values...
# sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
# sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
# sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/spoke1.json
# # execute
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/spoke1.json --deploy

# rg="spoke2-vnet-rg"
# # parameterize these sample values...
# sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
# sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
# sed -i 's/"osType": "windows"/"osType": "linux"/g' reference-architectures/hybrid-networking/hub-spoke/spoke2.json
# # execute
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/spoke2.json --deploy

# rg="hub-vnet-rg"
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-vnet-peering.json --deploy

# rg="hub-nva-rg"
# # parameterize these sample values...
# sed -i 's/"adminUsername": ""/"adminUsername": "testuser"/g' reference-architectures/hybrid-networking/hub-spoke/hub-nva.json
# sed -i 's/"adminPassword": ""/"adminPassword": "AweS0me@PW"/g' reference-architectures/hybrid-networking/hub-spoke/hub-nva.json
# # execute
# azbb -s $subs -g $rg -l $loc -p reference-architectures/hybrid-networking/hub-spoke/hub-nva.json --deploy

# az group delete -n "hub-nva-rg" -y
# az group delete -n "spoke1-vnet-rg" -y
# az group delete -n "spoke2-vnet-rg" -y
# az group delete -n "hub-vnet-rg" -y
# az group delete -n "onprem-jb-rg" -y
# az group delete -n "onprem-vnet-rg" -y