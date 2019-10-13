<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
<xsl:output method="html" indent="yes"/>

 <xsl:variable name="STDDEV_SYS_SUM"> <xsl:value-of select="sum(/body/ROWSET/ROW/STDDEV_SYS)"/> </xsl:variable>

<xsl:value-of select="$STDDEV_SYS_SUM"/>

 <xsl:variable name="MEAN_SYS_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'MEAN_SYS')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
		<xsl:value-of select="."/>
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="STDDEV_SYS_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'STDDEV_SYS')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
		<xsl:value-of select="."/>
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="MEAN_REAL_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'MEAN_REAL')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
		<xsl:value-of select="."/>
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="STDDEV_REAL_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'STDDEV_REAL')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
		<xsl:value-of select="."/>
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="MEAN_USER_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'MEAN_USER')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
		<xsl:value-of select="."/>
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="STDDEV_USER_MAX">
  <xsl:for-each select="/body/ROWSET/ROW/*[starts-with(local-name(), 'STDDEV_USER')]">
    <xsl:sort select="." data-type="number" order="descending"/>
    <xsl:if test="position() = 1">
	<xsl:if test="/body/ROWSET/ROW/HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
	</xsl:if>
    </xsl:if>
  </xsl:for-each>
 </xsl:variable>

 <xsl:variable name="STDDEV_SYS_AVG"> 
        <xsl:value-of select="$STDDEV_SYS_SUM div count(/body/ROWSET/ROW/STDDEV_SYS)"/>
 </xsl:variable>

<xsl:template match="/">
  <html>
  <body>
  <h2>Comparative result of CPU time consumed by different programming languages (hardware independant)</h2>
  Generated : <xsl:value-of select="body/DATE"/>
  <br></br>
  Algorithm used from rosettacode : <a href="http://rosettacode.org/wiki/{body/ALGORITHM}"><xsl:value-of select="body/ALGORITHM"/></a>
  <table border="1">
    <tr bgcolor="#9acd32">
	<th>Version</th>
	<th>Command</th>
	<th>mean CPU Real %</th>
	<th>mean CPU User %</th>
	<th>mean CPU Sys %</th>
	<th>Hash</th>
	<th>Nombre de lignes générées en sortie</th>
    </tr>
    <xsl:for-each select="body/ROWSET/ROW">
    <tr>
	<xsl:if test="HASH!=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
	<td><i><xsl:value-of select="VERSION"/></i></td>
	<td><i><xsl:value-of select="COMMAND"/></i></td>
	<td></td>
	<td></td>
	<td></td>
	<td><i><xsl:value-of select="HASH"/></i></td>
	<td><i><xsl:value-of select="NB_LIGNES"/></i></td>
	<td></td>
	</xsl:if>
	<xsl:if test="HASH=/body/ROWSET/MOST_PROBABLE_CORRECT_HASH">
	<td><xsl:value-of select="VERSION"/></td>
	<td><xsl:value-of select="COMMAND"/></td>
	<td><xsl:value-of select="round(MEAN_REAL div $MEAN_REAL_MAX * 100)"/>%</td>
	<td><xsl:value-of select="round(MEAN_USER div $MEAN_USER_MAX * 100)"/>%</td>
	<td><xsl:value-of select="round(MEAN_SYS div $MEAN_SYS_MAX * 100)"/>%</td>
	<td><xsl:value-of select="HASH"/></td>
	<td><xsl:value-of select="NB_LIGNES"/></td>
	</xsl:if>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet> 
