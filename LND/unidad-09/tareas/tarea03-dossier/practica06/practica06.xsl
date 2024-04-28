<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/><!--Crearemos un fichero XML-->
<xsl:template match="/"><!--Primera plantilla: se aplica al elemento raíz-->
<ciales> <!--nuestro nuevo elemento raíz es la etiqueta ciales -->
<xsl:apply-templates select="/instituto/curso/alumno"/> <!--seguimos procesando-->
</ciales>
</xsl:template> <!-- fin de la primera plantilla -->
<xsl:template match="alumno"><!--2ª plantilla: se aplica a la etiqueta alumno-->
<alumno>
<cial><xsl:value-of select="@cial"/></cial>
<datos> <xsl:value-of select="nombre"/> <xsl:text> - </xsl:text>
<xsl:value-of select="apellidos"/></datos>
<curso><xsl:value-of select="../@nombre"/></curso>
</alumno>
</xsl:template> <!-- fin de la segunda plantilla-->
</xsl:stylesheet>