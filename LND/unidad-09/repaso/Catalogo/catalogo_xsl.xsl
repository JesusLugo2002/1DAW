<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <html>
  <body>
  <h2>Mis CD's</h2>
  <table>
  <tr><th>Artista</th><th>Titulo</th></tr>
  <xsl:for-each select="//cd">
  <tr>
  <td><xsl:value-of select="artista"/></td>
  <td><xsl:value-of select="titulo"/></td>
  </tr>
  </xsl:for-each>  
  </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
