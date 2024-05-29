#!/bin/bash

#####################################################
#
#   Nombre: script-examen-ejercicio1.sh
#   Autor: Jesús Lugo
#
#   Objetivo: gestionar la creación y modificación de grupos
#   de un usuario.
#
#   Entradas: 1 argumento (grupo primario a asignar)
#   Salidas: ninguna
#
#   Versión: 1.0.0
#   Fecha: 22 de marzo, 2024
#
######################################################

USER_DELETED=10
ERR_NOGRP=25

group=$1

trap `echo "Gestión de usuarios en proceso, NO SE PUEDE TERMINAR"` SIGTERM # NO SIRVE... :(

if [ -z "$group" ]; then
    echo "ERROR: No ha indicado ningún grupo primario."
    echo "SINTAXIS: $0 <grupo> <privilegio1>..<privilegioN>"
    exit $ERR_NOGRP
fi

while [ -z "$user" ]; do
    read -p "Inserte el nombre de usuario -> " user
done

getent passwd $user > /dev/null 2> /dev/null

if [ "$?" -eq 0 ]; then
    read -p "¿Desea eliminar al usuario $user? -> " option
    if [ "$option" == "si" ] || [ "$option" == "yes" ] || [ "$option" == "s" ] || [ "$option" == "y" ]; then
        pkill -u $user
        sudo userdel -f -r $user
        echo "El usuario ha sido eliminado."
        exit $USER_DELETED
    fi
else
    sudo useradd -d /home/${user} -m -k /etc/skel -s /bin/bash -g $group $user
    pass=$RANDOM
    sudo chpasswd <<< "$user:$pass"
    if [ "$?" -eq 0 ]; then
        echo "Creado usuario \"$user\" con grupo primario \"$group\" y contraseña: $pass"
    fi
fi

for g in "$@"; do
    getent group $g
    if [ "$?" -eq 0 ]; then
        # No sé borrar un grupo de un usuario... :(
    else
        sudo groupadd $g
        sudo usermod -aG $g $user
    fi
done

