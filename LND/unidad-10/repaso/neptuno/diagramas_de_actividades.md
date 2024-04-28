# Diagramas de actividades

## Tabla Artículos

### Columnas
- __RefArtículo__
- __RefProveedor__
- __RefPedido__
- __Nombre de artículo__
- __Nombre de categoría__
- __Precio por unidad__
- __Unidades en existencia__

## Tabla Clientes

### Columnas
- __RefCliente__
- __RefPedido__
- __Nombre de cliente__
- __Dirección de cliente__
- __Código postal de cliente__
- __País de cliente__
- __Teléfono de cliente__

## Tabla Proveedores

### Columnas
- __RefProveedor__
- __Nombre de proveedor__
- __País de proveedor__

## Consultas

1. Referencia de artículo - referencia de proveedor - nombre de todos los artículos.
2. Referencia de cliente - Nombre de cliente - Referencia de artículo - que han pedido algún artículo de bebidas
3. Referencia de artículo - nombre de artículo - referencia de proveedor - nombre de proveedor - todos los artículos de bebidas.
4. Nombre de cliente - nombre de artículo - nombre de proveedor; de los artículos cuyo nombre de categoría es Bebidas.