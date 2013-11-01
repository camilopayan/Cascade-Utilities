<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="site://X - DEV Random/css minifier" />

  <xsl:template match="system-data-structure">
    <xsl:apply-templates select="css-file" />
  </xsl:template>

  <xsl:template name="css-file">
    <xsl:call-template name="cssmin">
      <xsl:with-param name="css" select="content" />
      <xsl:with-param name="linebreakpos">80</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>

