# Script de gestión de software

Crear un script en Bash que:

    Debe recibir un argumento (nombre del paquete), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.

    Empezar sincronizando el listado de software local.

    Si el paquete indicado NO ESTÁ INSTALADO en el sistema, se comproborá si existe en los repositorios del sistema:
        Si el paquete SÍ EXISTE en los repositorios: se le mostrará la información del paquete y se le dará la opción de instalarlo.
        Si el paquete NO EXISTE en los repositorios: se le indicará al usuario que no hay ningún paquete que se llame como ha indicado, y se le mostrará el resultado de la búsqueda que se obtiene con el argumento que ha dado el usuario (puede que la búsqueda no dé ningún paquete, o puede que la búsqueda muestre paquetes que se llaman de forma similar. En cualquier caso, se mostrará el resultado).

    Si el paquete indicado SÍ ESTÁ INSTALADO: se le dará la opción de:
        Mostrar su versión
        Reinstalarlo
        Actualizarlo (solo este paquete, si fuera actualizable)
        Eliminarlo (guardando la configuración)
        Eliminarlo totalmente

¡CUIDADO!!! Usar sudo SOLO CUANDO SEA ESTRICTAMENTE NECESARIO!!

#### Respuesta: [Aquí](./gestion-software.sh)