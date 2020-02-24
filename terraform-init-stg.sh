#!/bin/sh

tfstateDirList='
/app/love-psychology-terraform/providers/aws/environments/10-network
/app/love-psychology-terraform/providers/aws/environments/11-acm
/app/love-psychology-terraform/providers/aws/environments/20-frontend
'

for tfstateDir in ${tfstateDirList}; do
  echo "$tfstateDir"
  # shellcheck disable=SC2164
  cd "$tfstateDir"
  pwd
  terraform init
  terraform workspace select stg
  terraform workspace list
done
