#!/bin/bash

clear

echo "                                                 _   _  __ _           _   _        _ _            _   ";
echo "                                                | | (_)/ _(_)         | | (_)      | (_)          | |  ";
echo "  __ _  ___ _ __   ___ _ __ __ _    ___ ___ _ __| |_ _| |_ _  ___ __ _| |_ _    ___| |_  ___ _ __ | |_ ";
echo " / _\` |/ _ \ '_ \ / _ \ '__/ _\` |  / __/ _ \ '__| __| |  _| |/ __/ _\` | __| |  / __| | |/ _ \ '_ \| __|";
echo "| (_| |  __/ | | |  __/ | | (_| | | (_|  __/ |  | |_| | | | | (_| (_| | |_| | | (__| | |  __/ | | | |_ ";
echo " \__, |\___|_| |_|\___|_|  \__,_|  \___\___|_|   \__|_|_| |_|\___\__,_|\__|_|  \___|_|_|\___|_| |_|\__|";
echo "  __/ |                                                                                                ";
echo " |___/                                                                                                 ";

mkdir -p "Dispositivi"
echo "INSERT INTO microboxhome.device_uuid (serial, uuid, rootca, clientcert, clientkey)" > Dispositivi/writeCompose.sql
echo "VALUES" >> Dispositivi/writeCompose.sql

while IFS= read -r device; do
  mkdir -p Dispositivi/$device
  GENERATEDUUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  cd Dispositivi
  echo $GENERATEDUUID > $device/UUID
  openssl genrsa -out $device/clientPrivatekey.pem 2048
  openssl req -new -key $device/clientPrivatekey.pem -out $device/client.req -subj "/CN=mbintegrationprod.infobox.it/UID=$GENERATEDUUID"
  openssl x509 -req -in $device/client.req -CA ../../ServerCerts/rootCA.pem -CAkey ../../ServerCerts/serverPrivateKey.pem -set_serial 101 -extensions client -days 36500 -outform PEM -out $device/clientCert.pem
  ROOTCA=$(cat ../../ServerCerts/rootCA.pem)
  CLIENTCERT=$(cat $device/clientCert.pem)
  CLIENTKEY=$(cat $device/clientPrivatekey.pem)
  echo $ROOTCA
  echo $CLIENTCERT
  echo $CLIENTKEY

  echo "('$device', '$GENERATEDUUID', '$ROOTCA', '$CLIENTCERT', '$CLIENTKEY')," >> writeCompose.sql

  cd ..
done < "$1"
#LASTVIRGOLA=$(tail -c 2 Dispositivi/writeCompose.sql)
#echo $LASTVIRGOLA
#sed "$ s/$LASTVIRGOLA/;/" Dispositivi/writeCompose.sql
#sed "$ s/$(tail -c 2 Dispositivi/writeCompose.sql)/;/" Dispositivi/writeCompose.sql
