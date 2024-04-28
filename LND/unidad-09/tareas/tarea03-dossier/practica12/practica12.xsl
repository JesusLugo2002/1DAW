<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <h3>Alumnos por curso:</h3>
            <xsl:apply-templates select="instituto/curso"/>
        </html>
    </xsl:template>

    <xsl:template match="curso">
        <table border="1">
            <tr style="background-color: blue; color: white;"><td><xsl:value-of select="@nombre"/></td></tr>
            <tr style="background-color: pink;">
                <td>CIAL:</td>
                <td>Nombre:</td>
                <td>Apellido:</td>
            </tr>
                <xsl:apply-templates select="alumno"/>
        </table>
        <br/>
    </xsl:template>

    <xsl:template match="alumno">
        <tr>
            <td style="color: white; background-color: green;"><xsl:value-of select="@cial"/></td>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="apellidos"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>