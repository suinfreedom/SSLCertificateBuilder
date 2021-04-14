#!/bin/bash

clear

echo "                                   _ _     _              _ _                 _       _ _ ";
echo "                                  | (_)   | |            | (_)               (_)     | (_)";
echo "  __ _  ___ _ __   ___ _ __ __ _  | |_ ___| |_ __ _    __| |_   ___  ___ _ __ _  __ _| |_ ";
echo " / _\` |/ _ \ '_ \ / _ \ '__/ _\` | | | / __| __/ _\` |  / _\` | | / __|/ _ \ '__| |/ _\` | | |";
echo "| (_| |  __/ | | |  __/ | | (_| | | | \__ \ || (_| | | (_| | | \__ \  __/ |  | | (_| | | |";
echo " \__, |\___|_| |_|\___|_|  \__,_| |_|_|___/\__\__,_|  \__,_|_| |___/\___|_|  |_|\__,_|_|_|";
echo "  __/ |                                                                                   ";
echo " |___/                                                                                    ";


echo "----------------------------------------------------------------------"
echo "menu:"
echo "run:"
echo "      ./genera_lista_certificat.sh from_seriale to_seriale nome_file_out.txt"
echo "      es:"
echo "      ./genera_lista_certificat.sh 900000 900099 nome_file_out.txt"
echo ""
echo ""
echo "----------------------------------------------------------------------"

if [ $# -eq 3 ]
  then
	for n in $(seq $1 $2)
	do
	    echo $n >> $3
	done
	echo "generated cert list in $3"
  else
	echo "wrong input parameters"
fi

