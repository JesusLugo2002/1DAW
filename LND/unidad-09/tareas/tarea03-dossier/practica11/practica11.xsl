<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <h2>Lista de nombres y apellidos</h2>
            <xsl:apply-templates select="/instituto/curso/alumno" mode="nombreApellido"/>

            <h2>Lista de ciales y curso</h2>
            <xsl:apply-templates select="/instituto/curso/alumno" mode="cialesCurso"/>
        </html>
    </xsl:template>

    <xsl:template match="alumno" mode="nombreApellido">
        <table border="1">
            <tr>
                <th> <xsl:value-of select="nombre"/> </th>
                <th> <xsl:value-of select="apellidos"/> </th>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="alumno" mode="cialesCurso">
        <table border="1">
            <tr>
                <th><xsl:value-of select="@cial"/></th>
                <th><xsl:value-of select="../@nombre"/></th>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>