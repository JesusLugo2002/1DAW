for $baile in doc ("bailes.xml") //bailes/baile
return

<baile>
  <nombre>{$baile/nombre/text()}</nombre>
  <precio>{$baile/precio/text()}</precio>
</baile>