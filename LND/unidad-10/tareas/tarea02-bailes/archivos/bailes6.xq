(: Muestra todos los bailes cuyo profesor tenga de apellido 'Lozano' :)

for $baile in doc ("bailes.xml") //bailes/baile
where contains($baile/profesor/text(), "Lozano")
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>