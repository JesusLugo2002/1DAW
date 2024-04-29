# Ejercicios de repaso

<div align=center>
    
![gif](https://www.gifmaniacos.es/wp-content/uploads/2019/04/peces-gif-gifmaniacos.es-15.gif)

*Pez de la buena suerte.*

</div>

## Índice

- [Consultas sobre una table](#consultas-sql-sobre-una-tabla)
- [Consultas multitablas (con Where)](#consultas-multitabla-where-para-unir-tablas)
- [Consultas multitables (con Join)](#consultas-multitabla-inner-join)
- [Consultas resumen](#consultas-resumen-countavg)
- [Subconsultas](#subconsultas-en-sql)
- [Consultas variadas](#consultas-variadas-en-sql)

### Consultas SQL sobre una tabla

- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql
select codigo_oficina, ciudad from oficina;
```
| codigo_oficina |        ciudad        |
|----------------|----------------------|
| BCN-ES         | Barcelona            |
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |

- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
```sql
select ciudad, telefono from oficina where pais = 'España';
```
|        ciudad        |    telefono    |
|----------------------|----------------|
| Barcelona            | +34 93 3561182 |
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |

- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
```sql
select nombre, apellido1, apellido2, email from empleado where codigo_jefe = 7;
```
| nombre  | apellido1 | apellido2 |          email           |
|---------|-----------|-----------|--------------------------|
| Mariano | López     | Murcia    | mlopez@jardineria.es     |
| Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
| Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |

- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
```sql
select puesto, nombre, apellido1, apellido2, email from empleado where codigo_jefe is Null;
```
|      puesto      | nombre | apellido1 | apellido2 |        email         |
|------------------|--------|-----------|-----------|----------------------|
| Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es |

- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
```sql
select nombre, apellido1, apellido2, puesto from empleado where puesto != 'Representante Ventas';
```
|  nombre  | apellido1  | apellido2 |        puesto         |
|----------|------------|-----------|-----------------------|
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Emmanuel | Magaña     | Perez     | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |

- Devuelve un listado con el nombre de los todos los clientes españoles.
```sql
select nombre_cliente from cliente where pais = 'Spain';
```
|         nombre_cliente         |
|--------------------------------|
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| Flores S.L.                    |

- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
```sql
select distinct estado from pedido;
```
|  estado   |
|-----------|
| Entregado |
| Rechazado |
| Pendiente |

- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
```sql
select distinct codigo_cliente from pago where fecha_pago regexp '2008';
```
| codigo_cliente |
|----------------|
| 1              |
| 13             |
| 14             |
| 26             |

- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega > fecha_esperada;
```
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
|---------------|----------------|----------------|---------------|
| 9             | 1              | 2008-12-27     | 2008-12-28    |
| 13            | 7              | 2009-01-14     | 2009-01-15    |
| 16            | 7              | 2009-01-07     | 2009-01-15    |
| 17            | 7              | 2009-01-09     | 2009-01-11    |
| 18            | 9              | 2009-01-06     | 2009-01-07    |
| 22            | 9              | 2009-01-11     | 2009-01-13    |
| 28            | 3              | 2009-02-17     | 2009-02-20    |
| 31            | 13             | 2008-09-30     | 2008-10-04    |
| 32            | 4              | 2007-01-19     | 2007-01-27    |
| 38            | 19             | 2009-03-06     | 2009-03-07    |
| 39            | 19             | 2009-03-07     | 2009-03-09    |
| 40            | 19             | 2009-03-10     | 2009-03-13    |
| 42            | 19             | 2009-03-23     | 2009-03-27    |
| 43            | 23             | 2009-03-26     | 2009-03-28    |
| 44            | 23             | 2009-03-27     | 2009-03-30    |
| 45            | 23             | 2009-03-04     | 2009-03-07    |
| 46            | 23             | 2009-03-04     | 2009-03-05    |
| 49            | 26             | 2008-07-22     | 2008-07-30    |
| 55            | 14             | 2009-01-10     | 2009-01-11    |
| 60            | 1              | 2008-12-27     | 2008-12-28    |
| 68            | 3              | 2009-02-17     | 2009-02-20    |
| 92            | 27             | 2009-04-30     | 2009-05-03    |
| 96            | 35             | 2008-04-12     | 2008-04-13    |
| 103           | 30             | 2009-01-20     | 2009-01-24    |
| 106           | 30             | 2009-05-15     | 2009-05-20    |
| 112           | 36             | 2009-04-06     | 2009-05-07    |
| 113           | 36             | 2008-11-09     | 2009-01-09    |
| 114           | 36             | 2009-01-29     | 2009-01-31    |
| 115           | 36             | 2009-01-26     | 2009-02-27    |
| 123           | 30             | 2009-01-20     | 2009-01-24    |
| 126           | 30             | 2009-05-15     | 2009-05-20    |
| 128           | 38             | 2008-12-10     | 2008-12-29    |


- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega < fecha_esperada - 2; -- NO SIRVE
```
- Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
```sql
select * from pedido where estado = 'Rechazado' and fecha_pedido regexp '2009';
```
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                         comentarios                          | codigo_cliente |
|---------------|--------------|----------------|---------------|-----------|--------------------------------------------------------------|----------------|
| 14            | 2009-01-02   | 2009-01-02     |               | Rechazado | mal pago                                                     | 7              |
| 21            | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                     | 9              |
| 25            | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada             | 1              |
| 26            | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto     | 3              |
| 40            | 2009-03-09   | 2009-03-10     | 2009-03-13    | Rechazado |                                                              | 19             |
| 46            | 2009-04-03   | 2009-03-04     | 2009-03-05    | Rechazado |                                                              | 23             |
| 65            | 2009-02-02   | 2009-02-08     |               | Rechazado | El cliente carece de saldo en la cuenta asociada             | 1              |
| 66            | 2009-02-06   | 2009-02-12     |               | Rechazado | El cliente anula la operacion para adquirir mas producto     | 3              |
| 74            | 2009-01-14   | 2009-01-22     |               | Rechazado | El pedido no llego el dia que queria el cliente por fallo de | 15             |
|               |              |                |               |           | l transporte                                                 |                |
| 81            | 2009-01-18   | 2009-01-24     |               | Rechazado | Los producto estaban en mal estado                           | 28             |
| 101           | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                       | 16             |
| 105           | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad          | 30             |
| 120           | 2009-03-07   | 2009-03-27     |               | Rechazado | El pedido fue rechazado por el cliente                       | 16             |
| 125           | 2009-02-14   | 2009-02-20     |               | Rechazado | el producto ha sido rechazado por la pesima calidad          | 30             |

- Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
```sql
select * from pedido where estado regexp 'Entregado' and fecha_pedido regexp '-01-';
```
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega |  estado   |                      comentarios                       | codigo_cliente |
|---------------|--------------|----------------|---------------|-----------|--------------------------------------------------------|----------------|
| 1             | 2006-01-17   | 2006-01-19     | 2006-01-19    | Entregado | Pagado a plazos                                        | 5              |
| 13            | 2009-01-12   | 2009-01-14     | 2009-01-15    | Entregado |                                                        | 7              |
| 15            | 2009-01-09   | 2009-01-12     | 2009-01-11    | Entregado |                                                        | 7              |
| 16            | 2009-01-06   | 2009-01-07     | 2009-01-15    | Entregado |                                                        | 7              |
| 17            | 2009-01-08   | 2009-01-09     | 2009-01-11    | Entregado | mal estado                                             | 7              |
| 18            | 2009-01-05   | 2009-01-06     | 2009-01-07    | Entregado |                                                        | 9              |
| 22            | 2009-01-11   | 2009-01-11     | 2009-01-13    | Entregado |                                                        | 9              |
| 32            | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entregado | Entrega tardia, el cliente puso reclamacion            | 4              |
| 58            | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                          | 3              |
| 64            | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                          | 1              |
| 75            | 2009-01-11   | 2009-01-13     | 2009-01-13    | Entregado | El pedido llego perfectamente                          | 15             |
| 79            | 2009-01-12   | 2009-01-13     | 2009-01-13    | Entregado |                                                        | 28             |
| 82            | 2009-01-20   | 2009-01-29     | 2009-01-29    | Entregado | El pedido llego un poco mas tarde de la hora fijada    | 28             |
| 83            | 2009-01-24   | 2009-01-28     |               | Entregado |                                                        | 28             |
| 95            | 2008-01-04   | 2008-01-19     | 2008-01-19    | Entregado |                                                        | 35             |
| 100           | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                          | 16             |
| 114           | 2009-01-15   | 2009-01-29     | 2009-01-31    | Entregado | El envio llego dos dias más tarde debido al mal tiempo | 36             |
| 119           | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                          | 16             |

- Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
```sql
select * from pago where fecha_pago regexp '2008' and forma_pago = 'PayPal' order by total desc;
```
| codigo_cliente | forma_pago | id_transaccion | fecha_pago | total |
|----------------|------------|----------------|------------|-------|
| 26             | PayPal     | ak-std-000020  | 2008-03-18 | 18846 |
| 14             | PayPal     | ak-std-000015  | 2008-07-15 | 4160  |
| 13             | PayPal     | ak-std-000014  | 2008-08-04 | 2246  |
| 1              | PayPal     | ak-std-000001  | 2008-11-10 | 2000  |
| 1              | PayPal     | ak-std-000002  | 2008-12-10 | 2000  |

- Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
```sql
select distinct forma_pago from pago;
```
|  forma_pago   |
|---------------|
| PayPal        |
| Transferencia |
| Cheque        |

- Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
```sql
select * from producto where gama = 'Ornamentales' and cantidad_en_stock > 100 order by precio_venta desc;
```
| codigo_producto |                    nombre                    |     gama     | dimensiones |    proveedor     |                         descripcion                          | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|----------------------------------------------|--------------|-------------|------------------|--------------------------------------------------------------|-------------------|--------------|------------------|
| OR-115          | Forsytia Intermedia \"Lynwood\"              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 7            | 5                |
| OR-116          | Hibiscus Syriacus  \"Diana\" -Blanco Puro    | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa        | Ornamentales | 35-45       | Viveros EL OASIS | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                              |              |             |                  | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                              |              |             |                  | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                              |              |             |                  | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                              |              |             |                  | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                              |              |             |                  | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                              |              |             |                  | .                                                            |                   |              |                  |
| OR-112          | Escallonia (Mix)                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                      | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                          | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo     | Ornamentales | 40-50       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-120          | Lonicera Nitida                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-121          | Lonicera Nitida \"Maigrum\"                  | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-122          | Lonicera Pileata                             | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-123          | Philadelphus \"Virginal\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                              | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-125          | Viburnum Tinus \"Eve Price\"                 | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                    | Ornamentales | 35-45       | Viveros EL OASIS |                                                              | 120               | 5            | 4                |

- Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
```sql
select * from cliente where ciudad = 'Madrid' and codigo_empleado_rep_ventas in (11, 30);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1  | linea_direccion2 | ciudad | region | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|-----------|-----------|-------------------|------------------|--------|--------|-------|---------------|----------------------------|----------------|
| 7              | Beragua                     | Jose            | Bermejo           | 654987321 | 916549872 | C/pintor segundo  | Getafe           | Madrid | Madrid | Spain | 28942         | 11                         | 20000          |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810  | 919535678 | C/sinesio delgado | Madrid           | Madrid | Madrid | Spain | 28930         | 11                         | 40000          |
| 9              | Naturagua                   | Guillermo       | Rengifo           | 689234750 | 916428956 | C/majadahonda     | Boadilla         | Madrid | Madrid | Spain | 28947         | 11                         | 32000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001 | 916421756 | C/azores          | Fuenlabrada      | Madrid | Madrid | Spain | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045 | 916689215 | C/Lagañas         | Fuenlabrada      | Madrid | Madrid | Spain | 28943         | 11                         | 20000          |
| 15             | Jardin de Flores            | Javier          | Villar            | 654865643 | 914538776 | C/ Oña 34         |                  | Madrid | Madrid | Spain | 28950         | 30                         | 40000          |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529 | 916548735 | Plaza Magallón 15 |                  | Madrid | Madrid | Spain | 28011         | 30                         | 5050           |

### Consultas multitabla (Where para unir tablas)

- Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
```sql
select c.nombre_cliente, r.nombre || ' ' || r.apellido1 as nombre_completo_empleado from cliente as c, empleado as r where c.codigo_empleado_rep_ventas = r.codigo_empleado and r.puesto = 'Representante Ventas';
```
|         nombre_cliente         | nombre_completo_empleado |
|--------------------------------|--------------------------|
| GoldFish Garden                | Walter Santiago Sanchez  |
| Gardening Associates           | Walter Santiago Sanchez  |
| Gerudo Valley                  | Lorena Paxton            |
| Tendo Garden                   | Lorena Paxton            |
| Lasas S.A.                     | Mariano López            |
| Lasas S.A.                     | Mariano López            |
| Camunas Jardines S.L.          | Mariano López            |
| Dardena S.A.                   | Mariano López            |
| Jardin de Flores               | Julian Bellinelli        |
| Flores Marivi                  | Felipe Rosas             |
| Flowers, S.A                   | Felipe Rosas             |
| Naturajardin                   | Julian Bellinelli        |
| Golf S.A.                      | José Manuel Martinez     |
| Americh Golf Management SL     | José Manuel Martinez     |
| Aloha                          | José Manuel Martinez     |
| El Prat                        | José Manuel Martinez     |
| Sotogrande                     | José Manuel Martinez     |
| Vivero Humanes                 | Julian Bellinelli        |
| Fuenla City                    | Felipe Rosas             |
| Jardines y Mansiones Cactus SL | Lucio Campoamor          |
| Jardinerías Matías SL          | Lucio Campoamor          |
| Agrojardin                     | Julian Bellinelli        |
| Top Campo                      | Felipe Rosas             |
| Jardineria Sara                | Felipe Rosas             |
| Campohermoso                   | Julian Bellinelli        |
| france telecom                 | Lionel Narvaez           |
| Musée du Louvre                | Lionel Narvaez           |
| Tutifruti S.A                  | Mariko Kishi             |
| El Jardin Viviente S.L         | Mariko Kishi             |

- Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql
select distinct c.nombre_cliente, e.nombre as nombre_representante from cliente as c, empleado as e, pago as p where c.codigo_empleado_rep_ventas = e.codigo_empleado and c.codigo_cliente = p.codigo_cliente;
```
|         nombre_cliente         | nombre_representante |
|--------------------------------|----------------------|
| GoldFish Garden                | Walter Santiago      |
| Gardening Associates           | Walter Santiago      |
| Gerudo Valley                  | Lorena               |
| Tendo Garden                   | Lorena               |
| Beragua                        | Emmanuel             |
| Naturagua                      | Emmanuel             |
| Camunas Jardines S.L.          | Mariano              |
| Dardena S.A.                   | Mariano              |
| Jardin de Flores               | Julian               |
| Flores Marivi                  | Felipe               |
| Golf S.A.                      | José Manuel          |
| Sotogrande                     | José Manuel          |
| Jardines y Mansiones Cactus SL | Lucio                |
| Jardinerías Matías SL          | Lucio                |
| Agrojardin                     | Julian               |
| Jardineria Sara                | Felipe               |
| Tutifruti S.A                  | Mariko               |
| El Jardin Viviente S.L         | Mariko               |


- Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql
select distinct c.nombre_cliente, e.nombre as nombre_representante from cliente as c, empleado as e where c.codigo_empleado_rep_ventas = e.codigo_empleado and c.codigo_cliente not in (select codigo_cliente from pago);
```
|       nombre_cliente        | nombre_representante |
|-----------------------------|----------------------|
| Lasas S.A.                  | Mariano              |
| Club Golf Puerta del hierro | Emmanuel             |
| DaraDistribuciones          | Emmanuel             |
| Madrileña de riegos         | Emmanuel             |
| Flowers, S.A                | Felipe               |
| Naturajardin                | Julian               |
| Americh Golf Management SL  | José Manuel          |
| Aloha                       | José Manuel          |
| El Prat                     | José Manuel          |
| Vivero Humanes              | Julian               |
| Fuenla City                 | Felipe               |
| Top Campo                   | Felipe               |
| Campohermoso                | Julian               |
| france telecom              | Lionel               |
| Musée du Louvre             | Lionel               |
| Flores S.L.                 | Michael              |
| The Magic Garden            | Michael              |

- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select distinct c.nombre_cliente, e.nombre as nombre_representante, o.ciudad as ciudad_oficina from cliente as c, empleado as e, pago as p, oficina as o where c.codigo_empleado_rep_ventas = e.codigo_empleado and c.codigo_cliente = p.codigo_cliente and e.codigo_oficina = o.codigo_oficina;
```
|         nombre_cliente         | nombre_representante |    ciudad_oficina    |
|--------------------------------|----------------------|----------------------|
| GoldFish Garden                | Walter Santiago      | San Francisco        |
| Gardening Associates           | Walter Santiago      | San Francisco        |
| Gerudo Valley                  | Lorena               | Boston               |
| Tendo Garden                   | Lorena               | Boston               |
| Beragua                        | Emmanuel             | Barcelona            |
| Naturagua                      | Emmanuel             | Barcelona            |
| Camunas Jardines S.L.          | Mariano              | Madrid               |
| Dardena S.A.                   | Mariano              | Madrid               |
| Jardin de Flores               | Julian               | Sydney               |
| Flores Marivi                  | Felipe               | Talavera de la Reina |
| Golf S.A.                      | José Manuel          | Barcelona            |
| Sotogrande                     | José Manuel          | Barcelona            |
| Jardines y Mansiones Cactus SL | Lucio                | Madrid               |
| Jardinerías Matías SL          | Lucio                | Madrid               |
| Agrojardin                     | Julian               | Sydney               |
| Jardineria Sara                | Felipe               | Talavera de la Reina |
| Tutifruti S.A                  | Mariko               | Sydney               |
| El Jardin Viviente S.L         | Mariko               | Sydney               |

- Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select distinct c.nombre_cliente, e.nombre as nombre_representante, o.ciudad as ciudad_oficina from cliente as c, empleado as e, pago as p, oficina as o where c.codigo_empleado_rep_ventas = e.codigo_empleado  and e.codigo_oficina = o.codigo_oficina and c.codigo_cliente not in (select codigo_cliente from pago);
```
|       nombre_cliente        | nombre_representante |    ciudad_oficina    |
|-----------------------------|----------------------|----------------------|
| Lasas S.A.                  | Mariano              | Madrid               |
| Club Golf Puerta del hierro | Emmanuel             | Barcelona            |
| DaraDistribuciones          | Emmanuel             | Barcelona            |
| Madrileña de riegos         | Emmanuel             | Barcelona            |
| Flowers, S.A                | Felipe               | Talavera de la Reina |
| Naturajardin                | Julian               | Sydney               |
| Americh Golf Management SL  | José Manuel          | Barcelona            |
| Aloha                       | José Manuel          | Barcelona            |
| El Prat                     | José Manuel          | Barcelona            |
| Vivero Humanes              | Julian               | Sydney               |
| Fuenla City                 | Felipe               | Talavera de la Reina |
| Top Campo                   | Felipe               | Talavera de la Reina |
| Campohermoso                | Julian               | Sydney               |
| france telecom              | Lionel               | Paris                |
| Musée du Louvre             | Lionel               | Paris                |
| Flores S.L.                 | Michael              | San Francisco        |
| The Magic Garden            | Michael              | San Francisco        |

- Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
```sql
select distinct o.ciudad, o.pais, o.region, o.codigo_postal, o.linea_direccion1, o.linea_direccion2 from oficina as o, cliente as c, empleado as e where c.codigo_empleado_rep_ventas = e.codigo_empleado and e.codigo_oficina = o.codigo_oficina and c.ciudad = 'Fuenlabrada'; 
```
|        ciudad        |   pais    |      region       | codigo_postal |       linea_direccion1       |  linea_direccion2  |
|----------------------|-----------|-------------------|---------------|------------------------------|--------------------|
| Madrid               | España    | Madrid            | 28032         | Bulevar Indalecio Prieto, 32 |                    |
| Talavera de la Reina | España    | Castilla-LaMancha | 45632         | Francisco Aguirre, 32        | 5º piso (exterior) |
| Sydney               | Australia | APAC              | NSW 2010      | 5-11 Wentworth Avenue        | Floor #2           |

- Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select c.nombre_cliente, e.nombre || ' ' || e.apellido1 as nombre_completo_empleado, o.ciudad as ciudad_oficina from cliente as c, empleado as e, oficina as o where c.codigo_empleado_rep_ventas = e.codigo_empleado and e.codigo_oficina = o.codigo_oficina and e.puesto = 'Representante Ventas';
```
|         nombre_cliente         | nombre_completo_empleado |    ciudad_oficina    |
|--------------------------------|--------------------------|----------------------|
| GoldFish Garden                | Walter Santiago Sanchez  | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez  | San Francisco        |
| Gerudo Valley                  | Lorena Paxton            | Boston               |
| Tendo Garden                   | Lorena Paxton            | Boston               |
| Lasas S.A.                     | Mariano López            | Madrid               |
| Lasas S.A.                     | Mariano López            | Madrid               |
| Camunas Jardines S.L.          | Mariano López            | Madrid               |
| Dardena S.A.                   | Mariano López            | Madrid               |
| Jardin de Flores               | Julian Bellinelli        | Sydney               |
| Flores Marivi                  | Felipe Rosas             | Talavera de la Reina |
| Flowers, S.A                   | Felipe Rosas             | Talavera de la Reina |
| Naturajardin                   | Julian Bellinelli        | Sydney               |
| Golf S.A.                      | José Manuel Martinez     | Barcelona            |
| Americh Golf Management SL     | José Manuel Martinez     | Barcelona            |
| Aloha                          | José Manuel Martinez     | Barcelona            |
| El Prat                        | José Manuel Martinez     | Barcelona            |
| Sotogrande                     | José Manuel Martinez     | Barcelona            |
| Vivero Humanes                 | Julian Bellinelli        | Sydney               |
| Fuenla City                    | Felipe Rosas             | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio Campoamor          | Madrid               |
| Jardinerías Matías SL          | Lucio Campoamor          | Madrid               |
| Agrojardin                     | Julian Bellinelli        | Sydney               |
| Top Campo                      | Felipe Rosas             | Talavera de la Reina |
| Jardineria Sara                | Felipe Rosas             | Talavera de la Reina |
| Campohermoso                   | Julian Bellinelli        | Sydney               |
| france telecom                 | Lionel Narvaez           | Paris                |
| Musée du Louvre                | Lionel Narvaez           | Paris                |
| Tutifruti S.A                  | Mariko Kishi             | Sydney               |
| El Jardin Viviente S.L         | Mariko Kishi             | Sydney               |

- Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
```sql
-- VER MÁS TARDE
```
- Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
```sql
-- VER MÁS TARDE
```
- Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
```sql
-- VER MÁS TARDE
```
- Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
```sql
select distinct c.nombre_cliente, g.gama from cliente as c, gama_producto as g, producto as pro, detalle_pedido as d, pedido as ped where c.codigo_cliente = ped.codigo_cliente and ped.codigo_pedido = d.codigo_pedido and d.codigo_producto = pro.codigo_producto and pro.gama = g.gama;
```

### Consultas multitabla (inner join)

- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente where codigo_cliente not in (select codigo_cliente from pago);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto |    telefono    |      fax       |     linea_direccion1     | linea_direccion2 |        ciudad        |   region    |      pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|----------------|----------------|--------------------------|------------------|----------------------|-------------|----------------|---------------|----------------------------|----------------|
| 6              | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado        | Madrid           | Madrid               | Madrid      | Spain          | 28930         | 11                         | 40000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001      | 916421756      | C/azores                 | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28943         | 11                         | 20000          |
| 12             | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 17             | Flowers, S.A                | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4        |                  | Montornes del valles | Barcelona   | Spain          | 24586         | 5                          | 3500           |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15        |                  | Madrid               | Madrid      | Spain          | 28011         | 30                         | 5050           |
| 20             | Americh Golf Management SL  | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 20000          |
| 21             | Aloha                       | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                |                  | Canarias             | Canarias    | Spain          | 35488         | 12                         | 50000          |
| 22             | El Prat                     | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo         |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 30000          |
| 24             | Vivero Humanes              | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54    |                  | Humanes              | Madrid      | Spain          | 28970         | 30                         | 7430           |
| 25             | Fuenla City                 | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52               |                  | Fuenlabrada          | Madrid      | Spain          | 28574         | 5                          | 4500           |
| 29             | Top Campo                   | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32               |                  | Humanes              | Madrid      | Spain          | 28574         | 5                          | 5500           |
| 31             | Campohermoso                | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 30                         | 3250           |
| 32             | france telecom              | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me |                  | Paris                |             | France         | 75010         | 16                         | 10000          |
| 33             | Musée du Louvre             | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre           |                  | Paris                |             | France         | 75058         | 16                         | 30000          |
| 36             | Flores S.L.                 | Antonio         | Romero            | 654352981      | 685249700      | Avenida España           |                  | Madrid               | Fuenlabrada | Spain          | 29643         | 18                         | 6000           |
| 37             | The Magic Garden            | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park            |                  | London               | London      | United Kingdom | 65930         | 18                         | 10000          |

- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```sql
select * from cliente where codigo_cliente not in (select codigo_cliente from pedido);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto |    telefono    |      fax       |     linea_direccion1     | linea_direccion2 |        ciudad        |  region   |      pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|----------------|----------------|--------------------------|------------------|----------------------|-----------|----------------|---------------|----------------------------|----------------|
| 6              | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 8                          | 154310         |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado        | Madrid           | Madrid               | Madrid    | Spain          | 28930         | 11                         | 40000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001      | 916421756      | C/azores                 | Fuenlabrada      | Madrid               | Madrid    | Spain          | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                | Fuenlabrada      | Madrid               | Madrid    | Spain          | 28943         | 11                         | 20000          |
| 12             | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 8                          | 154310         |
| 17             | Flowers, S.A                | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4        |                  | Montornes del valles | Barcelona | Spain          | 24586         | 5                          | 3500           |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15        |                  | Madrid               | Madrid    | Spain          | 28011         | 30                         | 5050           |
| 20             | Americh Golf Management SL  | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                |                  | Barcelona            | Cataluña  | Spain          | 12320         | 12                         | 20000          |
| 21             | Aloha                       | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                |                  | Canarias             | Canarias  | Spain          | 35488         | 12                         | 50000          |
| 22             | El Prat                     | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo         |                  | Barcelona            | Cataluña  | Spain          | 12320         | 12                         | 30000          |
| 24             | Vivero Humanes              | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54    |                  | Humanes              | Madrid    | Spain          | 28970         | 30                         | 7430           |
| 25             | Fuenla City                 | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52               |                  | Fuenlabrada          | Madrid    | Spain          | 28574         | 5                          | 4500           |
| 29             | Top Campo                   | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32               |                  | Humanes              | Madrid    | Spain          | 28574         | 5                          | 5500           |
| 31             | Campohermoso                | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                |                  | Fuenlabrada          | Madrid    | Spain          | 28945         | 30                         | 3250           |
| 32             | france telecom              | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me |                  | Paris                |           | France         | 75010         | 16                         | 10000          |
| 33             | Musée du Louvre             | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre           |                  | Paris                |           | France         | 75058         | 16                         | 30000          |
| 37             | The Magic Garden            | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park            |                  | London               | London    | United Kingdom | 65930         | 18                         | 10000          |

- Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```sql
-- HACER MÁS TARDE
```

- Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
```sql
select * from empleado where codigo_oficina is null;
```
> No se devuelve tabla pues no se cumplen los requisitos.

- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
```sql
select * from empleado where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
```
| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      |

- Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
```sql
select e.*, o.* from empleado as e join oficina as o on e.codigo_oficina = o.codigo_oficina where e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente); 
```
| codigo_empleado |   nombre    | apellido1  | apellido2 | extension |           email           | codigo_oficina | codigo_jefe |        puesto         | codigo_oficina |        ciudad        |    pais    |      region       | codigo_postal |    telefono     |       linea_direccion1       |  linea_direccion2   |
|-----------------|-------------|------------|-----------|-----------|---------------------------|----------------|-------------|-----------------------|----------------|----------------------|------------|-------------------|---------------|-----------------|------------------------------|---------------------|
| 1               | Marcos      | Magaña     | Perez     | 3897      | marcos@jardineria.es      | TAL-ES         |             | Director General      | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 2               | Ruben       | López      | Martinez  | 2899      | rlopez@jardineria.es      | TAL-ES         | 1           | Subdirector Marketing | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 3               | Alberto     | Soria      | Carrasco  | 2837      | asoria@jardineria.es      | TAL-ES         | 2           | Subdirector Ventas    | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 4               | Maria       | Solís      | Jerez     | 2847      | msolis@jardineria.es      | TAL-ES         | 2           | Secretaria            | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 6               | Juan Carlos | Ortiz      | Serrano   | 2845      | cortiz@jardineria.es      | TAL-ES         | 3           | Representante Ventas  | TAL-ES         | Talavera de la Reina | España     | Castilla-LaMancha | 45632         | +34 925 867231  | Francisco Aguirre, 32        | 5º piso (exterior)  |
| 7               | Carlos      | Soria      | Jimenez   | 2444      | csoria@jardineria.es      | MAD-ES         | 3           | Director Oficina      | MAD-ES         | Madrid               | España     | Madrid            | 28032         | +34 91 7514487  | Bulevar Indalecio Prieto, 32 |                     |
| 10              | Hilario     | Rodriguez  | Huertas   | 2444      | hrodriguez@jardineria.es  | MAD-ES         | 7           | Representante Ventas  | MAD-ES         | Madrid               | España     | Madrid            | 28032         | +34 91 7514487  | Bulevar Indalecio Prieto, 32 |                     |
| 13              | David       | Palma      | Aceituno  | 2519      | dpalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | BCN-ES         | Barcelona            | España     | Barcelona         | 08019         | +34 93 3561182  | Avenida Diagonal, 38         | 3A escalera Derecha |
| 14              | Oscar       | Palma      | Aceituno  | 2519      | opalma@jardineria.es      | BCN-ES         | 11          | Representante Ventas  | BCN-ES         | Barcelona            | España     | Barcelona         | 08019         | +34 93 3561182  | Avenida Diagonal, 38         | 3A escalera Derecha |
| 15              | Francois    | Fignon     |           | 9981      | ffignon@gardening.com     | PAR-FR         | 3           | Director Oficina      | PAR-FR         | Paris                | Francia    | EMEA              | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans     |                     |
| 17              | Laurent     | Serra      |           | 9982      | lserra@gardening.com      | PAR-FR         | 15          | Representante Ventas  | PAR-FR         | Paris                | Francia    | EMEA              | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans     |                     |
| 20              | Hilary      | Washington |           | 7565      | hwashington@gardening.com | BOS-USA        | 3           | Director Oficina      | BOS-USA        | Boston               | EEUU       | MA                | 02108         | +1 215 837 0825 | 1550 Court Place             | Suite 102           |
| 21              | Marcus      | Paxton     |           | 7565      | mpaxton@gardening.com     | BOS-USA        | 20          | Representante Ventas  | BOS-USA        | Boston               | EEUU       | MA                | 02108         | +1 215 837 0825 | 1550 Court Place             | Suite 102           |
| 23              | Nei         | Nishikori  |           | 8734      | nnishikori@gardening.com  | TOK-JP         | 3           | Director Oficina      | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 24              | Narumi      | Riko       |           | 8734      | nriko@gardening.com       | TOK-JP         | 23          | Representante Ventas  | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 25              | Takuma      | Nomura     |           | 8735      | tnomura@gardening.com     | TOK-JP         | 23          | Representante Ventas  | TOK-JP         | Tokyo                | Japón      | Chiyoda-Ku        | 102-8578      | +81 33 224 5000 | 4-1 Kioicho                  |                     |
| 26              | Amy         | Johnson    |           | 3321      | ajohnson@gardening.com    | LON-UK         | 3           | Director Oficina      | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 27              | Larry       | Westfalls  |           | 3322      | lwestfalls@gardening.com  | LON-UK         | 26          | Representante Ventas  | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 28              | John        | Walton     |           | 3322      | jwalton@gardening.com     | LON-UK         | 26          | Representante Ventas  | LON-UK         | Londres              | Inglaterra | EMEA              | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street          | Ground Floor        |
| 29              | Kevin       | Fallmer    |           | 3210      | kfalmer@gardening.com     | SYD-AU         | 3           | Director Oficina      | SYD-AU         | Sydney               | Australia  | APAC              | NSW 2010      | +61 2 9264 2451 | 5-11 Wentworth Avenue        | Floor #2            |

- Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
```sql
select * from empleado where codigo_oficina is null and codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
```
> No se devuelve tabla pues no se cumplen los requisitos de la búsqueda.

- Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select * from producto where codigo_producto not in (select codigo_producto from detalle_pedido);
```
| codigo_producto |                           nombre                            |     gama     | dimensiones |         proveedor         |                                                                                                                                                                                                                                                                                                                                                                 descripcion                                                                                                                                                                                                                                                                                                                                                                  | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|-------------------------------------------------------------|--------------|-------------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|--------------|------------------|
| FR-104          | Olea-Olivos                                                 | Frutales     | 12/4        | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | 50                | 49           | 39               |
| FR-14           | Calamondin Mini                                             | Frutales     |             | Frutales Talavera S.A     | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                      | 15                | 10           | 8                |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Frutales     |             | NaranjasValencianas.com   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 350               | 4            | 3                |
| FR-24           | Albaricoquero Corbato                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-25           | Albaricoquero Moniqui                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-26           | Albaricoquero Kurrot                                        | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 400               | 8            | 6                |
| FR-27           | Cerezo Burlat                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 400               | 8            | 6                |
| FR-28           | Cerezo Picota                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 400               | 8            | 6                |
| FR-30           | Ciruelo R. Claudia Verde                                    | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-32           | Ciruelo Golden Japan                                        | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-35           | Ciruelo Claudia Negra                                       | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 400               | 8            | 6                |
| FR-38           | Higuera Verdal                                              | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 400               | 9            | 7                |
| FR-39           | Higuera Breva                                               | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 400               | 9            | 7                |
| FR-44           | Melocotonero Spring Crest                                   | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 400               | 8            | 6                |
| FR-46           | Melocotonero Federica                                       | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 400               | 8            | 6                |
| FR-49           | Parra Uva de Mesa                                           | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 400               | 8            | 6                |
| FR-5            | Mandarino -Plantón joven                                    | Frutales     |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 6            | 4                |
| FR-50           | Peral Castell                                               | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-51           | Peral Williams                                              | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-52           | Peral Conference                                            | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     | 400               | 8            | 6                |
| FR-55           | Olivo Cipresino                                             | Frutales     |             | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     | 400               | 8            | 6                |
| FR-59           | Albaricoquero                                               | Frutales     | 10/12       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 22           | 17               |
| FR-61           | Albaricoquero                                               | Frutales     | 14/16       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 49           | 39               |
| FR-62           | Albaricoquero                                               | Frutales     | 16/18       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       | 200               | 70           | 56               |
| FR-63           | Cerezo                                                      | Frutales     | 8/10        | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 300               | 11           | 8                |
| FR-65           | Cerezo                                                      | Frutales     | 12/14       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 200               | 32           | 25               |
| FR-68           | Cerezo                                                      | Frutales     | 18/20       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 | 50                | 80           | 64               |
| FR-70           | Ciruelo                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 11           | 8                |
| FR-73           | Granado                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 13           | 10               |
| FR-74           | Granado                                                     | Frutales     | 10/12       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 22           | 17               |
| FR-76           | Granado                                                     | Frutales     | 14/16       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      | 50                | 49           | 39               |
| FR-83           | Higuera                                                     | Frutales     | 18/20       | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    | 50                | 80           | 64               |
| FR-88           | Manzano                                                     | Frutales     | 12/14       | Frutales Talavera S.A     | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                 | 50                | 32           | 25               |
| FR-92           | Melocotonero                                                | Frutales     | 8/10        | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 11           | 8                |
| FR-93           | Melocotonero                                                | Frutales     | 10/12       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 22           | 17               |
| FR-95           | Melocotonero                                                | Frutales     | 14/16       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             | 50                | 49           | 39               |
| FR-96           | Membrillero                                                 | Frutales     | 8/10        | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 11           | 8                |
| FR-97           | Membrillero                                                 | Frutales     | 10/12       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 22           | 17               |
| FR-98           | Membrillero                                                 | Frutales     | 12/14       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 32           | 25               |
| FR-99           | Membrillero                                                 | Frutales     | 14/16       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | 50                | 49           | 39               |
| OR-001          | Arbustos Mix Maceta                                         | Ornamentales | 40-60       | Valencia Garden Service   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 25                | 5            | 4                |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             | Ornamentales | 100-110     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 12           | 9                |
| OR-103          | Mimosa Semilla Bayleyana                                    | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 10           | 8                |
| OR-105          | Mimosa Semilla Espectabilis                                 | Ornamentales | 160-170     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 6            | 4                |
| OR-106          | Mimosa Semilla Longifolia                                   | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 10           | 8                |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      | Ornamentales | 120-140     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... | 100               | 6            | 4                |
| OR-108          | Abelia Floribunda                                           | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-109          | Callistemom (Mix)                                           | Ornamentales | 35-45       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 100               | 5            | 4                |
| OR-110          | Callistemom (Mix)                                           | Ornamentales | 40-60       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 100               | 2            | 1                |
| OR-111          | Corylus Avellana \"Contorta\"                               | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-112          | Escallonia (Mix)                                            | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                                     | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                                         | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | 120               | 7            | 5                |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa                       | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    | 120               | 7            | 5                |
| OR-121          | Lonicera Nitida \"Maigrum\"                                 | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                                             | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                                   | Ornamentales | 35-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 120               | 5            | 4                |
| OR-131          | Leptospermum formado PIRAMIDE                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-132          | Leptospermum COPA                                           | Ornamentales | 110/120     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-133          | Nerium oleander-CALIDAD \"GARDEN\"                          | Ornamentales | 40-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 2            | 1                |
| OR-134          | Nerium Oleander Arbusto GRANDE                              | Ornamentales | 160-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 38           | 30               |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           | Ornamentales | 50-60       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 5            | 4                |
| OR-137          | ROSAL TREPADOR                                              | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-142          | Solanum Jazminoide                                          | Ornamentales | 150-160     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 2            | 1                |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 9            | 7                |
| OR-144          | Wisteria Sinensis INJERTADAS DECÃ“                          | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 12           | 9                |
| OR-145          | Bougamvillea Sanderiana Tutor                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 2            | 1                |
| OR-148          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 45-50       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 7            | 5                |
| OR-149          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 17           | 13               |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    | Ornamentales |             | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-153          | Expositor Árboles clima mediterráneo                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-154          | Expositor Árboles borde del mar                             | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-158          | Brachychiton Acerifolius                                    | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-161          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 6            | 4                |
| OR-162          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 10           | 8                |
| OR-163          | Chitalpa Summer Bells                                       | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-164          | Erytrina Kafra                                              | Ornamentales | 170-180     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-166          | Eucalyptus Citriodora                                       | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-167          | Eucalyptus Ficifolia                                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 12           | 9                |
| OR-170          | Lagunaria Patersonii                                        | Ornamentales | 140-150     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-171          | Lagunaria Patersonii                                        | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-173          | Morus Alba                                                  | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-175          | Platanus Acerifolia                                         | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-178          | Salix Babylonica  Pendula                                   | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-182          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-183          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-184          | Tipuana Tipu                                                | Ornamentales | 170-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-185          | Pleioblastus distichus-Bambú enano                          | Ornamentales | 15-20       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-187          | Sasa palmata                                                | Ornamentales | 40-45       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 10           | 8                |
| OR-189          | Phylostachys aurea                                          | Ornamentales | 180-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 22           | 17               |
| OR-190          | Phylostachys aurea                                          | Ornamentales | 250-300     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 32           | 25               |
| OR-191          | Phylostachys Bambusa Spectabilis                            | Ornamentales | 180-200     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 24           | 19               |
| OR-192          | Phylostachys biseti                                         | Ornamentales | 160-170     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 22           | 17               |
| OR-194          | Pseudosasa japonica (Metake)                                | Ornamentales | 225-250     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 20           | 16               |
| OR-195          | Pseudosasa japonica (Metake)                                | Ornamentales | 30-40       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 6            | 4                |
| OR-197          | Cedrus Deodara \"Feeling Blue\" Novedad                     | Ornamentales | rastrero    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 12           | 9                |
| OR-198          | Juniperus chinensis \"Blue Alps\"                           | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-199          | Juniperus Chinensis Stricta                                 | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-201          | Juniperus squamata \"Blue Star\"                            | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-202          | Juniperus x media Phitzeriana verde                         | Ornamentales | 20-30       | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 80                | 4            | 3                |
| OR-212          | Bismarckia Nobilis                                          | Ornamentales | 200 - 220   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 4                 | 217          | 173              |
| OR-215          | Brahea Armata                                               | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 112          | 89               |
| OR-216          | Brahea Edulis                                               | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 19           | 15               |
| OR-219          | Butia Capitata                                              | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 29           | 23               |
| OR-220          | Butia Capitata                                              | Ornamentales | 90 - 120    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 36           | 28               |
| OR-221          | Butia Capitata                                              | Ornamentales | 85 - 105    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 59           | 47               |
| OR-223          | Chamaerops Humilis                                          | Ornamentales | 40 - 45     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 4            | 3                |
| OR-224          | Chamaerops Humilis                                          | Ornamentales | 50 - 60     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 7            | 5                |
| OR-228          | Chamaerops Humilis \"Cerifera\"                             | Ornamentales | 70 - 80     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 32           | 25               |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           | Ornamentales | 130 - 150   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 22           | 17               |
| OR-230          | Cordyline Australis -DRACAENA                               | Ornamentales | 190 - 210   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 38           | 30               |
| OR-231          | Cycas Revoluta                                              | Ornamentales | 55 - 65     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 15           | 12               |
| OR-232          | Cycas Revoluta                                              | Ornamentales | 80 - 90     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 100               | 34           | 27               |
| OR-233          | Dracaena Drago                                              | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 1                 | 13           | 10               |
| OR-235          | Dracaena Drago                                              | Ornamentales | 150 - 175   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 2                 | 92           | 73               |
| OR-238          | Livistonia Decipiens                                        | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 19           | 15               |
| OR-239          | Livistonia Decipiens                                        | Ornamentales | 180 - 200   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 49           | 39               |
| OR-242          | Rhaphis Excelsa                                             | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 21           | 16               |
| OR-244          | Sabal Minor                                                 | Ornamentales | 60 - 75     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 11           | 8                |
| OR-245          | Sabal Minor                                                 | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 34           | 27               |
| OR-246          | Trachycarpus Fortunei                                       | Ornamentales | 90 - 105    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 50                | 18           | 14               |
| OR-248          | Washingtonia Robusta                                        | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 3            | 2                |
| OR-251          | Zamia Furfuracaea                                           | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | 15                | 168          | 134              |

- Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
```sql
select nombre, descripcion from producto where codigo_producto not in (select codigo_producto from detalle_pedido);
```
|                           nombre                            |                                                                                                                                                                                                                                                                                                                                                                 descripcion                                                                                                                                                                                                                                                                                                                                                                  |
|-------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Olea-Olivos                                                 | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     |
| Calamondin Mini                                             | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada; corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                                                                                                      |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Albaricoquero Corbato                                       | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Albaricoquero Moniqui                                       | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Albaricoquero Kurrot                                        | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Cerezo Burlat                                               | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 |
| Cerezo Picota                                               | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 |
| Ciruelo R. Claudia Verde                                    | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Ciruelo Golden Japan                                        | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Ciruelo Claudia Negra                                       | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Higuera Verdal                                              | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    |
| Higuera Breva                                               | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    |
| Melocotonero Spring Crest                                   | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             |
| Melocotonero Federica                                       | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             |
| Parra Uva de Mesa                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Mandarino -Plantón joven                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Peral Castell                                               | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     |
| Peral Williams                                              | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     |
| Peral Conference                                            | Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.                                                                                                                                                                                                                                                                                                                                                     |
| Olivo Cipresino                                             | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.                                                                                     |
| Albaricoquero                                               | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Albaricoquero                                               | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Albaricoquero                                               | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada; las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                                                                                                       |
| Cerezo                                                      | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 |
| Cerezo                                                      | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 |
| Cerezo                                                      | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado                                                                                 |
| Ciruelo                                                     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Granado                                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      |
| Granado                                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      |
| Granado                                                     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 a 6 m de altura, con el tronco retorcido. Madera dura y corteza escamosa de color grisáceo. Las ramitas jóvenes son más o menos cuadrangulares o angostas y de cuatro alas, posteriormente se vuelven redondas con corteza de color café grisáceo, la mayoría de las ramas, pero especialmente las pequeñas ramitas axilares, son en forma de espina o terminan en una espina aguda; la copa es extendida.                                                                                                                                                                                                                                                                      |
| Higuera                                                     | La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.                                                                                                                                                    |
| Manzano                                                     | alcanza como máximo 10 m. de altura y tiene una copa globosa. Tronco derecho que normalmente alcanza de 2 a 2,5 m. de altura, con corteza cubierta de lenticelas, lisa, adherida, de color ceniciento verdoso sobre los ramos y escamosa y gris parda sobre las partes viejas del árbol. Tiene una vida de unos 60-80 años. Las ramas se insertan en ángulo abierto sobre el tallo, de color verde oscuro, a veces tendiendo a negruzco o violáceo. Los brotes jóvenes terminan con frecuencia en una espina                                                                                                                                                                                                                                 |
| Melocotonero                                                | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             |
| Melocotonero                                                | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             |
| Melocotonero                                                | Árbol caducifolio de porte bajo con corteza lisa, de color ceniciento. Sus hojas son alargadas con el margen ligeramente aserrado, de color verde brillante, algo más claras por el envés. El melocotonero está muy arraigado en la cultura asiática.\r\nEn Japón, el noble heroe Momotaro, una especie de Cid japonés, nació del interior de un enorme melocotón que flotaba río abajo.\r\nEn China se piensa que comer melocotón confiere longevidad al ser humano, ya que formaba parte de la dieta de sus dioses inmortales.                                                                                                                                                                                                             |
| Membrillero                                                 | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Membrillero                                                 | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Membrillero                                                 | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Membrillero                                                 | arbolito caducifolio de 4-6 m de altura con el tronco tortuoso y la corteza lisa, grisácea, que se desprende en escamas con la edad. Copa irregular, con ramas inermes, flexuosas, parduzcas, punteadas. Ramillas jóvenes tomentosas                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Arbustos Mix Maceta                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Mimosa Injerto CLASICA Dealbata                             | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... |
| Mimosa Semilla Bayleyana                                    | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... |
| Mimosa Semilla Espectabilis                                 | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... |
| Mimosa Semilla Longifolia                                   | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... |
| Mimosa Semilla Floribunda 4 estaciones                      | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje persistente muy usado en parques por su atractiva floración amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento rápido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constreñidos entre las semillas, que se disponen en el fruto longitudinalmente... |
| Abelia Floribunda                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Callistemom (Mix)                                           | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Callistemom (Mix)                                           | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y colgantes (de ahí lo de \"llorón\")..                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| Corylus Avellana \"Contorta\"                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Escallonia (Mix)                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Evonimus Emerald Gayeti                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Evonimus Pulchellus                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    |
| Hibiscus Syriacus \"Pink Giant\" Rosa                       | Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo.                                                                                                                                                                                                                                                                                                                                                                    |
| Lonicera Nitida \"Maigrum\"                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Prunus pisardii                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Weigelia \"Bristol Ruby\"                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Leptospermum formado PIRAMIDE                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Leptospermum COPA                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Nerium oleander-CALIDAD \"GARDEN\"                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Nerium Oleander Arbusto GRANDE                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Nerium oleander COPA  Calibre 6/8                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ROSAL TREPADOR                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Solanum Jazminoide                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Wisteria Sinensis  azul, rosa, blanca                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Wisteria Sinensis INJERTADAS DECÃ“                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bougamvillea Sanderiana Tutor                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bougamvillea Sanderiana Espaldera                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bougamvillea Sanderiana Espaldera                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bougamvillea Sanderiana, 3 tut. piramide                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Expositor Árboles clima mediterráneo                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Expositor Árboles borde del mar                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Brachychiton Acerifolius                                    |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cassia Corimbosa                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cassia Corimbosa                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Chitalpa Summer Bells                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Erytrina Kafra                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Eucalyptus Citriodora                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Eucalyptus Ficifolia                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Lagunaria Patersonii                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Lagunaria Patersonii                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Morus Alba                                                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Platanus Acerifolia                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Salix Babylonica  Pendula                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Tamarix  Ramosissima Pink Cascade                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Tecoma Stands                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Tecoma Stands                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Tipuana Tipu                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Pleioblastus distichus-Bambú enano                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Sasa palmata                                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Phylostachys aurea                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Phylostachys aurea                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Phylostachys Bambusa Spectabilis                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Phylostachys biseti                                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Pseudosasa japonica (Metake)                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Pseudosasa japonica (Metake)                                |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cedrus Deodara \"Feeling Blue\" Novedad                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Juniperus chinensis \"Blue Alps\"                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Juniperus Chinensis Stricta                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Juniperus squamata \"Blue Star\"                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Juniperus x media Phitzeriana verde                         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Bismarckia Nobilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Brahea Armata                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Brahea Edulis                                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Butia Capitata                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Butia Capitata                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Butia Capitata                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Chamaerops Humilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Chamaerops Humilis                                          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Chamaerops Humilis \"Cerifera\"                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Chrysalidocarpus Lutescens -ARECA                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cordyline Australis -DRACAENA                               |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cycas Revoluta                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Cycas Revoluta                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Dracaena Drago                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Dracaena Drago                                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Livistonia Decipiens                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Livistonia Decipiens                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Rhaphis Excelsa                                             |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Sabal Minor                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Sabal Minor                                                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Trachycarpus Fortunei                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Washingtonia Robusta                                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| Zamia Furfuracaea                                           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

- Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
select * from oficina where codigo_oficina not in (select e.codigo_oficina from empleado as e join cliente as c on e.codigo_empleado = c.codigo_empleado_rep_ventas join pedido as ped on c.codigo_cliente = ped.codigo_cliente join detalle_pedido as d on d.codigo_pedido = ped.codigo_pedido join producto as pro on d.codigo_producto = pro.codigo_producto where pro.gama = 'Frutales');
```
| codigo_oficina | ciudad  |    pais    |   region   | codigo_postal |    telefono     |     linea_direccion1     | linea_direccion2 |
|----------------|---------|------------|------------|---------------|-----------------|--------------------------|------------------|
| LON-UK         | Londres | Inglaterra | EMEA       | EC2N 1HN      | +44 20 78772041 | 52 Old Broad Street      | Ground Floor     |
| PAR-FR         | Paris   | Francia    | EMEA       | 75017         | +33 14 723 4404 | 29 Rue Jouffroy d'abbans |                  |
| TOK-JP         | Tokyo   | Japón      | Chiyoda-Ku | 102-8578      | +81 33 224 5000 | 4-1 Kioicho              |                  |

- Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
select distinct c.* from cliente as c join pedido as ped on c.codigo_cliente = ped.codigo_cliente where c.codigo_cliente not in (select codigo_cliente from pago);
```
| codigo_cliente | nombre_cliente | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1 | linea_direccion2 | ciudad |   region    | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|----------------|-----------------|-------------------|-----------|-----------|------------------|------------------|--------|-------------|-------|---------------|----------------------------|----------------|
| 36             | Flores S.L.    | Antonio         | Romero            | 654352981 | 685249700 | Avenida España   |                  | Madrid | Fuenlabrada | Spain | 29643         | 18                         | 6000           |

- Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
```sql
-- NO SÉ REALIZAR
```

### Consultas resumen (count,avg,...)

- ¿Cuántos empleados hay en la compañía?
```sql
select count(*) as empleados from empleado;
```
| empleados |
|-----------|
| 31        |

- ¿Cuántos clientes tiene cada país?
```sql
select count(*) as clientes, pais from cliente group by pais;
```
| clientes |      pais      |
|----------|----------------|
| 2        | Australia      |
| 2        | France         |
| 27       | Spain          |
| 4        | USA            |
| 1        | United Kingdom |

- ¿Cuál fue el pago medio en 2009?
```sql
select round(avg(total), 2) as pago_medio from pago where fecha_pago regexp '2009';
```
| pago_medio |
|------------|
| 4504.08    |

- ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql
select count(*) as pedidos, estado from pedido group by estado order by pedidos desc;
```
| pedidos |  estado   |
|---------|-----------|
| 61      | Entregado |
| 30      | Pendiente |
| 24      | Rechazado |

- Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql
--HACER DESPUÉS
```

- Calcula el número de clientes que tiene la empresa.
```sql
select count(*) as clientes from cliente;
```
| clientes |
|----------|
| 36       |

- ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
```sql
select count(*) as clientes from cliente where ciudad = 'Madrid';
```
| clientes |
|----------|
| 11       |

- ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
select count(*) as clientes from cliente where ciudad regexp '^M';
```
| clientes |
|----------|
| 14       |

- Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
select e.nombre as representante_venta, count(c.codigo_cliente) as clientes from cliente as c join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado group by representante_venta; 
```
| representante_venta | clientes |
|---------------------|----------|
| Emmanuel            | 5        |
| Felipe              | 5        |
| José Manuel         | 5        |
| Julian              | 5        |
| Lionel              | 2        |
| Lorena              | 2        |
| Lucio               | 2        |
| Mariano             | 4        |
| Mariko              | 2        |
| Michael             | 2        |
| Walter Santiago     | 2        |

- Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
select count(codigo_cliente) as clientes from cliente where codigo_cliente not in (select codigo_cliente from cliente as c join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado where e.puesto = 'Representante Ventas');
```
| clientes |
|----------|
| 7        |

- Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
select c.nombre_contacto, c.apellido_contacto, min(p.fecha_pago) as pago_minimo, max(p.fecha_pago) as pago_maximo from cliente as c join pago as p on c.codigo_cliente = p.codigo_cliente group by c.codigo_cliente;
```
| nombre_contacto | apellido_contacto | pago_minimo | pago_maximo |
|-----------------|-------------------|-------------|-------------|
| Daniel G        | GoldFish          | 2008-11-10  | 2008-12-10  |
| Anne            | Wright            | 2009-01-16  | 2009-02-19  |
| Link            | Flaute            | 2007-01-08  | 2007-01-08  |
| Akane           | Tendo             | 2006-01-18  | 2006-01-18  |
| Jose            | Bermejo           | 2009-01-13  | 2009-01-13  |
| Guillermo       | Rengifo           | 2009-01-06  | 2009-01-06  |
| Pedro           | Camunas           | 2008-08-04  | 2008-08-04  |
| Juan            | Rodriguez         | 2008-07-15  | 2008-07-15  |
| Javier          | Villar            | 2009-01-15  | 2009-02-15  |
| Maria           | Rodriguez         | 2009-02-16  | 2009-02-16  |
| Luis            | Martinez          | 2009-03-06  | 2009-03-06  |
| Maria           | Santillana        | 2009-03-26  | 2009-03-26  |
| Eva María       | Sánchez           | 2008-03-18  | 2008-03-18  |
| Matías          | San Martín        | 2009-02-08  | 2009-02-08  |
| Benito          | Lopez             | 2009-01-13  | 2009-01-13  |
| Sara            | Marquez           | 2009-01-16  | 2009-01-16  |
| Jacob           | Jones             | 2007-10-06  | 2007-10-06  |
| Justin          | Smith             | 2006-05-26  | 2006-05-26  |

- Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
select codigo_pedido, count(codigo_producto) as productos_distintos from detalle_pedido group by codigo_pedido;
```
| codigo_pedido | productos_distintos |
|---------------|---------------------|
| 1             | 5                   |
| 2             | 7                   |
| 3             | 6                   |
| 4             | 8                   |
| 8             | 3                   |
| 9             | 4                   |
| 10            | 3                   |
| 11            | 2                   |
| 12            | 1                   |
| 13            | 3                   |
| 14            | 2                   |
| 15            | 4                   |
| 16            | 2                   |
| 17            | 5                   |
| 18            | 3                   |
| 19            | 5                   |
| 20            | 2                   |
| 21            | 3                   |
| 22            | 1                   |
| 23            | 4                   |
| 24            | 4                   |
| 25            | 3                   |
| 26            | 3                   |
| 27            | 3                   |
| 28            | 3                   |
| 29            | 5                   |
| 30            | 6                   |
| 31            | 3                   |
| 32            | 5                   |
| 33            | 4                   |
| 34            | 4                   |
| 35            | 5                   |
| 36            | 5                   |
| 37            | 3                   |
| 38            | 2                   |
| 39            | 2                   |
| 40            | 2                   |
| 41            | 2                   |
| 42            | 2                   |
| 43            | 1                   |
| 44            | 1                   |
| 45            | 2                   |
| 46            | 2                   |
| 47            | 2                   |
| 48            | 5                   |
| 49            | 3                   |
| 50            | 3                   |
| 51            | 3                   |
| 52            | 1                   |
| 53            | 4                   |
| 54            | 7                   |
| 55            | 5                   |
| 56            | 6                   |
| 57            | 4                   |
| 58            | 4                   |
| 59            | 1                   |
| 60            | 1                   |
| 61            | 1                   |
| 62            | 1                   |
| 63            | 1                   |
| 64            | 1                   |
| 65            | 1                   |
| 66            | 1                   |
| 67            | 1                   |
| 68            | 1                   |
| 74            | 3                   |
| 75            | 3                   |
| 76            | 5                   |
| 77            | 2                   |
| 78            | 4                   |
| 79            | 1                   |
| 80            | 3                   |
| 81            | 1                   |
| 82            | 1                   |
| 83            | 1                   |
| 89            | 6                   |
| 90            | 3                   |
| 91            | 3                   |
| 92            | 3                   |
| 93            | 3                   |
| 94            | 3                   |
| 95            | 3                   |
| 96            | 4                   |
| 97            | 3                   |
| 98            | 5                   |
| 99            | 2                   |
| 100           | 2                   |
| 101           | 2                   |
| 102           | 2                   |
| 103           | 2                   |
| 104           | 2                   |
| 105           | 2                   |
| 106           | 2                   |
| 107           | 2                   |
| 108           | 2                   |
| 109           | 7                   |
| 110           | 3                   |
| 111           | 1                   |
| 112           | 1                   |
| 113           | 1                   |
| 114           | 1                   |
| 115           | 1                   |
| 116           | 5                   |
| 117           | 4                   |
| 118           | 1                   |
| 119           | 1                   |
| 120           | 1                   |
| 121           | 1                   |
| 122           | 1                   |
| 123           | 1                   |
| 124           | 1                   |
| 125           | 1                   |
| 126           | 1                   |
| 127           | 1                   |
| 128           | 2                   |

- Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
select codigo_pedido, sum(cantidad * precio_unidad) as total from detalle_pedido group by codigo_pedido;
```
| codigo_pedido | total |
|---------------|-------|
| 1             | 1567  |
| 2             | 7113  |
| 3             | 10850 |
| 4             | 2624  |
| 8             | 1065  |
| 9             | 2535  |
| 10            | 2920  |
| 11            | 820   |
| 12            | 290   |
| 13            | 738   |
| 14            | 829   |
| 15            | 214   |
| 16            | 234   |
| 17            | 375   |
| 18            | 116   |
| 19            | 333   |
| 20            | 292   |
| 21            | 182   |
| 22            | 6     |
| 23            | 1640  |
| 24            | 287   |
| 25            | 1455  |
| 26            | 675   |
| 27            | 504   |
| 28            | 2052  |
| 29            | 1324  |
| 30            | 711   |
| 31            | 244   |
| 32            | 3089  |
| 33            | 73226 |
| 34            | 1532  |
| 35            | 1718  |
| 36            | 311   |
| 37            | 2284  |
| 38            | 98    |
| 39            | 108   |
| 40            | 12    |
| 41            | 10    |
| 42            | 4     |
| 43            | 9     |
| 44            | 5     |
| 45            | 10    |
| 46            | 84    |
| 47            | 164   |
| 48            | 6398  |
| 49            | 625   |
| 50            | 3506  |
| 51            | 7750  |
| 52            | 700   |
| 53            | 141   |
| 54            | 669   |
| 55            | 1569  |
| 56            | 377   |
| 57            | 773   |
| 58            | 4775  |
| 59            | 700   |
| 60            | 700   |
| 61            | 700   |
| 62            | 700   |
| 63            | 700   |
| 64            | 700   |
| 65            | 700   |
| 66            | 700   |
| 67            | 700   |
| 68            | 700   |
| 74            | 3562  |
| 75            | 1048  |
| 76            | 2223  |
| 77            | 588   |
| 78            | 4660  |
| 79            | 300   |
| 80            | 5773  |
| 81            | 120   |
| 82            | 2176  |
| 83            | 120   |
| 89            | 710   |
| 90            | 41    |
| 91            | 1384  |
| 92            | 2906  |
| 93            | 882   |
| 94            | 5759  |
| 95            | 605   |
| 96            | 660   |
| 97            | 322   |
| 98            | 1024  |
| 99            | 2070  |
| 100           | 800   |
| 101           | 209   |
| 102           | 660   |
| 103           | 304   |
| 104           | 1760  |
| 105           | 1506  |
| 106           | 1077  |
| 107           | 3216  |
| 108           | 660   |
| 109           | 553   |
| 110           | 149   |
| 111           | 700   |
| 112           | 700   |
| 113           | 700   |
| 114           | 700   |
| 115           | 700   |
| 116           | 264   |
| 117           | 154   |
| 118           | 700   |
| 119           | 700   |
| 120           | 700   |
| 121           | 700   |
| 122           | 700   |
| 123           | 700   |
| 124           | 700   |
| 125           | 700   |
| 126           | 700   |
| 127           | 700   |
| 128           | 51    |

- Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql
select p.nombre as nombre_producto, d.cantidad as unidades_vendidas from detalle_pedido as d join producto as p on d.codigo_producto = p.codigo_producto group by d.codigo_producto order by unidades_vendidas desc limit 20;
```
|                  nombre_producto                   | unidades_vendidas |
|----------------------------------------------------|-------------------|
| Thymus Citriodra (Tomillo limón)                   | 450               |
| Rosal bajo 1Âª -En maceta-inicio brotación         | 423               |
| Thymus Vulgaris                                    | 290               |
| Brahea Armata                                      | 212               |
| Kaki Rojo Brillante                                | 203               |
| Petrosilium Hortense (Peregil)                     | 180               |
| Robinia Pseudoacacia Casque Rouge                  | 150               |
| Nogal Común                                        | 120               |
| Cerezo Napoleón                                    | 120               |
| Lavándula Dentata                                  | 110               |
| Beucarnea Recurvata                                | 80                |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo | 80                |
| Ajedrea                                            | 80                |
| Chamaerops Humilis                                 | 72                |
| Beucarnea Recurvata                                | 70                |
| Chamaerops Humilis                                 | 67                |
| Naranjo 2 años injerto                             | 56                |
| Melocotonero Paraguayo                             | 55                |
| Albaricoquero                                      | 51                |
| Livistonia Australis                               | 50                |

- La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.
```sql
select sum(d.cantidad * d.precio_unidad) as base_imponible, sum(d.cantidad * d.precio_unidad) * 0.07 as IGIC, sum(d.cantidad * precio_unidad) + (sum(d.cantidad * d.precio_unidad) * 0.07) as total from detalle_pedido as d;
```
| base_imponible |   IGIC   |   total   |
|----------------|----------|-----------|
| 217738         | 15241.66 | 232979.66 |

- La misma información que en la pregunta anterior, pero agrupada por código de producto.
```sql
select d.codigo_producto, sum(d.cantidad * d.precio_unidad) as base_imponible, sum(d.cantidad * d.precio_unidad) * 0.07 as IGIC, sum(d.cantidad * precio_unidad) + (sum(d.cantidad * d.precio_unidad) * 0.07) as total from detalle_pedido as d group by d.codigo_producto;
```
| codigo_producto | base_imponible |  IGIC   |  total   |
|-----------------|----------------|---------|----------|
| 11679           | 630            | 44.1    | 674.1    |
| 21636           | 564            | 39.48   | 603.48   |
| 22225           | 996            | 69.72   | 1065.72  |
| 30310           | 2640           | 184.8   | 2824.8   |
| AR-001          | 135            | 9.45    | 144.45   |
| AR-002          | 128            | 8.96    | 136.96   |
| AR-003          | 17             | 1.19    | 18.19    |
| AR-004          | 30             | 2.1     | 32.1     |
| AR-005          | 21             | 1.47    | 22.47    |
| AR-006          | 291            | 20.37   | 311.37   |
| AR-007          | 9              | 0.63    | 9.63     |
| AR-008          | 455            | 31.85   | 486.85   |
| AR-009          | 986            | 69.02   | 1055.02  |
| AR-010          | 10             | 0.7     | 10.7     |
| FR-1            | 168            | 11.76   | 179.76   |
| FR-10           | 119            | 8.33    | 127.33   |
| FR-100          | 1209           | 84.63   | 1293.63  |
| FR-101          | 247            | 17.29   | 264.29   |
| FR-102          | 668            | 46.76   | 714.76   |
| FR-103          | 25             | 1.75    | 26.75    |
| FR-105          | 280            | 19.6    | 299.6    |
| FR-106          | 673            | 47.11   | 720.11   |
| FR-107          | 1100           | 77.0    | 1177.0   |
| FR-108          | 468            | 32.76   | 500.76   |
| FR-11           | 13092          | 916.44  | 14008.44 |
| FR-12           | 668            | 46.76   | 714.76   |
| FR-13           | 741            | 51.87   | 792.87   |
| FR-15           | 225            | 15.75   | 240.75   |
| FR-16           | 45             | 3.15    | 48.15    |
| FR-17           | 846            | 59.22   | 905.22   |
| FR-18           | 108            | 7.56    | 115.56   |
| FR-2            | 7              | 0.49    | 7.49     |
| FR-22           | 40             | 2.8     | 42.8     |
| FR-23           | 62             | 4.34    | 66.34    |
| FR-29           | 960            | 67.2    | 1027.2   |
| FR-3            | 497            | 34.79   | 531.79   |
| FR-31           | 96             | 6.72    | 102.72   |
| FR-33           | 216            | 15.12   | 231.12   |
| FR-34           | 336            | 23.52   | 359.52   |
| FR-36           | 621            | 43.47   | 664.47   |
| FR-37           | 45             | 3.15    | 48.15    |
| FR-4            | 2552           | 178.64  | 2730.64  |
| FR-40           | 434            | 30.38   | 464.38   |
| FR-41           | 96             | 6.72    | 102.72   |
| FR-42           | 96             | 6.72    | 102.72   |
| FR-43           | 48             | 3.36    | 51.36    |
| FR-45           | 112            | 7.84    | 119.84   |
| FR-47           | 440            | 30.8    | 470.8    |
| FR-48           | 1080           | 75.6    | 1155.6   |
| FR-53           | 744            | 52.08   | 796.08   |
| FR-54           | 351            | 24.57   | 375.57   |
| FR-56           | 128            | 8.96    | 136.96   |
| FR-57           | 1624           | 113.68  | 1737.68  |
| FR-58           | 561            | 39.27   | 600.27   |
| FR-6            | 112            | 7.84    | 119.84   |
| FR-60           | 352            | 24.64   | 376.64   |
| FR-64           | 110            | 7.7     | 117.7    |
| FR-66           | 245            | 17.15   | 262.15   |
| FR-67           | 19950          | 1396.5  | 21346.5  |
| FR-69           | 1911           | 133.77  | 2044.77  |
| FR-7            | 348            | 24.36   | 372.36   |
| FR-71           | 220            | 15.4    | 235.4    |
| FR-72           | 124            | 8.68    | 132.68   |
| FR-75           | 224            | 15.68   | 239.68   |
| FR-77           | 1035           | 72.45   | 1107.45  |
| FR-78           | 30             | 2.1     | 32.1     |
| FR-79           | 946            | 66.22   | 1012.22  |
| FR-8            | 108            | 7.56    | 115.56   |
| FR-80           | 32             | 2.24    | 34.24    |
| FR-81           | 147            | 10.29   | 157.29   |
| FR-82           | 980            | 68.6    | 1048.6   |
| FR-84           | 143            | 10.01   | 153.01   |
| FR-85           | 5320           | 372.4   | 5692.4   |
| FR-86           | 22             | 1.54    | 23.54    |
| FR-87           | 1584           | 110.88  | 1694.88  |
| FR-89           | 450            | 31.5    | 481.5    |
| FR-9            | 232            | 16.24   | 248.24   |
| FR-90           | 280            | 19.6    | 299.6    |
| FR-91           | 2250           | 157.5   | 2407.5   |
| FR-94           | 1649           | 115.43  | 1764.43  |
| OR-101          | 144            | 10.08   | 154.08   |
| OR-102          | 1302           | 91.14   | 1393.14  |
| OR-104          | 200            | 14.0    | 214.0    |
| OR-115          | 63             | 4.41    | 67.41    |
| OR-116          | 98             | 6.86    | 104.86   |
| OR-119          | 50             | 3.5     | 53.5     |
| OR-120          | 25             | 1.75    | 26.75    |
| OR-122          | 160            | 11.2    | 171.2    |
| OR-123          | 70             | 4.9     | 74.9     |
| OR-125          | 15             | 1.05    | 16.05    |
| OR-127          | 160            | 11.2    | 171.2    |
| OR-128          | 2900           | 203.0   | 3103.0   |
| OR-129          | 337            | 23.59   | 360.59   |
| OR-130          | 216            | 15.12   | 231.12   |
| OR-136          | 2286           | 160.02  | 2446.02  |
| OR-139          | 320            | 22.4    | 342.4    |
| OR-140          | 200            | 14.0    | 214.0    |
| OR-141          | 200            | 14.0    | 214.0    |
| OR-146          | 68             | 4.76    | 72.76    |
| OR-147          | 42             | 2.94    | 44.94    |
| OR-150          | 36             | 2.52    | 38.52    |
| OR-152          | 18             | 1.26    | 19.26    |
| OR-155          | 24             | 1.68    | 25.68    |
| OR-156          | 313            | 21.91   | 334.91   |
| OR-157          | 2620           | 183.4   | 2803.4   |
| OR-159          | 132            | 9.24    | 141.24   |
| OR-160          | 90             | 6.3     | 96.3     |
| OR-165          | 30             | 2.1     | 32.1     |
| OR-168          | 20             | 1.4     | 21.4     |
| OR-172          | 1395           | 97.65   | 1492.65  |
| OR-174          | 432            | 30.24   | 462.24   |
| OR-176          | 380            | 26.6    | 406.6    |
| OR-177          | 2250           | 157.5   | 2407.5   |
| OR-179          | 30             | 2.1     | 32.1     |
| OR-181          | 360            | 25.2    | 385.2    |
| OR-186          | 240            | 16.8    | 256.8    |
| OR-188          | 100            | 7.0     | 107.0    |
| OR-193          | 100            | 7.0     | 107.0    |
| OR-196          | 280            | 19.6    | 299.6    |
| OR-200          | 40             | 2.8     | 42.8     |
| OR-203          | 102            | 7.14    | 109.14   |
| OR-204          | 500            | 35.0    | 535.0    |
| OR-205          | 100            | 7.0     | 107.0    |
| OR-206          | 25             | 1.75    | 26.75    |
| OR-207          | 16             | 1.12    | 17.12    |
| OR-208          | 884            | 61.88   | 945.88   |
| OR-209          | 500            | 35.0    | 535.0    |
| OR-210          | 3120           | 218.4   | 3338.4   |
| OR-211          | 4130           | 289.1   | 4419.1   |
| OR-213          | 9310           | 651.7   | 9961.7   |
| OR-214          | 2120           | 148.4   | 2268.4   |
| OR-217          | 975            | 68.25   | 1043.25  |
| OR-218          | 950            | 66.5    | 1016.5   |
| OR-222          | 1239           | 86.73   | 1325.73  |
| OR-225          | 840            | 58.8    | 898.8    |
| OR-226          | 570            | 39.9    | 609.9    |
| OR-227          | 15104          | 1057.28 | 16161.28 |
| OR-234          | 3520           | 246.4   | 3766.4   |
| OR-236          | 2205           | 154.35  | 2359.35  |
| OR-237          | 950            | 66.5    | 1016.5   |
| OR-240          | 468            | 32.76   | 500.76   |
| OR-241          | 485            | 33.95   | 518.95   |
| OR-243          | 128            | 8.96    | 136.96   |
| OR-247          | 73510          | 5145.7  | 78655.7  |
| OR-249          | 150            | 10.5    | 160.5    |
| OR-250          | 30             | 2.1     | 32.1     |
| OR-99           | 517            | 36.19   | 553.19   |

- La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
```sql
select d.codigo_producto, sum(d.cantidad * d.precio_unidad) as base_imponible, sum(d.cantidad * d.precio_unidad) * 0.07 as IGIC, sum(d.cantidad * precio_unidad) + (sum(d.cantidad * d.precio_unidad) * 0.07) as total from detalle_pedido as d where codigo_producto regexp '^OR' group by d.codigo_producto;
```
| codigo_producto | base_imponible |  IGIC   |  total   |
|-----------------|----------------|---------|----------|
| OR-101          | 144            | 10.08   | 154.08   |
| OR-102          | 1302           | 91.14   | 1393.14  |
| OR-104          | 200            | 14.0    | 214.0    |
| OR-115          | 63             | 4.41    | 67.41    |
| OR-116          | 98             | 6.86    | 104.86   |
| OR-119          | 50             | 3.5     | 53.5     |
| OR-120          | 25             | 1.75    | 26.75    |
| OR-122          | 160            | 11.2    | 171.2    |
| OR-123          | 70             | 4.9     | 74.9     |
| OR-125          | 15             | 1.05    | 16.05    |
| OR-127          | 160            | 11.2    | 171.2    |
| OR-128          | 2900           | 203.0   | 3103.0   |
| OR-129          | 337            | 23.59   | 360.59   |
| OR-130          | 216            | 15.12   | 231.12   |
| OR-136          | 2286           | 160.02  | 2446.02  |
| OR-139          | 320            | 22.4    | 342.4    |
| OR-140          | 200            | 14.0    | 214.0    |
| OR-141          | 200            | 14.0    | 214.0    |
| OR-146          | 68             | 4.76    | 72.76    |
| OR-147          | 42             | 2.94    | 44.94    |
| OR-150          | 36             | 2.52    | 38.52    |
| OR-152          | 18             | 1.26    | 19.26    |
| OR-155          | 24             | 1.68    | 25.68    |
| OR-156          | 313            | 21.91   | 334.91   |
| OR-157          | 2620           | 183.4   | 2803.4   |
| OR-159          | 132            | 9.24    | 141.24   |
| OR-160          | 90             | 6.3     | 96.3     |
| OR-165          | 30             | 2.1     | 32.1     |
| OR-168          | 20             | 1.4     | 21.4     |
| OR-172          | 1395           | 97.65   | 1492.65  |
| OR-174          | 432            | 30.24   | 462.24   |
| OR-176          | 380            | 26.6    | 406.6    |
| OR-177          | 2250           | 157.5   | 2407.5   |
| OR-179          | 30             | 2.1     | 32.1     |
| OR-181          | 360            | 25.2    | 385.2    |
| OR-186          | 240            | 16.8    | 256.8    |
| OR-188          | 100            | 7.0     | 107.0    |
| OR-193          | 100            | 7.0     | 107.0    |
| OR-196          | 280            | 19.6    | 299.6    |
| OR-200          | 40             | 2.8     | 42.8     |
| OR-203          | 102            | 7.14    | 109.14   |
| OR-204          | 500            | 35.0    | 535.0    |
| OR-205          | 100            | 7.0     | 107.0    |
| OR-206          | 25             | 1.75    | 26.75    |
| OR-207          | 16             | 1.12    | 17.12    |
| OR-208          | 884            | 61.88   | 945.88   |
| OR-209          | 500            | 35.0    | 535.0    |
| OR-210          | 3120           | 218.4   | 3338.4   |
| OR-211          | 4130           | 289.1   | 4419.1   |
| OR-213          | 9310           | 651.7   | 9961.7   |
| OR-214          | 2120           | 148.4   | 2268.4   |
| OR-217          | 975            | 68.25   | 1043.25  |
| OR-218          | 950            | 66.5    | 1016.5   |
| OR-222          | 1239           | 86.73   | 1325.73  |
| OR-225          | 840            | 58.8    | 898.8    |
| OR-226          | 570            | 39.9    | 609.9    |
| OR-227          | 15104          | 1057.28 | 16161.28 |
| OR-234          | 3520           | 246.4   | 3766.4   |
| OR-236          | 2205           | 154.35  | 2359.35  |
| OR-237          | 950            | 66.5    | 1016.5   |
| OR-240          | 468            | 32.76   | 500.76   |
| OR-241          | 485            | 33.95   | 518.95   |
| OR-243          | 128            | 8.96    | 136.96   |
| OR-247          | 73510          | 5145.7  | 78655.7  |
| OR-249          | 150            | 10.5    | 160.5    |
| OR-250          | 30             | 2.1     | 32.1     |
| OR-99           | 517            | 36.19   | 553.19   |

- Lista las ventas totales de los productos que hayan facturado más de __3000 euros__. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
```sql
select p.nombre, d.cantidad, d.cantidad * d.precio_unidad as total, (d.cantidad * d.precio_unidad) * 0.07 as total_con_igic from producto as p join detalle_pedido as d on p.codigo_producto = d.codigo_producto where total > 3000 group by d.codigo_producto;
```
|        nombre         | cantidad | total | total_con_igic |
|-----------------------|----------|-------|----------------|
| Limonero 30/40        | 40       | 4000  | 280.0          |
| Kaki                  | 56       | 3920  | 274.4          |
| Beucarnea Recurvata   | 80       | 3120  | 218.4          |
| Beucarnea Recurvata   | 70       | 4130  | 289.1          |
| Bismarckia Nobilis    | 30       | 7980  | 558.6          |
| Chamaerops Humilis    | 67       | 4288  | 300.16         |
| Dracaena Drago        | 50       | 3200  | 224.0          |
| Trachycarpus Fortunei | 150      | 69300 | 4851.0         |

- Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
```sql
select substr(fecha_pago, 1, 4) as año, sum(total) as total_año from pago group by año;
```
| año  | total_año |
|------|-----------|
| 2006 | 24965     |
| 2007 | 85170     |
| 2008 | 29252     |
| 2009 | 58553     |

### Subconsultas en SQL

- Devuelve el nombre del cliente con mayor límite de crédito.
```sql
select nombre_cliente from cliente where limite_credito in (select max(limite_credito) from cliente);
```
| nombre_cliente |
|----------------|
| Tendo Garden   |

- Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql
select nombre as nombre_producto from producto where precio_venta in (select max(precio_venta) from producto);
```
|    nombre_producto    |
|-----------------------|
| Trachycarpus Fortunei |

- Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
```sql
select p.nombre as nombre_producto from producto as p join detalle_pedido as d on p.codigo_producto = d.codigo_producto where d.cantidad in (select max(cantidad) from detalle_pedido);
```
|         nombre_producto          |
|----------------------------------|
| Thymus Citriodra (Tomillo limón) |

- Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
```sql
select c.nombre_cliente from cliente as c, pago as p where c.codigo_cliente = p.codigo_cliente and c.limite_credito > (select sum(total) from pago) group by p.codigo_cliente;
```
| nombre_cliente |
|----------------|
| Tendo Garden   |
| Dardena S.A.   |

- Devuelve el producto que más unidades tiene en stock.
```sql
select nombre as nombre_producto from producto where cantidad_en_stock in (select max(cantidad_en_stock) from producto);
```
|         nombre_producto         |
|---------------------------------|
| Rosal copa                      |
| Albaricoquero Corbato           |
| Albaricoquero Moniqui           |
| Albaricoquero Kurrot            |
| Cerezo Burlat                   |
| Cerezo Picota                   |
| Cerezo Napoleón                 |
| Ciruelo R. Claudia Verde        |
| Ciruelo Santa Rosa              |
| Ciruelo Golden Japan            |
| Ciruelo Friar                   |
| Ciruelo Reina C. De Ollins      |
| Ciruelo Claudia Negra           |
| Granado Mollar de Elche         |
| Higuera Napolitana              |
| Higuera Verdal                  |
| Higuera Breva                   |
| Manzano Starking Delicious      |
| Manzano Reineta                 |
| Manzano Golden Delicious        |
| Membrillero Gigante de Wranja   |
| Melocotonero Spring Crest       |
| Melocotonero Amarillo de Agosto |
| Melocotonero Federica           |
| Melocotonero Paraguayo          |
| Nogal Común                     |
| Parra Uva de Mesa               |
| Peral Castell                   |
| Peral Williams                  |
| Peral Conference                |
| Peral Blanq. de Aranjuez        |
| Níspero Tanaca                  |
| Olivo Cipresino                 |
| Nectarina                       |
| Kaki Rojo Brillante             |

- Devuelve el producto que menos unidades tiene en stock.
```sql
select nombre as nombre_producto from producto where cantidad_en_stock in (select min(cantidad_en_stock) from producto);
```
| nombre_producto |
|-----------------|
| Brahea Armata   |

- Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
```sql
select nombre, apellido1 || ' ' || apellido2 as apellidos, email from empleado where codigo_jefe in (select codigo_empleado from empleado where nombre = 'Alberto' and apellido1 = 'Soria')
```
|   nombre    |   apellidos   |           email           |
|-------------|---------------|---------------------------|
| Felipe      | Rosas Marquez | frosas@jardineria.es      |
| Juan Carlos | Ortiz Serrano | cortiz@jardineria.es      |
| Carlos      | Soria Jimenez | csoria@jardineria.es      |
| Emmanuel    | Magaña Perez  | manu@jardineria.es        |
| Francois    | Fignon        | ffignon@gardening.com     |
| Michael     | Bolton        | mbolton@gardening.com     |
| Hilary      | Washington    | hwashington@gardening.com |
| Nei         | Nishikori     | nnishikori@gardening.com  |
| Amy         | Johnson       | ajohnson@gardening.com    |
| Kevin       | Fallmer       | kfalmer@gardening.com     |

- Devuelve el nombre del cliente con mayor límite de crédito.
```sql
select nombre_cliente from cliente where limite_credito in (select max(limite_credito) from cliente);
```
| nombre_cliente |
|----------------|
| Tendo Garden   |

- Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql
select nombre as nombre_producto from producto where precio_venta in (select max(precio_venta) from producto);
```
|    nombre_producto    |
|-----------------------|
| Trachycarpus Fortunei |

- Devuelve el producto que menos unidades tiene en stock.
```sql
select nombre as nombre_producto from producto where cantidad_en_stock in (select min(cantidad_en_stock) from producto);
```
| nombre_producto |
|-----------------|
| Brahea Armata   |

- Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
```sql
select nombre, apellido1, puesto from empleado where codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
```
|   nombre    | apellido1  |        puesto         |
|-------------|------------|-----------------------|
| Marcos      | Magaña     | Director General      |
| Ruben       | López      | Subdirector Marketing |
| Alberto     | Soria      | Subdirector Ventas    |
| Maria       | Solís      | Secretaria            |
| Juan Carlos | Ortiz      | Representante Ventas  |
| Carlos      | Soria      | Director Oficina      |
| Hilario     | Rodriguez  | Representante Ventas  |
| David       | Palma      | Representante Ventas  |
| Oscar       | Palma      | Representante Ventas  |
| Francois    | Fignon     | Director Oficina      |
| Laurent     | Serra      | Representante Ventas  |
| Hilary      | Washington | Director Oficina      |
| Marcus      | Paxton     | Representante Ventas  |
| Nei         | Nishikori  | Director Oficina      |
| Narumi      | Riko       | Representante Ventas  |
| Takuma      | Nomura     | Representante Ventas  |
| Amy         | Johnson    | Director Oficina      |
| Larry       | Westfalls  | Representante Ventas  |
| John        | Walton     | Representante Ventas  |
| Kevin       | Fallmer    | Director Oficina      |

- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente where codigo_cliente not in (select codigo_cliente from pago);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto |    telefono    |      fax       |     linea_direccion1     | linea_direccion2 |        ciudad        |   region    |      pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|----------------|----------------|--------------------------|------------------|----------------------|-------------|----------------|---------------|----------------------------|----------------|
| 6              | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado        | Madrid           | Madrid               | Madrid      | Spain          | 28930         | 11                         | 40000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001      | 916421756      | C/azores                 | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28943         | 11                         | 20000          |
| 12             | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 17             | Flowers, S.A                | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4        |                  | Montornes del valles | Barcelona   | Spain          | 24586         | 5                          | 3500           |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15        |                  | Madrid               | Madrid      | Spain          | 28011         | 30                         | 5050           |
| 20             | Americh Golf Management SL  | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 20000          |
| 21             | Aloha                       | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                |                  | Canarias             | Canarias    | Spain          | 35488         | 12                         | 50000          |
| 22             | El Prat                     | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo         |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 30000          |
| 24             | Vivero Humanes              | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54    |                  | Humanes              | Madrid      | Spain          | 28970         | 30                         | 7430           |
| 25             | Fuenla City                 | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52               |                  | Fuenlabrada          | Madrid      | Spain          | 28574         | 5                          | 4500           |
| 29             | Top Campo                   | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32               |                  | Humanes              | Madrid      | Spain          | 28574         | 5                          | 5500           |
| 31             | Campohermoso                | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 30                         | 3250           |
| 32             | france telecom              | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me |                  | Paris                |             | France         | 75010         | 16                         | 10000          |
| 33             | Musée du Louvre             | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre           |                  | Paris                |             | France         | 75058         | 16                         | 30000          |
| 36             | Flores S.L.                 | Antonio         | Romero            | 654352981      | 685249700      | Avenida España           |                  | Madrid               | Fuenlabrada | Spain          | 29643         | 18                         | 6000           |
| 37             | The Magic Garden            | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park            |                  | London               | London      | United Kingdom | 65930         | 18                         | 10000          |

- Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql
select * from cliente where codigo_cliente in (select codigo_cliente from pago);
```
| codigo_cliente |         nombre_cliente         | nombre_contacto | apellido_contacto |  telefono   |     fax     |              linea_direccion1              | linea_direccion2  |          ciudad          |       region        |   pais    | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|--------------------------------|-----------------|-------------------|-------------|-------------|--------------------------------------------|-------------------|--------------------------|---------------------|-----------|---------------|----------------------------|----------------|
| 1              | GoldFish Garden                | Daniel G        | GoldFish          | 5556901745  | 5556901746  | False Street 52 2 A                        |                   | San Francisco            |                     | USA       | 24006         | 19                         | 3000           |
| 3              | Gardening Associates           | Anne            | Wright            | 5557410345  | 5557410346  | Wall-e Avenue                              |                   | Miami                    | Miami               | USA       | 24010         | 19                         | 6000           |
| 4              | Gerudo Valley                  | Link            | Flaute            | 5552323129  | 5552323128  | Oaks Avenue nº22                           |                   | New York                 |                     | USA       | 85495         | 22                         | 12000          |
| 5              | Tendo Garden                   | Akane           | Tendo             | 55591233210 | 55591233211 | Null Street nº69                           |                   | Miami                    |                     | USA       | 696969        | 22                         | 600000         |
| 7              | Beragua                        | Jose            | Bermejo           | 654987321   | 916549872   | C/pintor segundo                           | Getafe            | Madrid                   | Madrid              | Spain     | 28942         | 11                         | 20000          |
| 9              | Naturagua                      | Guillermo       | Rengifo           | 689234750   | 916428956   | C/majadahonda                              | Boadilla          | Madrid                   | Madrid              | Spain     | 28947         | 11                         | 32000          |
| 13             | Camunas Jardines S.L.          | Pedro           | Camunas           | 34914873241 | 34914871541 | C/Virgenes 45                              | C/Princesas 2 1ºB | San Lorenzo del Escorial | Madrid              | Spain     | 28145         | 8                          | 16481          |
| 14             | Dardena S.A.                   | Juan            | Rodriguez         | 34912453217 | 34912484764 | C/Nueva York 74                            |                   | Madrid                   | Madrid              | Spain     | 28003         | 8                          | 321000         |
| 15             | Jardin de Flores               | Javier          | Villar            | 654865643   | 914538776   | C/ Oña 34                                  |                   | Madrid                   | Madrid              | Spain     | 28950         | 30                         | 40000          |
| 16             | Flores Marivi                  | Maria           | Rodriguez         | 666555444   | 912458657   | C/Leganes24                                |                   | Fuenlabrada              | Madrid              | Spain     | 28945         | 5                          | 1500           |
| 19             | Golf S.A.                      | Luis            | Martinez          | 916458762   | 912354475   | C/Estancado                                |                   | Santa cruz de Tenerife   | Islas Canarias      | Spain     | 38297         | 12                         | 30000          |
| 23             | Sotogrande                     | Maria           | Santillana        | 915576622   | 914825645   | C/Paseo del Parque                         |                   | Sotogrande               | Cadiz               | Spain     | 11310         | 12                         | 60000          |
| 26             | Jardines y Mansiones Cactus SL | Eva María       | Sánchez           | 916877445   | 914477777   | Polígono Industrial Maspalomas, Nº52       | Móstoles          | Madrid                   | Madrid              | Spain     | 29874         | 9                          | 76000          |
| 27             | Jardinerías Matías SL          | Matías          | San Martín        | 916544147   | 917897474   | C/Francisco Arce, Nº44                     | Bustarviejo       | Madrid                   | Madrid              | Spain     | 37845         | 9                          | 100500         |
| 28             | Agrojardin                     | Benito          | Lopez             | 675432926   | 916549264   | C/Mar Caspio 43                            |                   | Getafe                   | Madrid              | Spain     | 28904         | 30                         | 8040           |
| 30             | Jardineria Sara                | Sara            | Marquez           | 675124537   | 912475843   | C/Lima 1                                   |                   | Fuenlabrada              | Madrid              | Spain     | 27584         | 5                          | 7500           |
| 35             | Tutifruti S.A                  | Jacob           | Jones             | 2 9261-2433 | 2 9283-1695 | level 24, St. Martins Tower.-31 Market St. |                   | Sydney                   | Nueva Gales del Sur | Australia | 2000          | 31                         | 10000          |
| 38             | El Jardin Viviente S.L         | Justin          | Smith             | 2 8005-7161 | 2 8005-7162 | 176 Cumberland Street The rocks            |                   | Sydney                   | Nueva Gales del Sur | Australia | 2003          | 31                         | 8000           |

- Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select codigo_producto, nombre from producto where codigo_producto not in (select codigo_producto from detalle_pedido);
```
| codigo_producto |                           nombre                            |
|-----------------|-------------------------------------------------------------|
| FR-104          | Olea-Olivos                                                 |
| FR-14           | Calamondin Mini                                             |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| FR-24           | Albaricoquero Corbato                                       |
| FR-25           | Albaricoquero Moniqui                                       |
| FR-26           | Albaricoquero Kurrot                                        |
| FR-27           | Cerezo Burlat                                               |
| FR-28           | Cerezo Picota                                               |
| FR-30           | Ciruelo R. Claudia Verde                                    |
| FR-32           | Ciruelo Golden Japan                                        |
| FR-35           | Ciruelo Claudia Negra                                       |
| FR-38           | Higuera Verdal                                              |
| FR-39           | Higuera Breva                                               |
| FR-44           | Melocotonero Spring Crest                                   |
| FR-46           | Melocotonero Federica                                       |
| FR-49           | Parra Uva de Mesa                                           |
| FR-5            | Mandarino -Plantón joven                                    |
| FR-50           | Peral Castell                                               |
| FR-51           | Peral Williams                                              |
| FR-52           | Peral Conference                                            |
| FR-55           | Olivo Cipresino                                             |
| FR-59           | Albaricoquero                                               |
| FR-61           | Albaricoquero                                               |
| FR-62           | Albaricoquero                                               |
| FR-63           | Cerezo                                                      |
| FR-65           | Cerezo                                                      |
| FR-68           | Cerezo                                                      |
| FR-70           | Ciruelo                                                     |
| FR-73           | Granado                                                     |
| FR-74           | Granado                                                     |
| FR-76           | Granado                                                     |
| FR-83           | Higuera                                                     |
| FR-88           | Manzano                                                     |
| FR-92           | Melocotonero                                                |
| FR-93           | Melocotonero                                                |
| FR-95           | Melocotonero                                                |
| FR-96           | Membrillero                                                 |
| FR-97           | Membrillero                                                 |
| FR-98           | Membrillero                                                 |
| FR-99           | Membrillero                                                 |
| OR-001          | Arbustos Mix Maceta                                         |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             |
| OR-103          | Mimosa Semilla Bayleyana                                    |
| OR-105          | Mimosa Semilla Espectabilis                                 |
| OR-106          | Mimosa Semilla Longifolia                                   |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      |
| OR-108          | Abelia Floribunda                                           |
| OR-109          | Callistemom (Mix)                                           |
| OR-110          | Callistemom (Mix)                                           |
| OR-111          | Corylus Avellana \"Contorta\"                               |
| OR-112          | Escallonia (Mix)                                            |
| OR-113          | Evonimus Emerald Gayeti                                     |
| OR-114          | Evonimus Pulchellus                                         |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa                       |
| OR-121          | Lonicera Nitida \"Maigrum\"                                 |
| OR-124          | Prunus pisardii                                             |
| OR-126          | Weigelia \"Bristol Ruby\"                                   |
| OR-131          | Leptospermum formado PIRAMIDE                               |
| OR-132          | Leptospermum COPA                                           |
| OR-133          | Nerium oleander-CALIDAD \"GARDEN\"                          |
| OR-134          | Nerium Oleander Arbusto GRANDE                              |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           |
| OR-137          | ROSAL TREPADOR                                              |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
| OR-142          | Solanum Jazminoide                                          |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       |
| OR-144          | Wisteria Sinensis INJERTADAS DECÃ“                          |
| OR-145          | Bougamvillea Sanderiana Tutor                               |
| OR-148          | Bougamvillea Sanderiana Espaldera                           |
| OR-149          | Bougamvillea Sanderiana Espaldera                           |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    |
| OR-153          | Expositor Árboles clima mediterráneo                        |
| OR-154          | Expositor Árboles borde del mar                             |
| OR-158          | Brachychiton Acerifolius                                    |
| OR-161          | Cassia Corimbosa                                            |
| OR-162          | Cassia Corimbosa                                            |
| OR-163          | Chitalpa Summer Bells                                       |
| OR-164          | Erytrina Kafra                                              |
| OR-166          | Eucalyptus Citriodora                                       |
| OR-167          | Eucalyptus Ficifolia                                        |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  |
| OR-170          | Lagunaria Patersonii                                        |
| OR-171          | Lagunaria Patersonii                                        |
| OR-173          | Morus Alba                                                  |
| OR-175          | Platanus Acerifolia                                         |
| OR-178          | Salix Babylonica  Pendula                                   |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           |
| OR-182          | Tecoma Stands                                               |
| OR-183          | Tecoma Stands                                               |
| OR-184          | Tipuana Tipu                                                |
| OR-185          | Pleioblastus distichus-Bambú enano                          |
| OR-187          | Sasa palmata                                                |
| OR-189          | Phylostachys aurea                                          |
| OR-190          | Phylostachys aurea                                          |
| OR-191          | Phylostachys Bambusa Spectabilis                            |
| OR-192          | Phylostachys biseti                                         |
| OR-194          | Pseudosasa japonica (Metake)                                |
| OR-195          | Pseudosasa japonica (Metake)                                |
| OR-197          | Cedrus Deodara \"Feeling Blue\" Novedad                     |
| OR-198          | Juniperus chinensis \"Blue Alps\"                           |
| OR-199          | Juniperus Chinensis Stricta                                 |
| OR-201          | Juniperus squamata \"Blue Star\"                            |
| OR-202          | Juniperus x media Phitzeriana verde                         |
| OR-212          | Bismarckia Nobilis                                          |
| OR-215          | Brahea Armata                                               |
| OR-216          | Brahea Edulis                                               |
| OR-219          | Butia Capitata                                              |
| OR-220          | Butia Capitata                                              |
| OR-221          | Butia Capitata                                              |
| OR-223          | Chamaerops Humilis                                          |
| OR-224          | Chamaerops Humilis                                          |
| OR-228          | Chamaerops Humilis \"Cerifera\"                             |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           |
| OR-230          | Cordyline Australis -DRACAENA                               |
| OR-231          | Cycas Revoluta                                              |
| OR-232          | Cycas Revoluta                                              |
| OR-233          | Dracaena Drago                                              |
| OR-235          | Dracaena Drago                                              |
| OR-238          | Livistonia Decipiens                                        |
| OR-239          | Livistonia Decipiens                                        |
| OR-242          | Rhaphis Excelsa                                             |
| OR-244          | Sabal Minor                                                 |
| OR-245          | Sabal Minor                                                 |
| OR-246          | Trachycarpus Fortunei                                       |
| OR-248          | Washingtonia Robusta                                        |
| OR-251          | Zamia Furfuracaea                                           |

- Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
select e.nombre, e.apellido1 || ' '  || e.apellido2 as apellidos, e.puesto, o.telefono as telefono_oficina from empleado as e join oficina as o on e.codigo_oficina = o.codigo_oficina where e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente); 
```
|   nombre    |     apellidos     |        puesto         | telefono_oficina |
|-------------|-------------------|-----------------------|------------------|
| Marcos      | Magaña Perez      | Director General      | +34 925 867231   |
| Ruben       | López Martinez    | Subdirector Marketing | +34 925 867231   |
| Alberto     | Soria Carrasco    | Subdirector Ventas    | +34 925 867231   |
| Maria       | Solís Jerez       | Secretaria            | +34 925 867231   |
| Juan Carlos | Ortiz Serrano     | Representante Ventas  | +34 925 867231   |
| Carlos      | Soria Jimenez     | Director Oficina      | +34 91 7514487   |
| Hilario     | Rodriguez Huertas | Representante Ventas  | +34 91 7514487   |
| David       | Palma Aceituno    | Representante Ventas  | +34 93 3561182   |
| Oscar       | Palma Aceituno    | Representante Ventas  | +34 93 3561182   |
| Francois    | Fignon            | Director Oficina      | +33 14 723 4404  |
| Laurent     | Serra             | Representante Ventas  | +33 14 723 4404  |
| Hilary      | Washington        | Director Oficina      | +1 215 837 0825  |
| Marcus      | Paxton            | Representante Ventas  | +1 215 837 0825  |
| Nei         | Nishikori         | Director Oficina      | +81 33 224 5000  |
| Narumi      | Riko              | Representante Ventas  | +81 33 224 5000  |
| Takuma      | Nomura            | Representante Ventas  | +81 33 224 5000  |
| Amy         | Johnson           | Director Oficina      | +44 20 78772041  |
| Larry       | Westfalls         | Representante Ventas  | +44 20 78772041  |
| John        | Walton            | Representante Ventas  | +44 20 78772041  |
| Kevin       | Fallmer           | Director Oficina      | +61 2 9264 2451  |

- Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
select * from oficina where codigo_oficina not in (select codigo_oficina from empleado where codigo_empleado not in (select c.codigo_empleado_rep_ventas from cliente as c join pedido as ped on c.codigo_cliente = ped.codigo_cliente join detalle_pedido as d on d.codigo_pedido = ped.codigo_pedido join producto as pro on pro.codigo_producto = d.codigo_producto where pro.gama = 'Frutales'));
```
| codigo_oficina |    ciudad     | pais | region | codigo_postal |    telefono     | linea_direccion1  | linea_direccion2 |
|----------------|---------------|------|--------|---------------|-----------------|-------------------|------------------|
| SFC-USA        | San Francisco | EEUU | CA     | 94080         | +1 650 219 4782 | 100 Market Street | Suite 300        |

- Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
select distinct c.* from cliente as c join pedido as p on c.codigo_cliente = p.codigo_cliente where c.codigo_cliente not in (select codigo_cliente from pago);
```
| codigo_cliente | nombre_cliente | nombre_contacto | apellido_contacto | telefono  |    fax    | linea_direccion1 | linea_direccion2 | ciudad |   region    | pais  | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|----------------|-----------------|-------------------|-----------|-----------|------------------|------------------|--------|-------------|-------|---------------|----------------------------|----------------|
| 36             | Flores S.L.    | Antonio         | Romero            | 654352981 | 685249700 | Avenida España   |                  | Madrid | Fuenlabrada | Spain | 29643         | 18                         | 6000           |

- Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente where codigo_cliente not in (select codigo_cliente from pago);
```
| codigo_cliente |       nombre_cliente        | nombre_contacto | apellido_contacto |    telefono    |      fax       |     linea_direccion1     | linea_direccion2 |        ciudad        |   region    |      pais      | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|-----------------------------|-----------------|-------------------|----------------|----------------|--------------------------|------------------|----------------------|-------------|----------------|---------------|----------------------------|----------------|
| 6              | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 8              | Club Golf Puerta del hierro | Paco            | Lopez             | 62456810       | 919535678      | C/sinesio delgado        | Madrid           | Madrid               | Madrid      | Spain          | 28930         | 11                         | 40000          |
| 10             | DaraDistribuciones          | David           | Serrano           | 675598001      | 916421756      | C/azores                 | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28946         | 11                         | 50000          |
| 11             | Madrileña de riegos         | Jose            | Tacaño            | 655983045      | 916689215      | C/Lagañas                | Fuenlabrada      | Madrid               | Madrid      | Spain          | 28943         | 11                         | 20000          |
| 12             | Lasas S.A.                  | Antonio         | Lasas             | 34916540145    | 34914851312    | C/Leganes 15             |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 8                          | 154310         |
| 17             | Flowers, S.A                | Beatriz         | Fernandez         | 698754159      | 978453216      | C/Luis Salquillo4        |                  | Montornes del valles | Barcelona   | Spain          | 24586         | 5                          | 3500           |
| 18             | Naturajardin                | Victoria        | Cruz              | 612343529      | 916548735      | Plaza Magallón 15        |                  | Madrid               | Madrid      | Spain          | 28011         | 30                         | 5050           |
| 20             | Americh Golf Management SL  | Mario           | Suarez            | 964493072      | 964493063      | C/Letardo                |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 20000          |
| 21             | Aloha                       | Cristian        | Rodrigez          | 916485852      | 914489898      | C/Roman 3                |                  | Canarias             | Canarias    | Spain          | 35488         | 12                         | 50000          |
| 22             | El Prat                     | Francisco       | Camacho           | 916882323      | 916493211      | Avenida Tibidabo         |                  | Barcelona            | Cataluña    | Spain          | 12320         | 12                         | 30000          |
| 24             | Vivero Humanes              | Federico        | Gomez             | 654987690      | 916040875      | C/Miguel Echegaray 54    |                  | Humanes              | Madrid      | Spain          | 28970         | 30                         | 7430           |
| 25             | Fuenla City                 | Tony            | Muñoz Mena        | 675842139      | 915483754      | C/Callo 52               |                  | Fuenlabrada          | Madrid      | Spain          | 28574         | 5                          | 4500           |
| 29             | Top Campo                   | Joseluis        | Sanchez           | 685746512      | 974315924      | C/Ibiza 32               |                  | Humanes              | Madrid      | Spain          | 28574         | 5                          | 5500           |
| 31             | Campohermoso                | Luis            | Jimenez           | 645925376      | 916159116      | C/Peru 78                |                  | Fuenlabrada          | Madrid      | Spain          | 28945         | 30                         | 3250           |
| 32             | france telecom              | FraÃ§ois        | Toulou            | (33)5120578961 | (33)5120578961 | 6 place d Alleray 15Ã¨me |                  | Paris                |             | France         | 75010         | 16                         | 10000          |
| 33             | Musée du Louvre             | Pierre          | Delacroux         | (33)0140205050 | (33)0140205442 | Quai du Louvre           |                  | Paris                |             | France         | 75058         | 16                         | 30000          |
| 36             | Flores S.L.                 | Antonio         | Romero            | 654352981      | 685249700      | Avenida España           |                  | Madrid               | Fuenlabrada | Spain          | 29643         | 18                         | 6000           |
| 37             | The Magic Garden            | Richard         | Mcain             | 926523468      | 9364875882     | Lihgting Park            |                  | London               | London      | United Kingdom | 65930         | 18                         | 10000          |

- Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql
select distinct c.* from cliente as c join pago as p on c.codigo_cliente = p.codigo_cliente;
```
| codigo_cliente |         nombre_cliente         | nombre_contacto | apellido_contacto |  telefono   |     fax     |              linea_direccion1              | linea_direccion2  |          ciudad          |       region        |   pais    | codigo_postal | codigo_empleado_rep_ventas | limite_credito |
|----------------|--------------------------------|-----------------|-------------------|-------------|-------------|--------------------------------------------|-------------------|--------------------------|---------------------|-----------|---------------|----------------------------|----------------|
| 1              | GoldFish Garden                | Daniel G        | GoldFish          | 5556901745  | 5556901746  | False Street 52 2 A                        |                   | San Francisco            |                     | USA       | 24006         | 19                         | 3000           |
| 3              | Gardening Associates           | Anne            | Wright            | 5557410345  | 5557410346  | Wall-e Avenue                              |                   | Miami                    | Miami               | USA       | 24010         | 19                         | 6000           |
| 4              | Gerudo Valley                  | Link            | Flaute            | 5552323129  | 5552323128  | Oaks Avenue nº22                           |                   | New York                 |                     | USA       | 85495         | 22                         | 12000          |
| 5              | Tendo Garden                   | Akane           | Tendo             | 55591233210 | 55591233211 | Null Street nº69                           |                   | Miami                    |                     | USA       | 696969        | 22                         | 600000         |
| 7              | Beragua                        | Jose            | Bermejo           | 654987321   | 916549872   | C/pintor segundo                           | Getafe            | Madrid                   | Madrid              | Spain     | 28942         | 11                         | 20000          |
| 9              | Naturagua                      | Guillermo       | Rengifo           | 689234750   | 916428956   | C/majadahonda                              | Boadilla          | Madrid                   | Madrid              | Spain     | 28947         | 11                         | 32000          |
| 13             | Camunas Jardines S.L.          | Pedro           | Camunas           | 34914873241 | 34914871541 | C/Virgenes 45                              | C/Princesas 2 1ºB | San Lorenzo del Escorial | Madrid              | Spain     | 28145         | 8                          | 16481          |
| 14             | Dardena S.A.                   | Juan            | Rodriguez         | 34912453217 | 34912484764 | C/Nueva York 74                            |                   | Madrid                   | Madrid              | Spain     | 28003         | 8                          | 321000         |
| 15             | Jardin de Flores               | Javier          | Villar            | 654865643   | 914538776   | C/ Oña 34                                  |                   | Madrid                   | Madrid              | Spain     | 28950         | 30                         | 40000          |
| 16             | Flores Marivi                  | Maria           | Rodriguez         | 666555444   | 912458657   | C/Leganes24                                |                   | Fuenlabrada              | Madrid              | Spain     | 28945         | 5                          | 1500           |
| 19             | Golf S.A.                      | Luis            | Martinez          | 916458762   | 912354475   | C/Estancado                                |                   | Santa cruz de Tenerife   | Islas Canarias      | Spain     | 38297         | 12                         | 30000          |
| 23             | Sotogrande                     | Maria           | Santillana        | 915576622   | 914825645   | C/Paseo del Parque                         |                   | Sotogrande               | Cadiz               | Spain     | 11310         | 12                         | 60000          |
| 26             | Jardines y Mansiones Cactus SL | Eva María       | Sánchez           | 916877445   | 914477777   | Polígono Industrial Maspalomas, Nº52       | Móstoles          | Madrid                   | Madrid              | Spain     | 29874         | 9                          | 76000          |
| 27             | Jardinerías Matías SL          | Matías          | San Martín        | 916544147   | 917897474   | C/Francisco Arce, Nº44                     | Bustarviejo       | Madrid                   | Madrid              | Spain     | 37845         | 9                          | 100500         |
| 28             | Agrojardin                     | Benito          | Lopez             | 675432926   | 916549264   | C/Mar Caspio 43                            |                   | Getafe                   | Madrid              | Spain     | 28904         | 30                         | 8040           |
| 30             | Jardineria Sara                | Sara            | Marquez           | 675124537   | 912475843   | C/Lima 1                                   |                   | Fuenlabrada              | Madrid              | Spain     | 27584         | 5                          | 7500           |
| 35             | Tutifruti S.A                  | Jacob           | Jones             | 2 9261-2433 | 2 9283-1695 | level 24, St. Martins Tower.-31 Market St. |                   | Sydney                   | Nueva Gales del Sur | Australia | 2000          | 31                         | 10000          |
| 38             | El Jardin Viviente S.L         | Justin          | Smith             | 2 8005-7161 | 2 8005-7162 | 176 Cumberland Street The rocks            |                   | Sydney                   | Nueva Gales del Sur | Australia | 2003          | 31                         | 8000           |

- Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select * from producto where codigo_producto not in (select codigo_producto from detalle_pedido);
```
| codigo_producto |                           nombre                            |     gama     | dimensiones |         proveedor         |                         descripcion                          | cantidad_en_stock | precio_venta | precio_proveedor |
|-----------------|-------------------------------------------------------------|--------------|-------------|---------------------------|--------------------------------------------------------------|-------------------|--------------|------------------|
| FR-104          | Olea-Olivos                                                 | Frutales     | 12/4        | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que pos | 50                | 49           | 39               |
|                 |                                                             |              |             |                           | tula que proviene de las costas de Siria, Líbano e Israel y  |                   |              |                  |
|                 |                                                             |              |             |                           | otra que considera que lo considera originario de Asia menor |                   |              |                  |
|                 |                                                             |              |             |                           | . La llegada a Europa probablemente tuvo lugar de mano de lo |                   |              |                  |
|                 |                                                             |              |             |                           | s Fenicios, en transito por Chipre, Creta, e Islas del Mar E |                   |              |                  |
|                 |                                                             |              |             |                           | geo, pasando a Grecia y más tarde a Italia. Los primeros ind |                   |              |                  |
|                 |                                                             |              |             |                           | icios de la presencia del olivo en las costas mediterráneas  |                   |              |                  |
|                 |                                                             |              |             |                           | españolas coinciden con el dominio romano, aunque fueron pos |                   |              |                  |
|                 |                                                             |              |             |                           | teriormente los árabes los que impulsaron su cultivo en Anda |                   |              |                  |
|                 |                                                             |              |             |                           | lucía, convirtiendo a España en el primer país productor de  |                   |              |                  |
|                 |                                                             |              |             |                           | aceite de oliva a nivel mundial.                             |                   |              |                  |
| FR-14           | Calamondin Mini                                             | Frutales     |             | Frutales Talavera S.A     | Se trata de un pequeño arbolito de copa densa, con tendencia | 15                | 10           | 8                |
|                 |                                                             |              |             |                           |  a la verticalidad, inerme o con cortas espinas. Sus hojas s |                   |              |                  |
|                 |                                                             |              |             |                           | on pequeñas, elípticas de 5-10 cm de longitud, con los pecío |                   |              |                  |
|                 |                                                             |              |             |                           | los estrechamente alados.Posee 1 o 2 flores en situación axi |                   |              |                  |
|                 |                                                             |              |             |                           | lar, al final de las ramillas.Sus frutos son muy pequeños (3 |                   |              |                  |
|                 |                                                             |              |             |                           | -3,5 cm de diámetro), con pocas semillas, esféricos u ovales |                   |              |                  |
|                 |                                                             |              |             |                           | , con la zona apical aplanada; corteza de color naranja-roji |                   |              |                  |
|                 |                                                             |              |             |                           | zo, muy fina y fácilmente separable de la pulpa, que es dulc |                   |              |                  |
|                 |                                                             |              |             |                           | e, ácida y comestible..                                      |                   |              |                  |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Frutales     |             | NaranjasValencianas.com   |                                                              | 350               | 4            | 3                |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          | Frutales     |             | Frutales Talavera S.A     |                                                              | 350               | 4            | 3                |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte | Frutales     |             | Frutales Talavera S.A     |                                                              | 350               | 4            | 3                |
| FR-24           | Albaricoquero Corbato                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-25           | Albaricoquero Moniqui                                       | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-26           | Albaricoquero Kurrot                                        | Frutales     |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-27           | Cerezo Burlat                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo so | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e |                   |              |                  |
|                 |                                                             |              |             |                           | l cerezo \"Duke\", híbrido de los anteriores. Ambas especies |                   |              |                  |
|                 |                                                             |              |             |                           |  son naturales del sureste de Europa y oeste de Asia. El cer |                   |              |                  |
|                 |                                                             |              |             |                           | ezo dulce tuvo su origen probablemente en el mar Negro y en  |                   |              |                  |
|                 |                                                             |              |             |                           | el mar Caspio, difundiéndose después hacia Europa y Asia, ll |                   |              |                  |
|                 |                                                             |              |             |                           | evado por los pájaros y las migraciones humanas. Fue uno de  |                   |              |                  |
|                 |                                                             |              |             |                           | los frutales más apreciados por los griegos y con el Imperio |                   |              |                  |
|                 |                                                             |              |             |                           |  Romano se extendió a regiones muy diversas. En la actualida |                   |              |                  |
|                 |                                                             |              |             |                           | d, el cerezo se encuentra difundido por numerosas regiones y |                   |              |                  |
|                 |                                                             |              |             |                           |  países del mundo con clima templado                         |                   |              |                  |
| FR-28           | Cerezo Picota                                               | Frutales     |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo so | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e |                   |              |                  |
|                 |                                                             |              |             |                           | l cerezo \"Duke\", híbrido de los anteriores. Ambas especies |                   |              |                  |
|                 |                                                             |              |             |                           |  son naturales del sureste de Europa y oeste de Asia. El cer |                   |              |                  |
|                 |                                                             |              |             |                           | ezo dulce tuvo su origen probablemente en el mar Negro y en  |                   |              |                  |
|                 |                                                             |              |             |                           | el mar Caspio, difundiéndose después hacia Europa y Asia, ll |                   |              |                  |
|                 |                                                             |              |             |                           | evado por los pájaros y las migraciones humanas. Fue uno de  |                   |              |                  |
|                 |                                                             |              |             |                           | los frutales más apreciados por los griegos y con el Imperio |                   |              |                  |
|                 |                                                             |              |             |                           |  Romano se extendió a regiones muy diversas. En la actualida |                   |              |                  |
|                 |                                                             |              |             |                           | d, el cerezo se encuentra difundido por numerosas regiones y |                   |              |                  |
|                 |                                                             |              |             |                           |  países del mundo con clima templado                         |                   |              |                  |
| FR-30           | Ciruelo R. Claudia Verde                                    | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 | 400               | 8            | 6                |
|                 |                                                             |              |             |                           |  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie |                   |              |                  |
|                 |                                                             |              |             |                           | tada longitudinalmente. Produce ramas alternas, pequeñas, de |                   |              |                  |
|                 |                                                             |              |             |                           | lgadas, unas veces lisas, glabras y otras pubescentes y vell |                   |              |                  |
|                 |                                                             |              |             |                           | osas                                                         |                   |              |                  |
| FR-32           | Ciruelo Golden Japan                                        | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 | 400               | 8            | 6                |
|                 |                                                             |              |             |                           |  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie |                   |              |                  |
|                 |                                                             |              |             |                           | tada longitudinalmente. Produce ramas alternas, pequeñas, de |                   |              |                  |
|                 |                                                             |              |             |                           | lgadas, unas veces lisas, glabras y otras pubescentes y vell |                   |              |                  |
|                 |                                                             |              |             |                           | osas                                                         |                   |              |                  |
| FR-35           | Ciruelo Claudia Negra                                       | Frutales     |             | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 | 400               | 8            | 6                |
|                 |                                                             |              |             |                           |  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie |                   |              |                  |
|                 |                                                             |              |             |                           | tada longitudinalmente. Produce ramas alternas, pequeñas, de |                   |              |                  |
|                 |                                                             |              |             |                           | lgadas, unas veces lisas, glabras y otras pubescentes y vell |                   |              |                  |
|                 |                                                             |              |             |                           | osas                                                         |                   |              |                  |
| FR-38           | Higuera Verdal                                              | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en | 400               | 9            | 7                |
|                 |                                                             |              |             |                           |  los países mediterráneos. Su rusticidad y su fácil multipli |                   |              |                  |
|                 |                                                             |              |             |                           | cación hacen de la higuera un frutal muy apropiado para el c |                   |              |                  |
|                 |                                                             |              |             |                           | ultivo extensivo.. Siempre ha sido considerado como árbol qu |                   |              |                  |
|                 |                                                             |              |             |                           | e no requiere cuidado alguno una vez plantado y arraigado, l |                   |              |                  |
|                 |                                                             |              |             |                           | imitándose el hombre a recoger de él los frutos cuando madur |                   |              |                  |
|                 |                                                             |              |             |                           | an, unos para consumo en fresco y otros para conserva. Las ú |                   |              |                  |
|                 |                                                             |              |             |                           | nicas higueras con cuidados culturales esmerados, en muchas  |                   |              |                  |
|                 |                                                             |              |             |                           | comarcas, son las brevales, por el interés económico de su p |                   |              |                  |
|                 |                                                             |              |             |                           | rimera cosecha, la de brevas.                                |                   |              |                  |
| FR-39           | Higuera Breva                                               | Frutales     |             | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en | 400               | 9            | 7                |
|                 |                                                             |              |             |                           |  los países mediterráneos. Su rusticidad y su fácil multipli |                   |              |                  |
|                 |                                                             |              |             |                           | cación hacen de la higuera un frutal muy apropiado para el c |                   |              |                  |
|                 |                                                             |              |             |                           | ultivo extensivo.. Siempre ha sido considerado como árbol qu |                   |              |                  |
|                 |                                                             |              |             |                           | e no requiere cuidado alguno una vez plantado y arraigado, l |                   |              |                  |
|                 |                                                             |              |             |                           | imitándose el hombre a recoger de él los frutos cuando madur |                   |              |                  |
|                 |                                                             |              |             |                           | an, unos para consumo en fresco y otros para conserva. Las ú |                   |              |                  |
|                 |                                                             |              |             |                           | nicas higueras con cuidados culturales esmerados, en muchas  |                   |              |                  |
|                 |                                                             |              |             |                           | comarcas, son las brevales, por el interés económico de su p |                   |              |                  |
|                 |                                                             |              |             |                           | rimera cosecha, la de brevas.                                |                   |              |                  |
| FR-44           | Melocotonero Spring Crest                                   | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color c | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | eniciento. Sus hojas son alargadas con el margen ligeramente |                   |              |                  |
|                 |                                                             |              |             |                           |  aserrado, de color verde brillante, algo más claras por el  |                   |              |                  |
|                 |                                                             |              |             |                           | envés. El melocotonero está muy arraigado en la cultura asiá |                   |              |                  |
|                 |                                                             |              |             |                           | tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C |                   |              |                  |
|                 |                                                             |              |             |                           | id japonés, nació del interior de un enorme melocotón que fl |                   |              |                  |
|                 |                                                             |              |             |                           | otaba río abajo.\r\nEn China se piensa que comer melocotón c |                   |              |                  |
|                 |                                                             |              |             |                           | onfiere longevidad al ser humano, ya que formaba parte de la |                   |              |                  |
|                 |                                                             |              |             |                           |  dieta de sus dioses inmortales.                             |                   |              |                  |
| FR-46           | Melocotonero Federica                                       | Frutales     |             | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color c | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | eniciento. Sus hojas son alargadas con el margen ligeramente |                   |              |                  |
|                 |                                                             |              |             |                           |  aserrado, de color verde brillante, algo más claras por el  |                   |              |                  |
|                 |                                                             |              |             |                           | envés. El melocotonero está muy arraigado en la cultura asiá |                   |              |                  |
|                 |                                                             |              |             |                           | tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C |                   |              |                  |
|                 |                                                             |              |             |                           | id japonés, nació del interior de un enorme melocotón que fl |                   |              |                  |
|                 |                                                             |              |             |                           | otaba río abajo.\r\nEn China se piensa que comer melocotón c |                   |              |                  |
|                 |                                                             |              |             |                           | onfiere longevidad al ser humano, ya que formaba parte de la |                   |              |                  |
|                 |                                                             |              |             |                           |  dieta de sus dioses inmortales.                             |                   |              |                  |
| FR-49           | Parra Uva de Mesa                                           | Frutales     |             | Frutales Talavera S.A     |                                                              | 400               | 8            | 6                |
| FR-5            | Mandarino -Plantón joven                                    | Frutales     |             | Frutales Talavera S.A     |                                                              | 15                | 6            | 4                |
| FR-50           | Peral Castell                                               | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que  | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | llega hasta 20 metros de altura y por término medio vive 65  |                   |              |                  |
|                 |                                                             |              |             |                           | años.Tronco alto, grueso, de corteza agrietada, gris, de la  |                   |              |                  |
|                 |                                                             |              |             |                           | cual se destacan con frecuencia placas lenticulares.Las rama |                   |              |                  |
|                 |                                                             |              |             |                           | s se insertan formando ángulo agudo con el tronco (45º), de  |                   |              |                  |
|                 |                                                             |              |             |                           | corteza lisa, primero verde y luego gris-violácea, con numer |                   |              |                  |
|                 |                                                             |              |             |                           | osas lenticelas.                                             |                   |              |                  |
| FR-51           | Peral Williams                                              | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que  | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | llega hasta 20 metros de altura y por término medio vive 65  |                   |              |                  |
|                 |                                                             |              |             |                           | años.Tronco alto, grueso, de corteza agrietada, gris, de la  |                   |              |                  |
|                 |                                                             |              |             |                           | cual se destacan con frecuencia placas lenticulares.Las rama |                   |              |                  |
|                 |                                                             |              |             |                           | s se insertan formando ángulo agudo con el tronco (45º), de  |                   |              |                  |
|                 |                                                             |              |             |                           | corteza lisa, primero verde y luego gris-violácea, con numer |                   |              |                  |
|                 |                                                             |              |             |                           | osas lenticelas.                                             |                   |              |                  |
| FR-52           | Peral Conference                                            | Frutales     |             | Frutales Talavera S.A     | Árbol piramidal, redondeado en su juventud, luego oval, que  | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | llega hasta 20 metros de altura y por término medio vive 65  |                   |              |                  |
|                 |                                                             |              |             |                           | años.Tronco alto, grueso, de corteza agrietada, gris, de la  |                   |              |                  |
|                 |                                                             |              |             |                           | cual se destacan con frecuencia placas lenticulares.Las rama |                   |              |                  |
|                 |                                                             |              |             |                           | s se insertan formando ángulo agudo con el tronco (45º), de  |                   |              |                  |
|                 |                                                             |              |             |                           | corteza lisa, primero verde y luego gris-violácea, con numer |                   |              |                  |
|                 |                                                             |              |             |                           | osas lenticelas.                                             |                   |              |                  |
| FR-55           | Olivo Cipresino                                             | Frutales     |             | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que pos | 400               | 8            | 6                |
|                 |                                                             |              |             |                           | tula que proviene de las costas de Siria, Líbano e Israel y  |                   |              |                  |
|                 |                                                             |              |             |                           | otra que considera que lo considera originario de Asia menor |                   |              |                  |
|                 |                                                             |              |             |                           | . La llegada a Europa probablemente tuvo lugar de mano de lo |                   |              |                  |
|                 |                                                             |              |             |                           | s Fenicios, en transito por Chipre, Creta, e Islas del Mar E |                   |              |                  |
|                 |                                                             |              |             |                           | geo, pasando a Grecia y más tarde a Italia. Los primeros ind |                   |              |                  |
|                 |                                                             |              |             |                           | icios de la presencia del olivo en las costas mediterráneas  |                   |              |                  |
|                 |                                                             |              |             |                           | españolas coinciden con el dominio romano, aunque fueron pos |                   |              |                  |
|                 |                                                             |              |             |                           | teriormente los árabes los que impulsaron su cultivo en Anda |                   |              |                  |
|                 |                                                             |              |             |                           | lucía, convirtiendo a España en el primer país productor de  |                   |              |                  |
|                 |                                                             |              |             |                           | aceite de oliva a nivel mundial.                             |                   |              |                  |
| FR-59           | Albaricoquero                                               | Frutales     | 10/12       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 200               | 22           | 17               |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-61           | Albaricoquero                                               | Frutales     | 14/16       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 200               | 49           | 39               |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-62           | Albaricoquero                                               | Frutales     | 16/18       | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región med | 200               | 70           | 56               |
|                 |                                                             |              |             |                           | iterránea con ramas formando una copa redondeada. La corteza |                   |              |                  |
|                 |                                                             |              |             |                           |  del tronco es pardo-violácea, agrietada; las ramas son roji |                   |              |                  |
|                 |                                                             |              |             |                           | zas y extendidas cuando jóvenes y las ramas secundarias son  |                   |              |                  |
|                 |                                                             |              |             |                           | cortas, divergentes y escasas. Las yemas latentes son frecue |                   |              |                  |
|                 |                                                             |              |             |                           | ntes especialmente sobre las ramas viejas.                   |                   |              |                  |
| FR-63           | Cerezo                                                      | Frutales     | 8/10        | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo so | 300               | 11           | 8                |
|                 |                                                             |              |             |                           | n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e |                   |              |                  |
|                 |                                                             |              |             |                           | l cerezo \"Duke\", híbrido de los anteriores. Ambas especies |                   |              |                  |
|                 |                                                             |              |             |                           |  son naturales del sureste de Europa y oeste de Asia. El cer |                   |              |                  |
|                 |                                                             |              |             |                           | ezo dulce tuvo su origen probablemente en el mar Negro y en  |                   |              |                  |
|                 |                                                             |              |             |                           | el mar Caspio, difundiéndose después hacia Europa y Asia, ll |                   |              |                  |
|                 |                                                             |              |             |                           | evado por los pájaros y las migraciones humanas. Fue uno de  |                   |              |                  |
|                 |                                                             |              |             |                           | los frutales más apreciados por los griegos y con el Imperio |                   |              |                  |
|                 |                                                             |              |             |                           |  Romano se extendió a regiones muy diversas. En la actualida |                   |              |                  |
|                 |                                                             |              |             |                           | d, el cerezo se encuentra difundido por numerosas regiones y |                   |              |                  |
|                 |                                                             |              |             |                           |  países del mundo con clima templado                         |                   |              |                  |
| FR-65           | Cerezo                                                      | Frutales     | 12/14       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo so | 200               | 32           | 25               |
|                 |                                                             |              |             |                           | n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e |                   |              |                  |
|                 |                                                             |              |             |                           | l cerezo \"Duke\", híbrido de los anteriores. Ambas especies |                   |              |                  |
|                 |                                                             |              |             |                           |  son naturales del sureste de Europa y oeste de Asia. El cer |                   |              |                  |
|                 |                                                             |              |             |                           | ezo dulce tuvo su origen probablemente en el mar Negro y en  |                   |              |                  |
|                 |                                                             |              |             |                           | el mar Caspio, difundiéndose después hacia Europa y Asia, ll |                   |              |                  |
|                 |                                                             |              |             |                           | evado por los pájaros y las migraciones humanas. Fue uno de  |                   |              |                  |
|                 |                                                             |              |             |                           | los frutales más apreciados por los griegos y con el Imperio |                   |              |                  |
|                 |                                                             |              |             |                           |  Romano se extendió a regiones muy diversas. En la actualida |                   |              |                  |
|                 |                                                             |              |             |                           | d, el cerezo se encuentra difundido por numerosas regiones y |                   |              |                  |
|                 |                                                             |              |             |                           |  países del mundo con clima templado                         |                   |              |                  |
| FR-68           | Cerezo                                                      | Frutales     | 18/20       | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo so | 50                | 80           | 64               |
|                 |                                                             |              |             |                           | n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e |                   |              |                  |
|                 |                                                             |              |             |                           | l cerezo \"Duke\", híbrido de los anteriores. Ambas especies |                   |              |                  |
|                 |                                                             |              |             |                           |  son naturales del sureste de Europa y oeste de Asia. El cer |                   |              |                  |
|                 |                                                             |              |             |                           | ezo dulce tuvo su origen probablemente en el mar Negro y en  |                   |              |                  |
|                 |                                                             |              |             |                           | el mar Caspio, difundiéndose después hacia Europa y Asia, ll |                   |              |                  |
|                 |                                                             |              |             |                           | evado por los pájaros y las migraciones humanas. Fue uno de  |                   |              |                  |
|                 |                                                             |              |             |                           | los frutales más apreciados por los griegos y con el Imperio |                   |              |                  |
|                 |                                                             |              |             |                           |  Romano se extendió a regiones muy diversas. En la actualida |                   |              |                  |
|                 |                                                             |              |             |                           | d, el cerezo se encuentra difundido por numerosas regiones y |                   |              |                  |
|                 |                                                             |              |             |                           |  países del mundo con clima templado                         |                   |              |                  |
| FR-70           | Ciruelo                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | árbol de tamaño mediano que alcanza una altura máxima de 5-6 | 50                | 11           | 8                |
|                 |                                                             |              |             |                           |  m. Tronco de corteza pardo-azulada, brillante, lisa o agrie |                   |              |                  |
|                 |                                                             |              |             |                           | tada longitudinalmente. Produce ramas alternas, pequeñas, de |                   |              |                  |
|                 |                                                             |              |             |                           | lgadas, unas veces lisas, glabras y otras pubescentes y vell |                   |              |                  |
|                 |                                                             |              |             |                           | osas                                                         |                   |              |                  |
| FR-73           | Granado                                                     | Frutales     | 8/10        | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 | 50                | 13           | 10               |
|                 |                                                             |              |             |                           |  a 6 m de altura, con el tronco retorcido. Madera dura y cor |                   |              |                  |
|                 |                                                             |              |             |                           | teza escamosa de color grisáceo. Las ramitas jóvenes son más |                   |              |                  |
|                 |                                                             |              |             |                           |  o menos cuadrangulares o angostas y de cuatro alas, posteri |                   |              |                  |
|                 |                                                             |              |             |                           | ormente se vuelven redondas con corteza de color café grisác |                   |              |                  |
|                 |                                                             |              |             |                           | eo, la mayoría de las ramas, pero especialmente las pequeñas |                   |              |                  |
|                 |                                                             |              |             |                           |  ramitas axilares, son en forma de espina o terminan en una  |                   |              |                  |
|                 |                                                             |              |             |                           | espina aguda; la copa es extendida.                          |                   |              |                  |
| FR-74           | Granado                                                     | Frutales     | 10/12       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 | 50                | 22           | 17               |
|                 |                                                             |              |             |                           |  a 6 m de altura, con el tronco retorcido. Madera dura y cor |                   |              |                  |
|                 |                                                             |              |             |                           | teza escamosa de color grisáceo. Las ramitas jóvenes son más |                   |              |                  |
|                 |                                                             |              |             |                           |  o menos cuadrangulares o angostas y de cuatro alas, posteri |                   |              |                  |
|                 |                                                             |              |             |                           | ormente se vuelven redondas con corteza de color café grisác |                   |              |                  |
|                 |                                                             |              |             |                           | eo, la mayoría de las ramas, pero especialmente las pequeñas |                   |              |                  |
|                 |                                                             |              |             |                           |  ramitas axilares, son en forma de espina o terminan en una  |                   |              |                  |
|                 |                                                             |              |             |                           | espina aguda; la copa es extendida.                          |                   |              |                  |
| FR-76           | Granado                                                     | Frutales     | 14/16       | Frutales Talavera S.A     | pequeño árbol caducifolio, a veces con porte arbustivo, de 3 | 50                | 49           | 39               |
|                 |                                                             |              |             |                           |  a 6 m de altura, con el tronco retorcido. Madera dura y cor |                   |              |                  |
|                 |                                                             |              |             |                           | teza escamosa de color grisáceo. Las ramitas jóvenes son más |                   |              |                  |
|                 |                                                             |              |             |                           |  o menos cuadrangulares o angostas y de cuatro alas, posteri |                   |              |                  |
|                 |                                                             |              |             |                           | ormente se vuelven redondas con corteza de color café grisác |                   |              |                  |
|                 |                                                             |              |             |                           | eo, la mayoría de las ramas, pero especialmente las pequeñas |                   |              |                  |
|                 |                                                             |              |             |                           |  ramitas axilares, son en forma de espina o terminan en una  |                   |              |                  |
|                 |                                                             |              |             |                           | espina aguda; la copa es extendida.                          |                   |              |                  |
| FR-83           | Higuera                                                     | Frutales     | 18/20       | Frutales Talavera S.A     | La higuera (Ficus carica L.) es un árbol típico de secano en | 50                | 80           | 64               |
|                 |                                                             |              |             |                           |  los países mediterráneos. Su rusticidad y su fácil multipli |                   |              |                  |
|                 |                                                             |              |             |                           | cación hacen de la higuera un frutal muy apropiado para el c |                   |              |                  |
|                 |                                                             |              |             |                           | ultivo extensivo.. Siempre ha sido considerado como árbol qu |                   |              |                  |
|                 |                                                             |              |             |                           | e no requiere cuidado alguno una vez plantado y arraigado, l |                   |              |                  |
|                 |                                                             |              |             |                           | imitándose el hombre a recoger de él los frutos cuando madur |                   |              |                  |
|                 |                                                             |              |             |                           | an, unos para consumo en fresco y otros para conserva. Las ú |                   |              |                  |
|                 |                                                             |              |             |                           | nicas higueras con cuidados culturales esmerados, en muchas  |                   |              |                  |
|                 |                                                             |              |             |                           | comarcas, son las brevales, por el interés económico de su p |                   |              |                  |
|                 |                                                             |              |             |                           | rimera cosecha, la de brevas.                                |                   |              |                  |
| FR-88           | Manzano                                                     | Frutales     | 12/14       | Frutales Talavera S.A     | alcanza como máximo 10 m. de altura y tiene una copa globosa | 50                | 32           | 25               |
|                 |                                                             |              |             |                           | . Tronco derecho que normalmente alcanza de 2 a 2,5 m. de al |                   |              |                  |
|                 |                                                             |              |             |                           | tura, con corteza cubierta de lenticelas, lisa, adherida, de |                   |              |                  |
|                 |                                                             |              |             |                           |  color ceniciento verdoso sobre los ramos y escamosa y gris  |                   |              |                  |
|                 |                                                             |              |             |                           | parda sobre las partes viejas del árbol. Tiene una vida de u |                   |              |                  |
|                 |                                                             |              |             |                           | nos 60-80 años. Las ramas se insertan en ángulo abierto sobr |                   |              |                  |
|                 |                                                             |              |             |                           | e el tallo, de color verde oscuro, a veces tendiendo a negru |                   |              |                  |
|                 |                                                             |              |             |                           | zco o violáceo. Los brotes jóvenes terminan con frecuencia e |                   |              |                  |
|                 |                                                             |              |             |                           | n una espina                                                 |                   |              |                  |
| FR-92           | Melocotonero                                                | Frutales     | 8/10        | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color c | 50                | 11           | 8                |
|                 |                                                             |              |             |                           | eniciento. Sus hojas son alargadas con el margen ligeramente |                   |              |                  |
|                 |                                                             |              |             |                           |  aserrado, de color verde brillante, algo más claras por el  |                   |              |                  |
|                 |                                                             |              |             |                           | envés. El melocotonero está muy arraigado en la cultura asiá |                   |              |                  |
|                 |                                                             |              |             |                           | tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C |                   |              |                  |
|                 |                                                             |              |             |                           | id japonés, nació del interior de un enorme melocotón que fl |                   |              |                  |
|                 |                                                             |              |             |                           | otaba río abajo.\r\nEn China se piensa que comer melocotón c |                   |              |                  |
|                 |                                                             |              |             |                           | onfiere longevidad al ser humano, ya que formaba parte de la |                   |              |                  |
|                 |                                                             |              |             |                           |  dieta de sus dioses inmortales.                             |                   |              |                  |
| FR-93           | Melocotonero                                                | Frutales     | 10/12       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color c | 50                | 22           | 17               |
|                 |                                                             |              |             |                           | eniciento. Sus hojas son alargadas con el margen ligeramente |                   |              |                  |
|                 |                                                             |              |             |                           |  aserrado, de color verde brillante, algo más claras por el  |                   |              |                  |
|                 |                                                             |              |             |                           | envés. El melocotonero está muy arraigado en la cultura asiá |                   |              |                  |
|                 |                                                             |              |             |                           | tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C |                   |              |                  |
|                 |                                                             |              |             |                           | id japonés, nació del interior de un enorme melocotón que fl |                   |              |                  |
|                 |                                                             |              |             |                           | otaba río abajo.\r\nEn China se piensa que comer melocotón c |                   |              |                  |
|                 |                                                             |              |             |                           | onfiere longevidad al ser humano, ya que formaba parte de la |                   |              |                  |
|                 |                                                             |              |             |                           |  dieta de sus dioses inmortales.                             |                   |              |                  |
| FR-95           | Melocotonero                                                | Frutales     | 14/16       | Melocotones de Cieza S.A. | Árbol caducifolio de porte bajo con corteza lisa, de color c | 50                | 49           | 39               |
|                 |                                                             |              |             |                           | eniciento. Sus hojas son alargadas con el margen ligeramente |                   |              |                  |
|                 |                                                             |              |             |                           |  aserrado, de color verde brillante, algo más claras por el  |                   |              |                  |
|                 |                                                             |              |             |                           | envés. El melocotonero está muy arraigado en la cultura asiá |                   |              |                  |
|                 |                                                             |              |             |                           | tica.\r\nEn Japón, el noble heroe Momotaro, una especie de C |                   |              |                  |
|                 |                                                             |              |             |                           | id japonés, nació del interior de un enorme melocotón que fl |                   |              |                  |
|                 |                                                             |              |             |                           | otaba río abajo.\r\nEn China se piensa que comer melocotón c |                   |              |                  |
|                 |                                                             |              |             |                           | onfiere longevidad al ser humano, ya que formaba parte de la |                   |              |                  |
|                 |                                                             |              |             |                           |  dieta de sus dioses inmortales.                             |                   |              |                  |
| FR-96           | Membrillero                                                 | Frutales     | 8/10        | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuo | 50                | 11           | 8                |
|                 |                                                             |              |             |                           | so y la corteza lisa, grisácea, que se desprende en escamas  |                   |              |                  |
|                 |                                                             |              |             |                           | con la edad. Copa irregular, con ramas inermes, flexuosas, p |                   |              |                  |
|                 |                                                             |              |             |                           | arduzcas, punteadas. Ramillas jóvenes tomentosas             |                   |              |                  |
| FR-97           | Membrillero                                                 | Frutales     | 10/12       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuo | 50                | 22           | 17               |
|                 |                                                             |              |             |                           | so y la corteza lisa, grisácea, que se desprende en escamas  |                   |              |                  |
|                 |                                                             |              |             |                           | con la edad. Copa irregular, con ramas inermes, flexuosas, p |                   |              |                  |
|                 |                                                             |              |             |                           | arduzcas, punteadas. Ramillas jóvenes tomentosas             |                   |              |                  |
| FR-98           | Membrillero                                                 | Frutales     | 12/14       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuo | 50                | 32           | 25               |
|                 |                                                             |              |             |                           | so y la corteza lisa, grisácea, que se desprende en escamas  |                   |              |                  |
|                 |                                                             |              |             |                           | con la edad. Copa irregular, con ramas inermes, flexuosas, p |                   |              |                  |
|                 |                                                             |              |             |                           | arduzcas, punteadas. Ramillas jóvenes tomentosas             |                   |              |                  |
| FR-99           | Membrillero                                                 | Frutales     | 14/16       | Frutales Talavera S.A     | arbolito caducifolio de 4-6 m de altura con el tronco tortuo | 50                | 49           | 39               |
|                 |                                                             |              |             |                           | so y la corteza lisa, grisácea, que se desprende en escamas  |                   |              |                  |
|                 |                                                             |              |             |                           | con la edad. Copa irregular, con ramas inermes, flexuosas, p |                   |              |                  |
|                 |                                                             |              |             |                           | arduzcas, punteadas. Ramillas jóvenes tomentosas             |                   |              |                  |
| OR-001          | Arbustos Mix Maceta                                         | Ornamentales | 40-60       | Valencia Garden Service   |                                                              | 25                | 5            | 4                |
| OR-100          | Mimosa Injerto CLASICA Dealbata                             | Ornamentales | 100-110     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, | 100               | 12           | 9                |
|                 |                                                             |              |             |                           |  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo |                   |              |                  |
|                 |                                                             |              |             |                           | saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori |                   |              |                  |
|                 |                                                             |              |             |                           | a). Arbol de follaje persistente muy usado en parques por su |                   |              |                  |
|                 |                                                             |              |             |                           |  atractiva floración amarilla hacia fines del invierno. Altu |                   |              |                  |
|                 |                                                             |              |             |                           | ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla |                   |              |                  |
|                 |                                                             |              |             |                           | je perenne de tonos plateados, muy ornamental. Sus hojas son |                   |              |                  |
|                 |                                                             |              |             |                           |  de textura fina, de color verde y sus flores amarillas que  |                   |              |                  |
|                 |                                                             |              |             |                           | aparecen en racimos grandes. Florece de Enero a Marzo (Hemis |                   |              |                  |
|                 |                                                             |              |             |                           | ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera |                   |              |                  |
|                 |                                                             |              |             |                           | mente curvada, con los bordes algo constreñidos entre las se |                   |              |                  |
|                 |                                                             |              |             |                           | millas, que se disponen en el fruto longitudinalmente...     |                   |              |                  |
| OR-103          | Mimosa Semilla Bayleyana                                    | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, | 100               | 10           | 8                |
|                 |                                                             |              |             |                           |  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo |                   |              |                  |
|                 |                                                             |              |             |                           | saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori |                   |              |                  |
|                 |                                                             |              |             |                           | a). Arbol de follaje persistente muy usado en parques por su |                   |              |                  |
|                 |                                                             |              |             |                           |  atractiva floración amarilla hacia fines del invierno. Altu |                   |              |                  |
|                 |                                                             |              |             |                           | ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla |                   |              |                  |
|                 |                                                             |              |             |                           | je perenne de tonos plateados, muy ornamental. Sus hojas son |                   |              |                  |
|                 |                                                             |              |             |                           |  de textura fina, de color verde y sus flores amarillas que  |                   |              |                  |
|                 |                                                             |              |             |                           | aparecen en racimos grandes. Florece de Enero a Marzo (Hemis |                   |              |                  |
|                 |                                                             |              |             |                           | ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera |                   |              |                  |
|                 |                                                             |              |             |                           | mente curvada, con los bordes algo constreñidos entre las se |                   |              |                  |
|                 |                                                             |              |             |                           | millas, que se disponen en el fruto longitudinalmente...     |                   |              |                  |
| OR-105          | Mimosa Semilla Espectabilis                                 | Ornamentales | 160-170     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, | 100               | 6            | 4                |
|                 |                                                             |              |             |                           |  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo |                   |              |                  |
|                 |                                                             |              |             |                           | saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori |                   |              |                  |
|                 |                                                             |              |             |                           | a). Arbol de follaje persistente muy usado en parques por su |                   |              |                  |
|                 |                                                             |              |             |                           |  atractiva floración amarilla hacia fines del invierno. Altu |                   |              |                  |
|                 |                                                             |              |             |                           | ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla |                   |              |                  |
|                 |                                                             |              |             |                           | je perenne de tonos plateados, muy ornamental. Sus hojas son |                   |              |                  |
|                 |                                                             |              |             |                           |  de textura fina, de color verde y sus flores amarillas que  |                   |              |                  |
|                 |                                                             |              |             |                           | aparecen en racimos grandes. Florece de Enero a Marzo (Hemis |                   |              |                  |
|                 |                                                             |              |             |                           | ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera |                   |              |                  |
|                 |                                                             |              |             |                           | mente curvada, con los bordes algo constreñidos entre las se |                   |              |                  |
|                 |                                                             |              |             |                           | millas, que se disponen en el fruto longitudinalmente...     |                   |              |                  |
| OR-106          | Mimosa Semilla Longifolia                                   | Ornamentales | 200-225     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, | 100               | 10           | 8                |
|                 |                                                             |              |             |                           |  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo |                   |              |                  |
|                 |                                                             |              |             |                           | saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori |                   |              |                  |
|                 |                                                             |              |             |                           | a). Arbol de follaje persistente muy usado en parques por su |                   |              |                  |
|                 |                                                             |              |             |                           |  atractiva floración amarilla hacia fines del invierno. Altu |                   |              |                  |
|                 |                                                             |              |             |                           | ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla |                   |              |                  |
|                 |                                                             |              |             |                           | je perenne de tonos plateados, muy ornamental. Sus hojas son |                   |              |                  |
|                 |                                                             |              |             |                           |  de textura fina, de color verde y sus flores amarillas que  |                   |              |                  |
|                 |                                                             |              |             |                           | aparecen en racimos grandes. Florece de Enero a Marzo (Hemis |                   |              |                  |
|                 |                                                             |              |             |                           | ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera |                   |              |                  |
|                 |                                                             |              |             |                           | mente curvada, con los bordes algo constreñidos entre las se |                   |              |                  |
|                 |                                                             |              |             |                           | millas, que se disponen en el fruto longitudinalmente...     |                   |              |                  |
| OR-107          | Mimosa Semilla Floribunda 4 estaciones                      | Ornamentales | 120-140     | Viveros EL OASIS          | Acacia dealbata. Nombre común o vulgar: Mimosa fina, Mimosa, | 100               | 6            | 4                |
|                 |                                                             |              |             |                           |  Mimosa común, Mimosa plateada, Aromo francés. Familia: Mimo |                   |              |                  |
|                 |                                                             |              |             |                           | saceae. Origen: Australia, Sureste, (N. G. del Sur y Victori |                   |              |                  |
|                 |                                                             |              |             |                           | a). Arbol de follaje persistente muy usado en parques por su |                   |              |                  |
|                 |                                                             |              |             |                           |  atractiva floración amarilla hacia fines del invierno. Altu |                   |              |                  |
|                 |                                                             |              |             |                           | ra: de 3 a 10 metros generalmente. Crecimiento rápido. Folla |                   |              |                  |
|                 |                                                             |              |             |                           | je perenne de tonos plateados, muy ornamental. Sus hojas son |                   |              |                  |
|                 |                                                             |              |             |                           |  de textura fina, de color verde y sus flores amarillas que  |                   |              |                  |
|                 |                                                             |              |             |                           | aparecen en racimos grandes. Florece de Enero a Marzo (Hemis |                   |              |                  |
|                 |                                                             |              |             |                           | ferio Norte). Legumbre de 5-9 cm de longitud, recta o ligera |                   |              |                  |
|                 |                                                             |              |             |                           | mente curvada, con los bordes algo constreñidos entre las se |                   |              |                  |
|                 |                                                             |              |             |                           | millas, que se disponen en el fruto longitudinalmente...     |                   |              |                  |
| OR-108          | Abelia Floribunda                                           | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 100               | 5            | 4                |
| OR-109          | Callistemom (Mix)                                           | Ornamentales | 35-45       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y | 100               | 5            | 4                |
|                 |                                                             |              |             |                           |  colgantes (de ahí lo de \"llorón\")..                       |                   |              |                  |
| OR-110          | Callistemom (Mix)                                           | Ornamentales | 40-60       | Viveros EL OASIS          | Limpitatubos. arbolito de 6-7 m de altura. Ramas flexibles y | 100               | 2            | 1                |
|                 |                                                             |              |             |                           |  colgantes (de ahí lo de \"llorón\")..                       |                   |              |                  |
| OR-111          | Corylus Avellana \"Contorta\"                               | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 100               | 5            | 4                |
| OR-112          | Escallonia (Mix)                                            | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-113          | Evonimus Emerald Gayeti                                     | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-114          | Evonimus Pulchellus                                         | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-117          | Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo                | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                                             |              |             |                           | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                                             |              |             |                           | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                                             |              |             |                           | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                                             |              |             |                           | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                                             |              |             |                           | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                                             |              |             |                           | .                                                            |                   |              |                  |
| OR-118          | Hibiscus Syriacus \"Pink Giant\" Rosa                       | Ornamentales | 35-45       | Viveros EL OASIS          | Por su capacidad de soportar podas, pueden ser fácilmente mo | 120               | 7            | 5                |
|                 |                                                             |              |             |                           | ldeadas como bonsái en el transcurso de pocos años. Flores d |                   |              |                  |
|                 |                                                             |              |             |                           | e muchos colores según la variedad, desde el blanco puro al  |                   |              |                  |
|                 |                                                             |              |             |                           | rojo intenso, del amarillo al anaranjado. La flor apenas dur |                   |              |                  |
|                 |                                                             |              |             |                           | a 1 día, pero continuamente aparecen nuevas y la floración s |                   |              |                  |
|                 |                                                             |              |             |                           | e prolonga durante todo el periodo de crecimiento vegetativo |                   |              |                  |
|                 |                                                             |              |             |                           | .                                                            |                   |              |                  |
| OR-121          | Lonicera Nitida \"Maigrum\"                                 | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-124          | Prunus pisardii                                             | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-126          | Weigelia \"Bristol Ruby\"                                   | Ornamentales | 35-45       | Viveros EL OASIS          |                                                              | 120               | 5            | 4                |
| OR-131          | Leptospermum formado PIRAMIDE                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                              | 50                | 18           | 14               |
| OR-132          | Leptospermum COPA                                           | Ornamentales | 110/120     | Viveros EL OASIS          |                                                              | 50                | 18           | 14               |
| OR-133          | Nerium oleander-CALIDAD \"GARDEN\"                          | Ornamentales | 40-45       | Viveros EL OASIS          |                                                              | 50                | 2            | 1                |
| OR-134          | Nerium Oleander Arbusto GRANDE                              | Ornamentales | 160-200     | Viveros EL OASIS          |                                                              | 100               | 38           | 30               |
| OR-135          | Nerium oleander COPA  Calibre 6/8                           | Ornamentales | 50-60       | Viveros EL OASIS          |                                                              | 100               | 5            | 4                |
| OR-137          | ROSAL TREPADOR                                              | Ornamentales |             | Viveros EL OASIS          |                                                              | 100               | 4            | 3                |
| OR-138          | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Ornamentales |             | Viveros EL OASIS          |                                                              | 100               | 4            | 3                |
| OR-142          | Solanum Jazminoide                                          | Ornamentales | 150-160     | Viveros EL OASIS          |                                                              | 100               | 2            | 1                |
| OR-143          | Wisteria Sinensis  azul, rosa, blanca                       | Ornamentales |             | Viveros EL OASIS          |                                                              | 100               | 9            | 7                |
| OR-144          | Wisteria Sinensis INJERTADAS DECÃ“                          | Ornamentales | 140-150     | Viveros EL OASIS          |                                                              | 100               | 12           | 9                |
| OR-145          | Bougamvillea Sanderiana Tutor                               | Ornamentales | 80-100      | Viveros EL OASIS          |                                                              | 100               | 2            | 1                |
| OR-148          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 45-50       | Viveros EL OASIS          |                                                              | 100               | 7            | 5                |
| OR-149          | Bougamvillea Sanderiana Espaldera                           | Ornamentales | 140-150     | Viveros EL OASIS          |                                                              | 100               | 17           | 13               |
| OR-151          | Bougamvillea Sanderiana, 3 tut. piramide                    | Ornamentales |             | Viveros EL OASIS          |                                                              | 100               | 6            | 4                |
| OR-153          | Expositor Árboles clima mediterráneo                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 100               | 6            | 4                |
| OR-154          | Expositor Árboles borde del mar                             | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 100               | 6            | 4                |
| OR-158          | Brachychiton Acerifolius                                    | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 100               | 6            | 4                |
| OR-161          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 100               | 6            | 4                |
| OR-162          | Cassia Corimbosa                                            | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 100               | 10           | 8                |
| OR-163          | Chitalpa Summer Bells                                       | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 10           | 8                |
| OR-164          | Erytrina Kafra                                              | Ornamentales | 170-180     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-166          | Eucalyptus Citriodora                                       | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-167          | Eucalyptus Ficifolia                                        | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-169          | Hibiscus Syriacus  Var. Injertadas 1 Tallo                  | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 12           | 9                |
| OR-170          | Lagunaria Patersonii                                        | Ornamentales | 140-150     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-171          | Lagunaria Patersonii                                        | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 10           | 8                |
| OR-173          | Morus Alba                                                  | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-175          | Platanus Acerifolia                                         | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 10           | 8                |
| OR-178          | Salix Babylonica  Pendula                                   | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-180          | Tamarix  Ramosissima Pink Cascade                           | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-182          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-183          | Tecoma Stands                                               | Ornamentales | 200-225     | Viveros EL OASIS          |                                                              | 80                | 10           | 8                |
| OR-184          | Tipuana Tipu                                                | Ornamentales | 170-200     | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-185          | Pleioblastus distichus-Bambú enano                          | Ornamentales | 15-20       | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-187          | Sasa palmata                                                | Ornamentales | 40-45       | Viveros EL OASIS          |                                                              | 80                | 10           | 8                |
| OR-189          | Phylostachys aurea                                          | Ornamentales | 180-200     | Viveros EL OASIS          |                                                              | 80                | 22           | 17               |
| OR-190          | Phylostachys aurea                                          | Ornamentales | 250-300     | Viveros EL OASIS          |                                                              | 80                | 32           | 25               |
| OR-191          | Phylostachys Bambusa Spectabilis                            | Ornamentales | 180-200     | Viveros EL OASIS          |                                                              | 80                | 24           | 19               |
| OR-192          | Phylostachys biseti                                         | Ornamentales | 160-170     | Viveros EL OASIS          |                                                              | 80                | 22           | 17               |
| OR-194          | Pseudosasa japonica (Metake)                                | Ornamentales | 225-250     | Viveros EL OASIS          |                                                              | 80                | 20           | 16               |
| OR-195          | Pseudosasa japonica (Metake)                                | Ornamentales | 30-40       | Viveros EL OASIS          |                                                              | 80                | 6            | 4                |
| OR-197          | Cedrus Deodara \"Feeling Blue\" Novedad                     | Ornamentales | rastrero    | Viveros EL OASIS          |                                                              | 80                | 12           | 9                |
| OR-198          | Juniperus chinensis \"Blue Alps\"                           | Ornamentales | 20-30       | Viveros EL OASIS          |                                                              | 80                | 4            | 3                |
| OR-199          | Juniperus Chinensis Stricta                                 | Ornamentales | 20-30       | Viveros EL OASIS          |                                                              | 80                | 4            | 3                |
| OR-201          | Juniperus squamata \"Blue Star\"                            | Ornamentales | 20-30       | Viveros EL OASIS          |                                                              | 80                | 4            | 3                |
| OR-202          | Juniperus x media Phitzeriana verde                         | Ornamentales | 20-30       | Viveros EL OASIS          |                                                              | 80                | 4            | 3                |
| OR-212          | Bismarckia Nobilis                                          | Ornamentales | 200 - 220   | Viveros EL OASIS          |                                                              | 4                 | 217          | 173              |
| OR-215          | Brahea Armata                                               | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                              | 100               | 112          | 89               |
| OR-216          | Brahea Edulis                                               | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                              | 100               | 19           | 15               |
| OR-219          | Butia Capitata                                              | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                              | 100               | 29           | 23               |
| OR-220          | Butia Capitata                                              | Ornamentales | 90 - 120    | Viveros EL OASIS          |                                                              | 100               | 36           | 28               |
| OR-221          | Butia Capitata                                              | Ornamentales | 85 - 105    | Viveros EL OASIS          |                                                              | 100               | 59           | 47               |
| OR-223          | Chamaerops Humilis                                          | Ornamentales | 40 - 45     | Viveros EL OASIS          |                                                              | 100               | 4            | 3                |
| OR-224          | Chamaerops Humilis                                          | Ornamentales | 50 - 60     | Viveros EL OASIS          |                                                              | 100               | 7            | 5                |
| OR-228          | Chamaerops Humilis \"Cerifera\"                             | Ornamentales | 70 - 80     | Viveros EL OASIS          |                                                              | 100               | 32           | 25               |
| OR-229          | Chrysalidocarpus Lutescens -ARECA                           | Ornamentales | 130 - 150   | Viveros EL OASIS          |                                                              | 100               | 22           | 17               |
| OR-230          | Cordyline Australis -DRACAENA                               | Ornamentales | 190 - 210   | Viveros EL OASIS          |                                                              | 100               | 38           | 30               |
| OR-231          | Cycas Revoluta                                              | Ornamentales | 55 - 65     | Viveros EL OASIS          |                                                              | 100               | 15           | 12               |
| OR-232          | Cycas Revoluta                                              | Ornamentales | 80 - 90     | Viveros EL OASIS          |                                                              | 100               | 34           | 27               |
| OR-233          | Dracaena Drago                                              | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                              | 1                 | 13           | 10               |
| OR-235          | Dracaena Drago                                              | Ornamentales | 150 - 175   | Viveros EL OASIS          |                                                              | 2                 | 92           | 73               |
| OR-238          | Livistonia Decipiens                                        | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                              | 50                | 19           | 15               |
| OR-239          | Livistonia Decipiens                                        | Ornamentales | 180 - 200   | Viveros EL OASIS          |                                                              | 50                | 49           | 39               |
| OR-242          | Rhaphis Excelsa                                             | Ornamentales | 80 - 100    | Viveros EL OASIS          |                                                              | 50                | 21           | 16               |
| OR-244          | Sabal Minor                                                 | Ornamentales | 60 - 75     | Viveros EL OASIS          |                                                              | 50                | 11           | 8                |
| OR-245          | Sabal Minor                                                 | Ornamentales | 120 - 140   | Viveros EL OASIS          |                                                              | 50                | 34           | 27               |
| OR-246          | Trachycarpus Fortunei                                       | Ornamentales | 90 - 105    | Viveros EL OASIS          |                                                              | 50                | 18           | 14               |
| OR-248          | Washingtonia Robusta                                        | Ornamentales | 60 - 70     | Viveros EL OASIS          |                                                              | 15                | 3            | 2                |
| OR-251          | Zamia Furfuracaea                                           | Ornamentales | 90 - 110    | Viveros EL OASIS          |                                                              | 15                | 168          | 134              |

- Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
```sql
select distinct p.codigo_producto, p.nombre from producto as p join detalle_pedido as d on p.codigo_producto = d.codigo_producto;
```
| codigo_producto |                           nombre                            |
|-----------------|-------------------------------------------------------------|
| FR-67           | Cerezo                                                      |
| OR-127          | Camelia japonica                                            |
| OR-141          | Pitimini rojo                                               |
| OR-241          | Phoenix Canariensis                                         |
| OR-99           | Mimosa DEALBATA Gaulois Astier                              |
| FR-4            | Naranjo calibre 8/10                                        |
| FR-40           | Manzano Starking Delicious                                  |
| OR-140          | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
| OR-159          | Brachychiton Discolor                                       |
| OR-227          | Chamaerops Humilis                                          |
| OR-247          | Trachycarpus Fortunei                                       |
| FR-48           | Nogal Común                                                 |
| OR-122          | Lonicera Pileata                                            |
| OR-123          | Philadelphus \"Virginal\"                                   |
| OR-213          | Bismarckia Nobilis                                          |
| OR-217          | Brahea Edulis                                               |
| OR-218          | Butia Capitata                                              |
| FR-31           | Ciruelo Santa Rosa                                          |
| FR-34           | Ciruelo Reina C. De Ollins                                  |
| OR-152          | Expositor Árboles clima continental                         |
| OR-155          | Acer Negundo                                                |
| OR-156          | Acer platanoides                                            |
| OR-157          | Acer Pseudoplatanus                                         |
| OR-222          | Butia Capitata                                              |
| FR-106          | Peral                                                       |
| FR-108          | Peral                                                       |
| FR-11           | Limonero 30/40                                              |
| AR-001          | Ajedrea                                                     |
| AR-008          | Thymus Citriodra (Tomillo limón)                            |
| FR-69           | Cerezo                                                      |
| FR-82           | Higuera                                                     |
| FR-91           | Níspero                                                     |
| OR-234          | Dracaena Drago                                              |
| AR-006          | Petrosilium Hortense (Peregil)                              |
| AR-009          | Thymus Vulgaris                                             |
| 11679           | Sierra de Poda 400MM                                        |
| 21636           | Pala                                                        |
| FR-100          | Nectarina                                                   |
| FR-13           | Kunquat  EXTRA con FRUTA                                    |
| FR-84           | Kaki                                                        |
| OR-101          | Expositor Mimosa Semilla Mix                                |
| OR-203          | Pinus Canariensis                                           |
| 30310           | Azadón                                                      |
| FR-36           | Granado Mollar de Elche                                     |
| 22225           | Rastrillo de Jardín                                         |
| FR-37           | Higuera Napolitana                                          |
| FR-64           | Cerezo                                                      |
| OR-136          | Nerium oleander ARBOL Calibre 8/10                          |
| FR-22           | Pitimini rojo                                               |
| FR-23           | Rosal copa                                                  |
| FR-75           | Granado                                                     |
| OR-208          | Tuja orientalis \"Aurea nana\"                              |
| FR-18           | ROSAL TREPADOR                                              |
| FR-53           | Peral Blanq. de Aranjuez                                    |
| OR-240          | Phoenix Canariensis                                         |
| AR-002          | Lavándula Dentata                                           |
| FR-107          | Peral                                                       |
| FR-85           | Kaki                                                        |
| OR-249          | Washingtonia Robusta                                        |
| FR-1            | Expositor Cítricos Mix                                      |
| FR-77           | Granado                                                     |
| FR-9            | Limonero calibre 8/10                                       |
| FR-94           | Melocotonero                                                |
| FR-15           | Calamondin Copa                                             |
| OR-188          | Sasa palmata                                                |
| OR-102          | Mimosa Semilla Bayleyana                                    |
| OR-186          | Sasa palmata                                                |
| OR-129          | Camelia japonica ejemplar                                   |
| OR-160          | Brachychiton Rupestris                                      |
| AR-004          | Melissa                                                     |
| FR-12           | Kunquat                                                     |
| FR-72           | Ciruelo                                                     |
| FR-89           | Manzano                                                     |
| OR-120          | Lonicera Nitida                                             |
| FR-102          | Olea-Olivos                                                 |
| OR-128          | Camelia japonica ejemplar                                   |
| OR-193          | Phylostachys biseti                                         |
| FR-17           | Rosal bajo 1Âª -En maceta-inicio brotación                  |
| FR-29           | Cerezo Napoleón                                             |
| OR-214          | Brahea Armata                                               |
| FR-3            | Naranjo 2 años injerto                                      |
| FR-7            | Mandarino calibre 8/10                                      |
| OR-172          | Lagunaria patersonii  calibre 8/10                          |
| OR-174          | Morus Alba  calibre 8/10                                    |
| FR-47           | Melocotonero Paraguayo                                      |
| OR-165          | Erytrina Kafra                                              |
| OR-181          | Tamarix  Ramosissima Pink Cascade                           |
| OR-225          | Chamaerops Humilis                                          |
| OR-147          | Bougamvillea Sanderiana Tutor                               |
| FR-105          | Olea-Olivos                                                 |
| FR-57           | Kaki Rojo Brillante                                         |
| OR-176          | Prunus pisardii                                             |
| AR-003          | Mejorana                                                    |
| AR-005          | Mentha Sativa                                               |
| AR-007          | Salvia Mix                                                  |
| AR-010          | Santolina Chamaecyparys                                     |
| FR-10           | Limonero 2 años injerto                                     |
| FR-101          | Nogal                                                       |
| FR-103          | Olea-Olivos                                                 |
| OR-236          | Jubaea Chilensis                                            |
| OR-237          | Livistonia Australis                                        |
| OR-204          | Pinus Halepensis                                            |
| OR-205          | Pinus Pinea -Pino Piñonero                                  |
| OR-206          | Thuja Esmeralda                                             |
| OR-226          | Chamaerops Humilis                                          |
| OR-209          | Archontophoenix Cunninghamiana                              |
| OR-210          | Beucarnea Recurvata                                         |
| OR-211          | Beucarnea Recurvata                                         |
| FR-2            | Naranjo -Plantón joven 1 año injerto                        |
| FR-86           | Manzano                                                     |
| OR-116          | Hibiscus Syriacus  \"Diana\" -Blanco Puro                   |
| FR-79           | Higuera                                                     |
| OR-168          | Eucalyptus Ficifolia                                        |
| OR-115          | Forsytia Intermedia \"Lynwood\"                             |
| OR-243          | Rhaphis Humilis                                             |
| OR-130          | Callistemom COPA                                            |
| OR-179          | Sesbania Punicea                                            |
| OR-196          | Cedrus Deodara                                              |
| OR-207          | Tuja Occidentalis Woodwardii                                |
| OR-250          | Yucca Jewel                                                 |
| FR-81           | Higuera                                                     |
| OR-139          | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
| OR-177          | Robinia Pseudoacacia Casque Rouge                           |
| FR-87           | Manzano                                                     |
| FR-42           | Manzano Golden Delicious                                    |
| FR-66           | Cerezo                                                      |
| FR-54           | Níspero Tanaca                                              |
| FR-58           | Albaricoquero                                               |
| FR-60           | Albaricoquero                                               |
| FR-43           | Membrillero Gigante de Wranja                               |
| FR-6            | Mandarino 2 años injerto                                    |
| FR-71           | Ciruelo                                                     |
| FR-90           | Níspero                                                     |
| FR-41           | Manzano Reineta                                             |
| FR-33           | Ciruelo Friar                                               |
| FR-56           | Nectarina                                                   |
| FR-8            | Limonero -Plantón joven                                     |
| FR-45           | Melocotonero Amarillo de Agosto                             |
| OR-104          | Mimosa Semilla Cyanophylla                                  |
| OR-119          | Laurus Nobilis Arbusto - Ramificado Bajo                    |
| OR-125          | Viburnum Tinus \"Eve Price\"                                |
| FR-16           | Calamondin Copa EXTRA Con FRUTA                             |
| OR-200          | Juniperus horizontalis Wiltonii                             |
| FR-78           | Higuera                                                     |
| FR-80           | Higuera                                                     |
| OR-146          | Bougamvillea Sanderiana Tutor                               |
| OR-150          | Bougamvillea roja, naranja                                  |

### Consultas variadas en SQL

- Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
```sql
select c.nombre_cliente, count(p.codigo_cliente) as pedidos_realizados from cliente as c join pedido as p on c.codigo_cliente = p.codigo_cliente group by c.codigo_cliente;
```
|         nombre_cliente         | pedidos_realizados |
|--------------------------------|--------------------|
| GoldFish Garden                | 11                 |
| Gardening Associates           | 9                  |
| Gerudo Valley                  | 5                  |
| Tendo Garden                   | 5                  |
| Beragua                        | 5                  |
| Naturagua                      | 5                  |
| Camunas Jardines S.L.          | 5                  |
| Dardena S.A.                   | 5                  |
| Jardin de Flores               | 5                  |
| Flores Marivi                  | 10                 |
| Golf S.A.                      | 5                  |
| Sotogrande                     | 5                  |
| Jardines y Mansiones Cactus SL | 5                  |
| Jardinerías Matías SL          | 5                  |
| Agrojardin                     | 5                  |
| Jardineria Sara                | 10                 |
| Tutifruti S.A                  | 5                  |
| Flores S.L.                    | 5                  |
| El Jardin Viviente S.L         | 5                  |

- Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
```sql
select c.nombre_cliente, sum(d.cantidad * d.precio_unidad) as total_pagado from cliente as c join pedido as p on c.codigo_cliente = p.codigo_cliente join detalle_pedido as d on p.codigo_pedido = d.codigo_pedido group by c.codigo_cliente;
```
|         nombre_cliente         | total_pagado |
|--------------------------------|--------------|
| GoldFish Garden                | 10365        |
| Gardening Associates           | 13726        |
| Gerudo Valley                  | 81849        |
| Tendo Garden                   | 23794        |
| Beragua                        | 2390         |
| Naturagua                      | 929          |
| Camunas Jardines S.L.          | 2246         |
| Dardena S.A.                   | 4160         |
| Jardin de Flores               | 12081        |
| Flores Marivi                  | 7899         |
| Golf S.A.                      | 232          |
| Sotogrande                     | 272          |
| Jardines y Mansiones Cactus SL | 18979        |
| Jardinerías Matías SL          | 10972        |
| Agrojardin                     | 8489         |
| Jardineria Sara                | 11363        |
| Tutifruti S.A                  | 3321         |
| Flores S.L.                    | 3500         |
| El Jardin Viviente S.L         | 1171         |

- Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
```sql
select nombre_cliente from cliente where codigo_cliente in (select codigo_cliente from pedido where fecha_pedido regexp '2008') order by nombre_cliente;
```
|         nombre_cliente         |
|--------------------------------|
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| El Jardin Viviente S.L         |
| Flores Marivi                  |
| Flores S.L.                    |
| Gerudo Valley                  |
| GoldFish Garden                |
| Jardin de Flores               |
| Jardines y Mansiones Cactus SL |
| Tendo Garden                   |
| Tutifruti S.A                  |

- Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
```sql
select c.nombre_cliente, e.nombre as nombre_empleado, e.apellido1 as apellido_empleado, o.telefono as telefono_oficina from cliente as c join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado join oficina as o on e.codigo_oficina = o.codigo_oficina where codigo_cliente not in (select codigo_cliente from pago);
```
|       nombre_cliente        | nombre_empleado | apellido_empleado | telefono_oficina |
|-----------------------------|-----------------|-------------------|------------------|
| Lasas S.A.                  | Mariano         | López             | +34 91 7514487   |
| Club Golf Puerta del hierro | Emmanuel        | Magaña            | +34 93 3561182   |
| DaraDistribuciones          | Emmanuel        | Magaña            | +34 93 3561182   |
| Madrileña de riegos         | Emmanuel        | Magaña            | +34 93 3561182   |
| Lasas S.A.                  | Mariano         | López             | +34 91 7514487   |
| Flowers, S.A                | Felipe          | Rosas             | +34 925 867231   |
| Naturajardin                | Julian          | Bellinelli        | +61 2 9264 2451  |
| Americh Golf Management SL  | José Manuel     | Martinez          | +34 93 3561182   |
| Aloha                       | José Manuel     | Martinez          | +34 93 3561182   |
| El Prat                     | José Manuel     | Martinez          | +34 93 3561182   |
| Vivero Humanes              | Julian          | Bellinelli        | +61 2 9264 2451  |
| Fuenla City                 | Felipe          | Rosas             | +34 925 867231   |
| Top Campo                   | Felipe          | Rosas             | +34 925 867231   |
| Campohermoso                | Julian          | Bellinelli        | +61 2 9264 2451  |
| france telecom              | Lionel          | Narvaez           | +33 14 723 4404  |
| Musée du Louvre             | Lionel          | Narvaez           | +33 14 723 4404  |
| Flores S.L.                 | Michael         | Bolton            | +1 650 219 4782  |
| The Magic Garden            | Michael         | Bolton            | +1 650 219 4782  |

- Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
```sql
select c.nombre_cliente, e.nombre as nombre_empleado, e.apellido1 as apellido_empleado, o.ciudad as ciudad_oficina from cliente as c join empleado as e on c.codigo_empleado_rep_ventas = e.codigo_empleado join oficina as o on e.codigo_oficina = o.codigo_oficina;
```
|         nombre_cliente         | nombre_empleado | apellido_empleado |    ciudad_oficina    |
|--------------------------------|-----------------|-------------------|----------------------|
| GoldFish Garden                | Walter Santiago | Sanchez           | San Francisco        |
| Gardening Associates           | Walter Santiago | Sanchez           | San Francisco        |
| Gerudo Valley                  | Lorena          | Paxton            | Boston               |
| Tendo Garden                   | Lorena          | Paxton            | Boston               |
| Lasas S.A.                     | Mariano         | López             | Madrid               |
| Beragua                        | Emmanuel        | Magaña            | Barcelona            |
| Club Golf Puerta del hierro    | Emmanuel        | Magaña            | Barcelona            |
| Naturagua                      | Emmanuel        | Magaña            | Barcelona            |
| DaraDistribuciones             | Emmanuel        | Magaña            | Barcelona            |
| Madrileña de riegos            | Emmanuel        | Magaña            | Barcelona            |
| Lasas S.A.                     | Mariano         | López             | Madrid               |
| Camunas Jardines S.L.          | Mariano         | López             | Madrid               |
| Dardena S.A.                   | Mariano         | López             | Madrid               |
| Jardin de Flores               | Julian          | Bellinelli        | Sydney               |
| Flores Marivi                  | Felipe          | Rosas             | Talavera de la Reina |
| Flowers, S.A                   | Felipe          | Rosas             | Talavera de la Reina |
| Naturajardin                   | Julian          | Bellinelli        | Sydney               |
| Golf S.A.                      | José Manuel     | Martinez          | Barcelona            |
| Americh Golf Management SL     | José Manuel     | Martinez          | Barcelona            |
| Aloha                          | José Manuel     | Martinez          | Barcelona            |
| El Prat                        | José Manuel     | Martinez          | Barcelona            |
| Sotogrande                     | José Manuel     | Martinez          | Barcelona            |
| Vivero Humanes                 | Julian          | Bellinelli        | Sydney               |
| Fuenla City                    | Felipe          | Rosas             | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio           | Campoamor         | Madrid               |
| Jardinerías Matías SL          | Lucio           | Campoamor         | Madrid               |
| Agrojardin                     | Julian          | Bellinelli        | Sydney               |
| Top Campo                      | Felipe          | Rosas             | Talavera de la Reina |
| Jardineria Sara                | Felipe          | Rosas             | Talavera de la Reina |
| Campohermoso                   | Julian          | Bellinelli        | Sydney               |
| france telecom                 | Lionel          | Narvaez           | Paris                |
| Musée du Louvre                | Lionel          | Narvaez           | Paris                |
| Tutifruti S.A                  | Mariko          | Kishi             | Sydney               |
| Flores S.L.                    | Michael         | Bolton            | San Francisco        |
| The Magic Garden               | Michael         | Bolton            | San Francisco        |
| El Jardin Viviente S.L         | Mariko          | Kishi             | Sydney               |

- Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
select e.nombre, e.apellido1 || ' ' || e.apellido2 as apellidos, e.puesto, o.telefono as telefono_oficina from empleado as e join oficina as o on e.codigo_oficina = o.codigo_oficina where e.codigo_empleado not in (select codigo_empleado_rep_ventas from cliente);
```
|   nombre    |     apellidos     |        puesto         | telefono_oficina |
|-------------|-------------------|-----------------------|------------------|
| Marcos      | Magaña Perez      | Director General      | +34 925 867231   |
| Ruben       | López Martinez    | Subdirector Marketing | +34 925 867231   |
| Alberto     | Soria Carrasco    | Subdirector Ventas    | +34 925 867231   |
| Maria       | Solís Jerez       | Secretaria            | +34 925 867231   |
| Juan Carlos | Ortiz Serrano     | Representante Ventas  | +34 925 867231   |
| Carlos      | Soria Jimenez     | Director Oficina      | +34 91 7514487   |
| Hilario     | Rodriguez Huertas | Representante Ventas  | +34 91 7514487   |
| David       | Palma Aceituno    | Representante Ventas  | +34 93 3561182   |
| Oscar       | Palma Aceituno    | Representante Ventas  | +34 93 3561182   |
| Francois    | Fignon            | Director Oficina      | +33 14 723 4404  |
| Laurent     | Serra             | Representante Ventas  | +33 14 723 4404  |
| Hilary      | Washington        | Director Oficina      | +1 215 837 0825  |
| Marcus      | Paxton            | Representante Ventas  | +1 215 837 0825  |
| Nei         | Nishikori         | Director Oficina      | +81 33 224 5000  |
| Narumi      | Riko              | Representante Ventas  | +81 33 224 5000  |
| Takuma      | Nomura            | Representante Ventas  | +81 33 224 5000  |
| Amy         | Johnson           | Director Oficina      | +44 20 78772041  |
| Larry       | Westfalls         | Representante Ventas  | +44 20 78772041  |
| John        | Walton            | Representante Ventas  | +44 20 78772041  |
| Kevin       | Fallmer           | Director Oficina      | +61 2 9264 2451  |

- Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
```sql
select o.ciudad, count(e.codigo_empleado) as empleados from oficina as o join empleado as e on o.codigo_oficina = e.codigo_oficina group by o.ciudad;
```
|        ciudad        | empleados |
|----------------------|-----------|
| Barcelona            | 4         |
| Boston               | 3         |
| Londres              | 3         |
| Madrid               | 4         |
| Paris                | 3         |
| San Francisco        | 2         |
| Sydney               | 3         |
| Talavera de la Reina | 6         |
| Tokyo                | 3         |
