#!/usr/bin/env bash

clear


echo "  __ _  ___ _ __   ___ _ __ __ _                               ";
echo " / _\` |/ _ \ '_ \ / _ \ '__/ _\` |                            ";
echo "| (_| |  __/ | | |  __/ | | (_| |                              ";
echo " \__, |\___|_| |_|\___|_|_ \__,_|    _   _                     ";
echo "  __/ |       | | (_)/ _(_)         | | (_)                    ";
echo " |___/___ _ __| |_ _| |_ _  ___ __ _| |_ _                     ";
echo " / __/ _ \ '__| __| |  _| |/ __/ _\` | __| |                    ";
echo "| (_|  __/ |  | |_| | | | | (_| (_| | |_| |                    ";
echo " \___\___|_|   \__|_|_| |_|\___\__,_|\__|_|                    ";
echo "  ___  ___ _ ____   _____ _ __                                 ";
echo " / __|/ _ \ '__\ \ / / _ \ '__|                                ";
echo " \__ \  __/ |   \ V /  __/ |                                   ";
echo " |___/\___|_|    \_/ \___|_|                                   ";
echo "                                                               ";
echo "                                                               ";

echo "CREAZIONE CERTIFICATI"

mkdir -p "ServerCerts"

echo "genero la chiave privata server:"
openssl genrsa -out serverPrivateKey.pem 2048

openssl req -x509 -new -key serverPrivateKey.pem -days 36500 -out rootCA.pem -subj '/CN=mbintegrationprod.infobox.it'
openssl req -new -key serverPrivateKey.pem -out serverCert.csr -subj '/L=Te/CN=mbintegrationprod.infobox.it'
openssl x509 -req -days 36500 -CA rootCA.pem -CAkey serverPrivateKey.pem -CAcreateserial -CAserial serial -in serverCert.csr -out serverCert.pem
openssl verify -verbose -CAfile rootCA.pem serverCert.pem

mv rootCA.pem ServerCerts/
mv serverPrivateKey.pem serverCert.pem ServerCerts
rm serverCert.csr serial
