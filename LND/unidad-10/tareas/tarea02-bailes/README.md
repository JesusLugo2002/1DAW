# Ejercicios de Xquery de Bailes.xml

A continuación los ejercicios realizados con xquery sobre el fichero de [bailes.xml](bailes.xml).

### 1. Retornar todos los bailes del fichero.

```xq
for $baile in doc ("bailes.xml") //bailes/baile/nombre/text()
return $bailes
```

### 2. Retornar solo el nombre y precio de los bailes.

```xq
for $baile in doc ("bailes.xml") //bailes/baile
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 3. Retornar los bailes con un precio superior a 40.

```xq
for $baile in doc ("bailes.xml") //bailes/baile
where $baile/number(precio)>40
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 4. Retornar los bailes ordenados por el nombre.

```xq
for $baile in doc ("bailes.xml") //bailes/baile
order by $baile/nombre/text()
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 5. Retornar los bailes cuyo nombre contenga una 'a'.

```xq
for $baile in doc ("bailes.xml") //bailes/baile
where contains($baile/nombre, "a")
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 6. Retornar los bailes cuyo profesor tenga como apellido 'Lozano'.

```xq
for $baile in doc ("bailes.xml") //bailes/baile
where contains($baile/profesor/text(), "Lozano")
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>
```

### 7. Retornar todos los bailes excepto el 3 y el 5.

```xq
for $baile in doc("bailes.xml") //bailes/baile
where $baile/@id != "3" and $baile/@id != "1"
return $baile
```

### 8. Retornar todos los bailes cuyos profesores cobra una cuota mensual.

```xq
for $baile in doc("bailes.xml") //bailes/baile
where $baile/precio/@cuota = "Mensual"
return $baile
```

### 9. Retornar los bailes de la sala 1, cuyo precio sea superior a 35 y sea pagado en euros.

```xq
for $baile in doc("bailes.xml") //bailes/baile
where $baile/sala/text()="1"
  and $baile/number(precio)>35
  and $baile/precio/@moneda="Euro"
return $baile
```

### 10. Retornar los bailes junto al total ganado de dinero (precio * plazas).

```xq
for $baile in doc("bailes.xml") //bailes/baile
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <total_ganado>{$baile/number(precio) * $baile/number(plazas)}</total_ganado>
</baile>
```

### 11. Retornar los bailes con un precio superior a 40, en formato HTML.

#### Formato XQuery

```xq
<html>
  <head><title>Bailes con precio superior a 40</title></head>
  <body>
    <table border="1">
      <tr><th>Nombre</th><th>Precio</th></tr>
{
for $baile in doc ("bailes.xml") //bailes/baile
where $baile/number(precio)>40
return <tr><td>{$baile/nombre}</td><td>{$baile/precio}</td></tr>
} 
    </table>
  </body>
</html>
```

#### Formato HTML

```html
<html>
  <head>
    <title>Bailes con precio superior a 40</title>
  </head>
  <body>
    <table border="1">
      <tr>
        <th>Nombre</th>
        <th>Precio</th>
      </tr>
      <tr>
        <td>
          <nombre>Tango</nombre>
        </td>
        <td>
          <precio moneda="Euro" cuota="Trimestral">75</precio>
        </td>
      </tr>
      <tr>
        <td>
          <nombre>Merengue</nombre>
        </td>
        <td>
          <precio moneda="Euro" cuota="Mensual">100</precio>
        </td>
      </tr>
    </table>
  </body>
</html>
```