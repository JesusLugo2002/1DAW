<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>

    <xsl:template match="/">
        <reporteros>
            <xsl:apply-templates select="/Category/Feed/item"/>
        </reporteros>
    </xsl:template>

    <xsl:template match="item">
        <reportero>
            <xsl:element name="nombre"><xsl:value-of select="author"/></xsl:element>
            <xsl:element name="noticia"><xsl:value-of select="title"/></xsl:element>
            <xsl:element name="fecha"><xsl:value-of select="pubDate"/></xsl:element>
        </reportero>
    </xsl:template>

</xsl:stylesheet>