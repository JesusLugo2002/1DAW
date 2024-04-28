<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/> <!-- elemento de primer nivel -->
<!-- plantilla para procesar el nodo raíz (/) -->
<xsl:template match="/">
<!-- Todo lo que no lleve el prefijo xsl será copiado en la salida-->
<html>
<head>
<title>Alumnos del instituto</title>
</head>
<body>
<h1>LISTA DE ALUMNOS:</h1>
<ul>
<!-- Todo lo que tenga el prefijo xsl serán reglas para transformar el
documento xml de entrada mediante plantillas-->
<xsl:apply-templates select="/instituto/curso/alumno[apellidos[contains(text(), 'Pérez')]]"/>
<!-- indicamos que se apliquen las plantillas a los nodos curso y
descendientes-->
</ul>
</body>
</html>
</xsl:template> <!-- fin de la primera plantilla -->
<xsl:template match="alumno"><!-- En esta plantilla transformamos la
etiqueta alumno (está dentro de curso)-->
<li><!-- cada alumno lo convertimos en un elemento de lista-->
Nombre: <b>
<xsl:value-of select="./nombre"/><!-- salida del texto que está
dentro de nombre en negrita-->
</b>
<br/>Curso: <xsl:value-of select="../@nombre"/>
<!-- salida del texto que está dentro de apellidos-->
<br/>Apellidos: <xsl:value-of select="./apellidos"/>
<!-- salida del atributo cial-->
<br/>CIAL: <xsl:value-of select="@cial"/>
<hr noshade="noshade"/>
</li>
</xsl:template> <!-- fin de la segunda plantilla-->
</xsl:stylesheet>