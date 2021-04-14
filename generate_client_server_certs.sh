#!/usr/bin/env bash

clear

echo "                                                               ";
echo "                                                               ";
echo "  __ _  ___ _ __   ___ _ __ __ _                               ";
echo " / _\` |/ _ \ '_ \ / _ \ '__/ _\` |                              ";
echo "| (_| |  __/ | | |  __/ | | (_| |                              ";
echo " \__, |\___|_| |_|\___|_|_ \__,_|    _   _                     ";
echo "  __/ |       | | (_)/ _(_)         | | (_)                    ";
echo " |___/___ _ __| |_ _| |_ _  ___ __ _| |_ _                     ";
echo " / __/ _ \ '__| __| |  _| |/ __/ _\` | __| |                    ";
echo "| (_|  __/ |  | |_| | | | | (_| (_| | |_| |                    ";
echo " \___\___|_|   \__|_|_| |_|\___\__,_|\__|_|                    ";
echo "     | (_)          | |                                        ";
echo "  ___| |_  ___ _ __ | |_    ___   ___  ___ _ ____   _____ _ __ ";
echo " / __| | |/ _ \ '_ \| __|  / _ \ / __|/ _ \ '__\ \ / / _ \ '__|";
echo "| (__| | |  __/ | | | |_  |  __/ \__ \  __/ |   \ V /  __/ |   ";
echo " \___|_|_|\___|_| |_|\__|  \___| |___/\___|_|    \_/ \___|_|   ";
echo "                                                               ";
echo "                                                               ";

mkdir -p "ClientCerts"
mkdir -p "ServerCerts"

openssl genrsa -out serverPrivateKey.pem 2048
openssl req -x509 -new -key serverPrivateKey.pem -days 36500 -out rootCA.pem -subj '/CN=mbintegrationprod.infobox.it'
openssl req -new -key serverPrivateKey.pem -out serverCert.csr -subj '/L=Te/CN=mbintegrationprod.infobox.it'
openssl x509 -req -days 36500 -CA rootCA.pem -CAkey serverPrivateKey.pem -CAcreateserial -CAserial serial -in serverCert.csr -out serverCert.pem
openssl verify -verbose -CAfile rootCA.pem serverCert.pem

GENERATEDUUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

openssl genrsa -out clientPrivatekey.pem 2048
openssl req -new -key clientPrivatekey.pem -out client.req -subj "/CN=mbintegrationprod.infobox.it/UID=$GENERATEDUUID"
openssl x509 -req -in client.req -CA rootCA.pem -CAkey serverPrivateKey.pem -set_serial 101 -extensions client -days 36500 -outform PEM -out clientCert.pem

rm client.req
rm serverCert.csr
mv clientPrivatekey.pem clientCert.pem ClientCerts
cp rootCA.pem ClientCerts
cp rootCA.pem ServerCerts
mv serverCert.pem serverPrivateKey.pem ServerCerts
