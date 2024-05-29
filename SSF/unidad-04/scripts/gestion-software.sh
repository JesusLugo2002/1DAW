#!/bin/bash

################################################################
#
#   Nombre: script-gestion-software.sh
#
#   Autores: Jesús Lugo y Miguel Angel
#   
#   Objetivo: crear un script de gestión de software simple.
#
#   Entradas: un paquete de software como argumento.
#   Salidas: dependiente de las elecciones del usuario.
#
#   Versión: 01
#   Fecha: 07-02-2024
#
################################################################

clear

package=$1

while [ -z "$package" ]; do
    echo "ERROR: Debe ingresar el nombre de un paquete de software."
    read -p "Ingrese el nombre del paquete --> " package
done
echo "-=- Sincronización de repositorio -=-"
sudo apt-get update > /dev/null 2>&1

clear

dpkg -s "$package" > /dev/null 2>&1

if [ "$?" -eq 0 ]; then
    echo "El paquete $package está instalado. ¿Qué desea realizar?"
    echo " -=----------=- MENÚ -=----------=- "
    select option in "Mostrar versión" "Reinstalar" "Actualizar" "Eliminar (Guardar configuración)" "Eliminar totalmente" "Salir"; do
        case $option in

            "Mostrar versión") echo "La versión del paquete $package es $(apt version $package)" 
            ;;

            "Reinstalar") sudo apt-get reinstall $package
            ;;

            "Actualizar") sudo apt-get install $package
            ;;

            "Eliminar (Guardar configuración)") sudo apt-get remove $package
            ;;

            "Eliminar totalmente") sudo apt-get purge $package
            ;;

            "Salir") exit 0

        esac
    done

elif [ "$?" -eq 1 ]; then

    apt-cache show "$package" > /dev/null 2> /dev/null

    code=$?

    if [ "$code" -eq 0 ]; then

        echo "El paquete $package no está instalado."
        read -p "¿Quiere instalar este programa? (si/no) " answer
        case "$answer" in

            yes|si|s|y|1) sudo apt-get install $package
            ;;

            n|no|0) echo "Hasta la vista bebé. <3"
            exit 0
            ;;

        esac

    elif [ "$code" -eq 100 ]; then

        echo "No existe ningún paquete llamado $package."
        echo "Cargando lista de paquetes similares..."
        sleep 5
        echo " -=- Lista de paquetes similares (Si no aparecen es porque no existen paquetes similares :D) -=- "
        apt-cache search "$package"

    fi

fi