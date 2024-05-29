# Script de gestión de servicios 

Servicios

Crear un script en Bash que:

    Debe recibir un argumento (nombre del servicio), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.
    Lo primero que hará es comprobar si el nombre indicado es realmente un servicio. Si no es así, emitirá un error con código 10 y terminará la ejecución
    Mostrar un resumen del estado del servicio indicando su nombre y si está activo (SÍ o NO), habilitado (SÍ o NO), enmascarado (SÍ o NO)
    Mostrar un menú con las siguientes opciones (van a depender del estado del servicio)
        Activar el servicio (si estaba inactivo y NO enmascarado. Si estaba ya activo, se ofrecerá la opción de Desactivarlo).
        Habilitar el servicio (si estaba deshabilitado. Si estaba habilitado, se ofrecerá la opción de Deshabilitarlo).
        Enmascarar el servicio (si estaba desenmascarado. Si estaba ya enmascarado, se ofrecerá la opción de Desenmascararlo).
        Mostrar configuración del servicio.
        Reiniciar el servicio (dejando el servicio activo).
        Reiniciar el servicio (dejando el servicio en su último estado).
        Aplicar cambios en la configuración dejando el servicio activo (intentando evitar la interrupción del servicio).
        Aplicar cambios en la configuración dejando el servicio en su último estado (intentando evitar la interrupción del servicio).
        Asignar la configuración de habilitado/deshabilitado indicada por el desarrollador (vendor preset).
        Mostrar el tiempo de carga total del sistema.
        Mostrar el tiempo de carga de este servicio.
        Mostrar el nivel de ejecución actual del equipo.
        Apagar el equipo (usar el comando de control de servicios).
        Reiniciar el equipo (usar el comando de control de servicios).
        SALIR

#### Respuesta: [Aquí](/gestion-servicios.sh)