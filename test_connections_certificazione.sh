#!/bin/bash

DIR="ClientCerts"
if [ -d "$DIR" ]; then

    cd $DIR
    clear
    echo " ______   ___ ___________         __  ___  ____  ____    ___    __ ______ ____ ___  ____   _____";
    echo "|      T /  _/ ___|      T       /  ]/   \|    \|    \  /  _]  /  |      l    /   \|    \ / ___/";
    echo "|      |/  [(   \_|      |      /  /Y     |  _  |  _  Y/  [_  /  /|      ||  Y     |  _  (   \_ ";
    echo "l_j  l_Y    _\__  l_j  l_j     /  / |  O  |  |  |  |  Y    _]/  / l_j  l_j|  |  O  |  |  |\__  T";
    echo "  |  | |   [_/  \ | |  |      /   \_|     |  |  |  |  |   [_/   \_  |  |  |  |     |  |  |/  \ |";
    echo "  |  | |     \    | |  |      \     l     |  |  |  |  |     \     | |  |  j  l     |  |  |\    |";
    echo "  l__j l_____j\___j l__j       \____j\___/l__j__l__j__l_____j\____j l__j |____\___/l__j__j \___j";
    echo "                                                                                                ";

    sleep 2
    clear
    echo " _______ _______  ______ _______ _____ _______ _____ _______ _______ ______ _____  _____  __   _ _______";
    echo " |       |______ |_____/    |      |   |______   |   |       |_____|  ____/   |   |     | | \  | |______";
    echo " |_____  |______ |    \_    |    __|__ |       __|__ |_____  |     | /_____ __|__ |_____| |  \_| |______";
    echo "                                                                                                        ";
    echo "    192.168.22.64                                                                                       ";

#    nmap -p 8883 192.168.22.64
    openssl s_client -debug -connect 192.168.22.64:8883 -cert clientCert.pem -key clientPrivatekey.pem -CAfile rootCA.pem

    sleep 2
    clear
    echo " _______ _______  ______ _______ _____ _______ _____ _______ _______ ______ _____  _____  __   _ _______";
    echo " |       |______ |_____/    |      |   |______   |   |       |_____|  ____/   |   |     | | \  | |______";
    echo " |_____  |______ |    \_    |    __|__ |       __|__ |_____  |     | /_____ __|__ |_____| |  \_| |______";
    echo "                                                                                                        ";
    echo "    mbintegration.infobox.it                                                                                       ";

#    nmap -p 18886 mbintegration.infobox.it
    nmap -p 18886 mbintegration.infobox.it
    openssl s_client -debug -connect mbintegration.infobox.it:18886 -cert clientCert.pem -key clientPrivatekey.pem -CAfile rootCA.pem

else
    echo "Genera prima i certificati client! yo.\n\n"
fi
