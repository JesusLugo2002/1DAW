(: Muestra todos los bailes ordenados por nombre :)

for $baile in doc ("bailes.xml") //bailes/baile
order by $baile/nombre/text()
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>