(: Muestra los bailes de la sala 1, su precio sea superior a 35 y pagado en euros :)

for $baile in doc("bailes.xml") //bailes/baile
where $baile/sala/text()="1"
  and $baile/number(precio)>35
  and $baile/precio/@moneda="Euro"
return $baile