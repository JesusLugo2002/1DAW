<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>

    <xsl:template match="/">
        <noticias>
            <xsl:apply-templates select="/Category/Feed/item"/>
        </noticias>
    </xsl:template>

    <xsl:template match="item">
        <noticia>
            <xsl:attribute name="autor" select="author"/>
            <xsl:attribute name="fecha" select="pubDate"/>
            <xsl:value-of select="title"/>
        </noticia>
    </xsl:template>

</xsl:stylesheet>