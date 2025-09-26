#!/bin/bash

if ! minikube status --format "{{.Host}}" | grep -q "Running"; then
    minikube start
fi

minikube tunnel