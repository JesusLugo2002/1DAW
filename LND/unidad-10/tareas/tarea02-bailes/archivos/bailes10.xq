(: Sumar el total de dinero por clase (precio x plazas) :)

for $baile in doc("bailes.xml") //bailes/baile
return 
<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <total_ganado>{$baile/number(precio) * $baile/number(plazas)}</total_ganado>
</baile>