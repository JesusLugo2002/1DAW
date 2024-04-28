<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <h1>Calendario de exámenes</h1>
            <h2>Mayo</h2>
            <xsl:apply-templates select="/escuelasdeidiomas/escuela/idioma"/>
            <h2>Junio</h2>
        </html>
    </xsl:template>

    <xsl:template match="idioma">
        <table border="1">
            <tr><th><xsl:value-of select="@codigo"/></th></tr>
            <tr>
                <th>Nivel</th>
                <th>Modalidad</th>
                <th>Lugar</th>
                <th>Fecha</th>
            </tr>
            <tr>
                <td><xsl:value-of select="/nivel/@certificacion"/></td>
                <td><xsl:value-of select="/nivel/examen/@tipo"/></td>
                <td><xsl:value-of select="../@sede"/></td>
                <td><xsl:value-of select="/nivel/examen"/></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>