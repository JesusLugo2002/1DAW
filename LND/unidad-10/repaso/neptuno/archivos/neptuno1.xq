for $prov in doc("../neptuno.xml") //proveedores
where $prov/PaisProveedor="Francia"
return

<resultado>{$prov/*}</resultado>