(: Muestra los bailes excepto el 3 y el 5 :)

for $baile in doc("bailes.xml") //bailes/baile
where $baile/@id != "3" and $baile/@id != "1"
return $baile