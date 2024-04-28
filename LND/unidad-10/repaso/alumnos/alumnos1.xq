<repetidores>
{
for $alumno in doc("alumnos.xml") /instituto/curso/alumno
where $alumno/repetidor/text() = "True"
return <apellidos>{$alumno/apellidos/text()}</apellidos>
}
</repetidores>