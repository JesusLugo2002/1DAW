# Tarea 2 - Funciones y procedimientos

<div align=center>

![img](https://media.tenor.com/eFeqNqXZS0IAAAAM/cc.gif)

_Pez de la buena suerte, pero segundo_

</div>

## Creación de la base de datos

La base de datos a utilizar para la realización de este ejercicio es la de _Jardinería_, utilizada en ejercicios previos. A continuación se deja el diagrama entidad-relación de la misma.

<div align=center>

![img](https://github.com/jpexposito/docencia/raw/master/Primero/BAE/UNIDAD-8/tareas/tarea2/img/er.png)

</div>

## Función  __calcular_precio_total_pedido__

__Nota__: Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
- Parámetros de entrada: codigo_pedido (INT)
- Parámetros de salida: El precio total del pedido (FLOAT)

```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_precio_total_pedido;
CREATE FUNCTION calcular_precio_total_pedido(in_codigo_pedido int)
RETURNS float deterministic
BEGIN
    DECLARE precio_total float;
    SELECT SUM(precio_unidad * cantidad) FROM detalle_pedido WHERE codigo_pedido = in_codigo_pedido INTO precio_total;
    RETURN precio_total;
END //
DELIMITER ;
```

### Comprobación:
```sql
select calcular_precio_total_pedido(2);

+---------------------------------+
| calcular_precio_total_pedido(2) |
+---------------------------------+
|                            7113 |
+---------------------------------+
```

## Función  __calcular_suma_pedidos_cliente__

__Nota__: Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
- Parámetros de entrada: codigo_cliente (INT)
- Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_suma_pedidos_cliente;
CREATE FUNCTION calcular_suma_pedidos_cliente(in_codigo_cliente int)
RETURNS float deterministic
BEGIN
    DECLARE suma_total float;
    DECLARE pedido int;

    DECLARE pedidos_cur CURSOR FOR SELECT codigo_pedido from pedido where codigo_cliente = in_codigo_cliente;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET suma_total = 0;
    
    SET suma_total = 0.0;

    OPEN pedidos_cur;

    loop1: LOOP
        FETCH pedidos_cur into pedido;
        IF suma_total = 0.0 THEN
            LEAVE loop1;
        END IF;
        SET suma_total = suma_total + calcular_precio_total_pedido(pedido);   
    END LOOP loop1;

    CLOSE pedidos_cur;

    RETURN suma_total;
END//
DELIMITER ;
```

### Comprobación:
```sql
select calcular_suma_pedidos_cliente(16);


```

## Función __calcular_suma_pagos_cliente__

__Nota__: Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
- Parámetros de entrada: codigo_cliente (INT)
- Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)

```sql
DELIMITER //
DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente;
CREATE FUNCTION calcular_suma_pagos_cliente(in_codigo_cliente INT) 
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE pagos_total FLOAT;
    
    SELECT SUM(total)
    INTO pagos_total
    FROM pago as p
    WHERE p.codigo_cliente = in_codigo_cliente;
    
    RETURN pagos_total;
END//
DELIMITER ;
``` 

## Procedimiento __calcular_pagos_pendientes__

__Nota__: Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

```sql

```