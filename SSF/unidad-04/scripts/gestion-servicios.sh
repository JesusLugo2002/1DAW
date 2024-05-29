#!/bin/bash

##################################################################################################
#
#   Nombre: gestion-servicios.sh
#   Autores: José Domingo y Jesús Lugo.
#
#   Objetivo: gestionar el estado de un servicio dado.
#
#   Entradas: 1 argumento (Nombre de servicio).
#   Salidas: Información sobre el servicio y opciones posibles a realizar.
#
#   Versión: 1.0.0
#   Fecha: 24 de Febrero, 2024
#
##################################################################################################

RED='\033[1;31m'
GREEN='\033[1;32m'
BOLDWHITE='\033[1;37m'
NOCOLOR="\033[0m"

# 1. Recepción del argumento/servicio

svc_name=$1
while [ -z "$svc_name" ]; do
    echo "ADVERTENCIA: No ha indicado un nombre de servicio."
    read -p "Inserte el nombre del servicio a gestionar --> " svc_name
done

# 2. Comprobación '¿es un servicio?'

systemctl status "$svc_name" >/dev/null 2>/dev/null
if [ "$?" -eq 4 ]; then
    echo "ERROR: Servicio $svc_name no encontrado."
    exit 10
fi

while true; do
clear

    # 3. Resumen del estado de servicio

    echo ""
    echo "*****************************"
    echo "**** GESTOR DE SERVICIOS ****"
    echo "*****************************"
    echo ""

    echo -e "Nombre de servicio: ${BOLDWHITE}$svc_name${NOCOLOR}"

    is_active=$(systemctl is-active $svc_name)
    if [ "$is_active" == "active" ]; then
        echo -e "Estado: ${GREEN}ACTIVO${NOCOLOR}"
    else
        echo -e "Estado: ${RED}INACTIVO${NOCOLOR}"
    fi

    status=$(systemctl is-enabled $svc_name)
    case $status in 
        "enabled")
        echo -e "El servicio está ${GREEN}HABILITADO${NOCOLOR}."
        ;;

        "disabled")
        echo -e "El servicio está ${RED}DESHABILITADO${NOCOLOR}."
        ;;

        "masked")
        echo -e "El servicio está ${BOLDWHITE}ENMASCARADO${NOCOLOR}."
        ;;
    esac

    # 4. Menú principal

    echo ""
    echo "*************************"
    echo "**** O P C I O N E S ****"
    echo "*************************"
    echo ""
    if [ "$is_active" == "inactive" ]; then
        echo " a) Activar el servicio"
    elif [ "$is_active" == "active" ]; then
        echo " a) Desactivar el servicio"
    fi
    if [ "$status" == "enabled" ]; then
        echo " b) Deshabilitar el servicio"
    else
        echo " b) Habilitar el servicio"
    fi
    if [ "$status" == "masked" ]; then
        echo " c) Desenmascarar el servicio"
    else
        echo " c) Enmascarar el servicio"
    fi
    echo " d) Mostrar la configuración del servicio"
    echo " e) Reiniciar el servicio (dejandolo activo)"
    echo " f) Reiniciar el servicio (dejando el servicio en su último estado)"
    echo " g) Aplicar cambios en la configuración dejando el servicio activo"
    echo " h) Aplicar cambios en la configuración dejando el servicio en su último estado"
    echo " i) Mostrar el tiempo de carga total del sistema"
    echo " j) Mostrar el tiempo de carga de este servicio"
    echo " k) Mostrar el nivel de ejecución actual del equipo"
    echo " l) Apagar el equipo"
    echo " m) Reiniciar el equipo"
    echo " n) Salir"
    echo ""

    read -p "Introduzca la opción que quiere realizar a su servicio: " opcion
    echo ""

    case $opcion in
        a|A|1)
        if [ "$is_active" == "inactive" ]; then
            sudo systemctl start $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha activado."
        else
            sudo systemctl stop $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha desactivado."
        fi
        ;;
        b|B|2) 
        if [ "$status" == "enabled" ]; then 
            sudo systemctl disable $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha deshabilitado."
        elif [ "$status" == "disabled" ]; then
            sudo systemctl enable $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha habilitado."
        elif [ "$status" == "masked" ]; then
            echo "ERROR: El servicio no se puede habilitar porque está enmascarado."
        fi
        ;;
        c|C|3)
        if [ "$status" = "masked" ]; then
            sudo systemctl unmask $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha desenmascarado."
        else 
            sudo systemctl mask $svc_name >/dev/null 2>/dev/null
            echo "El servicio $svc_name se ha enmascarado."
        fi
        ;;
        d|D|4) echo "Mostrando la configuración de $svc_name..."
        sleep 2
        systemctl show $svc_name
        ;;
        e|E|5) echo "Reiniciando $svc_name..."
        sudo systemctl restart $svc_name >/dev/null 2>/dev/null
        sleep 5
        ;;
        f|F|6) echo "Reiniciando $svc_name en su último estado."
        sudo systemctl try-restart $svc_name >/dev/null 2>/dev/null
        sleep 3
        ;;
        g|G|7) echo "Aplicando los cambios y manteniendo $svc_name activo"
        sudo systemctl reload $svc_name >/dev/null 2>/dev/null
        sleep 3
        ;;
        h|H|8) echo "Aplicando los cambios, pero no reiniciandolo a $svc_name"
        systemctl reload --now $svc_name >/dev/null 2>/dev/null
        sleep 3
        ;;
        i|I|9) echo "Mostrando el tiempo de carga total del sistema:"
        uptime
        echo ""
        read -p "Presione Enter para continuar..."
        ;;
        j|J|10) time=$(systemd-analyze blame | grep "$svc_name" | tr -s " " | cut -d " " -f 2)
        echo "El tiempo de carga del servicio $svc_name es de $time"
        echo ""
        read -p "Presione Enter para continuar..."
        ;;
        k|K|11) echo "El nivel actual de ejecución del equipo es: $(systemctl get-default)"
        echo ""
        read -p "Presione Enter para continuar..."
        ;;
        l|L|12) echo "Se procederá a apagar el equipo"
        echo "Se está apagando el sistema..."
        sleep 5
        sudo systemctl isolate runlevel0.target
        ;;
        m|M|13) echo "Se procederá a reinicar el equipo"
        echo "Se esta reiniciando el sistema..."
        sleep 5
        sudo systemctl isolate runlevel6.target
        ;;
        n|N|14) exit 0
    esac

done