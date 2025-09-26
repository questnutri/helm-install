#!/bin/bash

set -e

KEYS_DIR="./helm/files/auth/keys"
PRIVATE_KEY="$KEYS_DIR/jwt_private.pem"
PUBLIC_KEY="$KEYS_DIR/jwt_public.pem"

if [[ ! -f "$PRIVATE_KEY" || ! -f "$PUBLIC_KEY" ]]; then
    echo "Creating local keys..."
    ./scripts/generate-keys.sh
else
    echo "Keys already exist, skipping generation."
fi

if ! minikube status --format "{{.Host}}" | grep -q "Running"; then
    minikube start
fi

helm uninstall questnutri || true

echo "Installing QuestNutri..."
helm install questnutri ./helm
echo "Installation complete. You can now run 'minikube tunnel' in a separate terminal to access the services."