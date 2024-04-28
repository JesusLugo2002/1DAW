<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

    <xsl:template match="item">
        <table width="70%" border="1">
            <tr>
                <td><xsl:value-of select="title"/></td>
            </tr>
        </table>
        <br/>
    </xsl:template>

</xsl:stylesheet>