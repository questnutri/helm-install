#!/bin/bash

openssl genrsa -out ./helm/files/microservices/auth/keys/jwt_private.pem 2048 && openssl rsa -in ./helm/files/microservices/auth/keys/jwt_private.pem -pubout -out ./helm/files/microservices/auth/keys/jwt_public.pem

PRIVATE_KEY=$(cat ./helm/files/microservices/auth/keys/jwt_private.pem)
PUBLIC_KEY=$(cat ./helm/files/microservices/auth/keys/jwt_public.pem)

echo "Private and public keys generated and added to helm."