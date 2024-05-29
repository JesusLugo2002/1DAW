#!/bin/bash

##################################################################################################
#
#   Autores: Jesús Lugo e Inna Vdovitsyna
#
#   Objetivo: realizar funciones para la gestión de procesos del sistema.
#
#   Entradas: 2 argumentos (porcentaje máximo de uso CPU y porcentaje máximo de uso de memoria).
#   Salidas: Información sobre la carga de sistema o límites de los procesos.
#
#   Versión: 1.0.0
#   Fecha: 22 de Febrero, 2024
#
##################################################################################################
              
if [ "$#" -ne 2 ]; then
   echo "Debe indicar 2 argumentos. SINTAXIS: $0 <max_CPU> <max_Mem>"
   exit 100
elif [ "$1" -lt 0 ] || [ "$2" -lt 0 ]; then
   echo "Los argumentos deben ser mayores o iguales que 0"
   exit 200
elif [ "$2" -gt 100 ]; then
   echo "maxMem debe ser menor o igual que 100"
   exit 150
else
   maxCPU=$1
   maxMem=$2
fi

while true; do

    trap "echo 'Interrumpiendo ejecución.' ; exit 0" SIGINT
    trap "echo 'Finalizando ejecución.' ; exit 0" SIGTERM
    trap "uptime" SIGUSR1
    trap "echo 'Los límites configurados para los procesos son que su uso máximo de CPU es del ${maxCPU}% y su uso máximo de memoria es del ${maxMem}%'" SIGUSR2

   cur_maxCPU=$(ps -eo %cpu --sort=-%cpu --no-headers | head -1 | cut -d '.' -f 1)
   pid_cpu=$(ps -eo pid --sort=-%cpu --no-headers | head -1)
   cur_maxMem=$(ps -eo %mem --sort=-%mem --no-headers | head -1 | cut -d '.' -f 1)
   pid_mem=$(ps -eo pid --sort=-%mem --no-headers | head -1)

    if [ "$cur_maxCPU" -gt "$maxCPU" ] || [ "$cur_maxMem" -gt "$maxMem" ] ; then
        clear
        echo " -=- ADVERTENCIA -=- "
        if [ "$cur_maxCPU" -gt "$maxCPU" ]; then
            echo "El proceso $pid_cpu ha superado el uso máximo de CPU."
            processId=$pid_cpu
        elif [ "$cur_maxMem" -gt "$maxMem" ]; then
            echo "El proceso $pid_mem ha superado el uso máximo de memoria."
            processId=$pid_mem
        fi
        echo
        echo "¿Qué desea realizar?"
        echo
        select option in "Ignorar aviso" "Disminuir prioridad" "Interrumpir proceso" "Terminar proceso" "Finalizar inmediatamente" "Detener proceso (Congelación evitable)" "Detener proceso (Congelación inevitable)"; do
            case $option in

                "Ignorar aviso") clear ; break
                ;;

                "Disminuir prioridad") clear ; renice 3 $processId && echo "Se ha disminuido la prioridad del proceso en 3 puntos." ; break
                ;;

                "Interrumpir proceso") clear ; kill -INT $processId && echo "Se ha interrumpido el proceso." ; break
                ;;
        
                "Terminar proceso") clear ; kill -TERM $processId && echo "Se ha terminado el proceso." ; break
                ;;

                "Finalizar inmediatamente") clear ; kill -KILL $processId && echo "Se ha matado el proceso." ; break
                ;;

                "Detener proceso (Congelación evitable)") clear ; kill -STOP $processId && echo "Se ha detenido el proceso (forma evitable)." ; break
                ;;

                "Detener proceso (Congelación inevitable)") clear ; kill -TSTP $processId && echo "Se ha detenido el proceso (forma inevitable)." ; break
                ;;
            esac
        done
    fi
    echo "Revisando procesos en funcionamiento..."
    sleep 30
done
