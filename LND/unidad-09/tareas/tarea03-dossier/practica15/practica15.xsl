<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <h3>Lista de cursos disponibles:</h3>
            <xsl:apply-templates select="instituto/curso">
        </html>
    </xsl:template>

    <xsl:template match="curso">
        <>
    </xsl>

</xsl:stylesheet>