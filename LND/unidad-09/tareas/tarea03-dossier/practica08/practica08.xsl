<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>

    <xsl:template match="/">
        <cartas> 
            <xsl:apply-templates select="/instituto/curso/alumno[apellidos[contains(text(), 'Pérez')]]"/>
        </cartas>
    </xsl:template> 

    <xsl:template match="alumno">
        <alumno>
            <destinatario> <xsl:value-of select="nombre"/> <xsl:text> - </xsl:text> <xsl:value-of select="apellidos"/> </destinatario>
            <evento> <xsl:text>1ª Congregación de los Pérez</xsl:text></evento>
        </alumno>
    </xsl:template>
    
</xsl:stylesheet>