#!/bin/bash

#####################################################
#
#   Autor: Jesús Lugo
#   jesusdlugo02@gmail.com
#
#   Nombre: autogit.sh
#   Objetivo: Automatizar el pull y push de los repositorios de Github
#
#   Entradas: Token del GitHub
#   Salidas: Ninguna
#
#####################################################

token=$1
while [ -z "$token" ]; do
    read -p "Inserte el Token de la cuenta de GitHub: " token
done

for dir in */; do

    cd $dir
    git fetch
    git pull
    git add .
    git commit -m "AutoGit Update"
    git push
    cd ..

done