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

    clear
    echo "  _____   ______  _____  ______  _     _ ______ _____  _____  __   _ _______";
    echo " |_____] |_____/ |     | |     \ |     |  ____/   |   |     | | \  | |______";
    echo " |       |    \_ |_____| |_____/ |_____| /_____ __|__ |_____| |  \_| |______";
    echo "                                                                            ";
    echo "    22.152                                                                            ";
    openssl s_client -debug -connect 192.168.22.152:8883 -cert clientCert.pem -key clientPrivatekey.pem -CAfile rootCA.pem

    clear
    echo "  _____   ______  _____  ______  _     _ ______ _____  _____  __   _ _______";
    echo " |_____] |_____/ |     | |     \ |     |  ____/   |   |     | | \  | |______";
    echo " |       |    \_ |_____| |_____/ |_____| /_____ __|__ |_____| |  \_| |______";
    echo "                                                                            ";
    echo "    22.152                                                                            ";
    openssl s_client -debug -connect mbintegrationprod.infobox.it:8888 -cert clientCert.pem -key clientPrivatekey.pem -CAfile rootCA.pem

else
    echo "Genera prima i certificati client! yo.\n\n"
fi


