<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <html>
  <body>
  <h1>Impresoras</h1>
  <table>
  <tr><th>Modelo</th><th>Marca</th></tr>
  <xsl:for-each select="//impresora">
  <tr>
  <td><xsl:value-of select="modelo"/></td>
  <td><xsl:value-of select="marca"/></td>
  </tr>
  </xsl:for-each>  
  </table>
  </body>  
  </html>
  </xsl:template>
</xsl:stylesheet>
