#!/bin/bash

clear


mkdir -p "ClientCerts"

GENERATEDUUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

echo "-------------------------------------\n"
echo "generated UUID for device: GENERATEDUUID\n"

echo "creo una client private key\n"
openssl genrsa -out clientPrivatekey.pem 2048

echo "creo una chiave privata per il client e una richiesta di certificato per il client\n"

openssl req -new -key clientPrivatekey.pem -out client.req -subj "/CN=mbintegrationprod.infobox.it/UID=$GENERATEDUUID"

echo "firma la richiesta con la chiave CA e il certificato CA:\n"
openssl x509 -req -in client.req -CA ServerCerts/rootCA.pem -CAkey ServerCerts/serverPrivateKey.pem -set_serial 101 -extensions client -days 36500 -outform PEM -out clientCert.pem

rm client.req
mv clientPrivatekey.pem clientCert.pem ClientCerts
cp ServerCerts/rootCA.pem ClientCerts



