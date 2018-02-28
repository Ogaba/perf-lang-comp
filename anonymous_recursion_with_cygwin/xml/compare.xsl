<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <body>
  <h2>XML</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Version</th>
      <th>Command</th>
      <th>mean CPU Real</th>
      <th>std dev CPU Real</th>
      <th>mean CPU User</th>
      <th>std dev CPU User</th>
      <th>mean CPU Sys</th>
      <th>std dev CPU Sys</th>
      <th>Hash</th>
      <th>Nombre de lignes regexp</th>
    </tr>
    <xsl:for-each select="body/ROWSET/ROW">
    <tr>
      <td><xsl:value-of select="VERSION"/></td>
      <td><xsl:value-of select="TASKSET"/></td>
      <td><xsl:value-of select="MEAN_REAL"/></td>
      <td><xsl:value-of select="STDDEV_REAL"/></td>
      <td><xsl:value-of select="MEAN_USER"/></td>
      <td><xsl:value-of select="STDDEV_USER"/></td>
      <td><xsl:value-of select="MEAN_SYS"/></td>
      <td><xsl:value-of select="STDDEV_SYS"/></td>
      <td><xsl:value-of select="HASH"/></td>
      <td><xsl:value-of select="NB_LIGNES"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 
