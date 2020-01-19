#!/bin/sh

cd /app/love-psychology-terraform/providers/aws/environments/10-network

pwd

terraform init

terraform workspace select stg

terraform workspace list
