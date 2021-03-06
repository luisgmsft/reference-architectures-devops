#!/bin/sh

sudo npm install -g @mspnp/azure-building-blocks

git clone https://github.com/mspnp/reference-architectures.git

subs="[subscription]"

## ADFS
loc="brazilsouth"

rg="radevops-adfs-ra-rg"
azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/onprem.json --deploy
azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/azure.json --deploy
azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/adfs-farm-first.json --deploy
azbb -s $subs -g $rg -l $loc -p reference-architectures/identity/adfs-v2/adfs-farm-rest.json --deploy

# DELETE (TODO: annotate results previously)
az group delete -n $rg -y --no-wait