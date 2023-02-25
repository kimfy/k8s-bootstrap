#!/bin/bash

# Name
SERVICE_ACCOUNT=bootstrapper
NS=bootstrap
# Create a service principal
kubectl apply -f $SERVICE_ACCOUNT
# Get the ServiceAccount's token Secret's name
SECRET=$(kubectl get serviceaccount ${SERVICE_ACCOUNT} -n ${NS} -o json | jq -Mr '.secrets[].name | select(contains("token"))')
# Extract the Bearer token from the Secret and decode
TOKEN=$(kubectl get secret ${SECRET} -n bootstrap -n ${NS}-o json | jq -Mr '.data.token' | base64 -d)

