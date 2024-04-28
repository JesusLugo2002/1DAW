<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <html>
  <body>
  <h1>Artistas</h1>
  <table>
  <tr><th>Nombre</th><th>Nacimiento</th><th>Fallecimiento</th><th>País</th><th>Ficha de información</th></tr>
  <xsl:for-each select="//artista[nacimiento>1500]">
  <tr>
  <td><xsl:value-of select="nombreCompleto"/></td>
  <td><xsl:value-of select="nacimiento"/></td>
  <td><xsl:value-of select="fallecimiento"/></td>
  <td><xsl:value-of select="pais"/></td>
  <td><xsl:value-of select="fichaCompleta"/></td>
  </tr>
  </xsl:for-each>  
  </table>
  </body>  
  </html>
  </xsl:template>
</xsl:stylesheet>
