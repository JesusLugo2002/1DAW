(: Muestra los bailes donde los profesores cobran una cuota mensual :)

for $baile in doc("bailes.xml") //bailes/baile
where $baile/precio/@cuota = "Mensual"
return $baile