<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <body>
  <h2>Raw result of CPU time consumed by different programming languages</h2>
  Generated : <xsl:value-of select="body/DATE"/> on plateform <a href="file:///./sh/conf_machine.txt">hardware</a>
  <br></br>
  Algorithm used from rosettacode : <a href="http://rosettacode.org/wiki/{body/ALGORITHM}"><xsl:value-of select="body/ALGORITHM"/></a>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Version</th>
      <th>Command</th>
      <th>mean CPU Real</th>
      <th>stddev CPU Real</th>
      <th>percentile 99% CPU Real</th>
      <th>mean CPU User</th>
      <th>stddev CPU User</th>
      <th>percentile 99% CPU User</th>
      <th>mean CPU Sys</th>
      <th>stddev CPU Sys</th>
      <th>percentile 99% CPU Sys</th>
      <th>Hash</th>
      <th>Number of lines generated on output</th>
      <th>Memory used by command (given by valgrind)</th>
    </tr>
    <xsl:for-each select="body/ROWSET/ROW">
    <tr>
      <td><xsl:value-of select="VERSION"/></td>
      <td><xsl:value-of select="COMMAND"/></td>
      <td><xsl:value-of select="MEAN_REAL"/></td>
      <td><xsl:value-of select="STDDEV_REAL"/></td>
      <td><xsl:value-of select="PERCENTILE_99_REAL"/></td>
      <td><xsl:value-of select="MEAN_USER"/></td>
      <td><xsl:value-of select="STDDEV_USER"/></td>
      <td><xsl:value-of select="PERCENTILE_99_USER"/></td>
      <td><xsl:value-of select="MEAN_SYS"/></td>
      <td><xsl:value-of select="STDDEV_SYS"/></td>
      <td><xsl:value-of select="PERCENTILE_99_SYS"/></td>
      <td><xsl:value-of select="HASH"/></td>
      <td><xsl:value-of select="NB_LIGNES"/></td>
      <td><xsl:value-of select="BYTES_TOTAL_HEAP_USAGE"/></td>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 
