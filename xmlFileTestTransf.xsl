<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<meta name="generator" content="PSPad editor, www.pspad.com" />
				<title>{base-uri()}</title>
				<link rel="stylesheet" href="7.css" />
				<link rel="stylesheet" href="docs.css" />
			</head>
			<body class="surface custom-scrollbar" >
				<section id="social">&#160;</section>
				<aside>
					<ul class="tree-view">
						<xsl:variable name="indentation" select="0" />
						<xsl:apply-templates mode="tree" />
<!--
						<xsl:for-each select="content/item">
<xsl:choose>
  <xsl:when test="indent = indentation">
							<li><a href="#{position()}"><xsl:value-of select="title"/></a></li>
  </xsl:when>
  <xsl:otherwise>         
<xsl:choose>
  <xsl:when test="indent &gt; indentation">
            <li>
              <details open=''>
                <summary><li><a href="#{position()}"><xsl:value-of select="title"/></a></li></summary>
              </details>
              </li>
<-
                <ul>
->
  </xsl:when>
  <xsl:otherwise>
				  <li><a href="#{position()}"><xsl:value-of select="title"/></a></li>
<-
                </ul>
              </details>
            </li>
<xsl:variable name="indentation" select="indent" />
->
  </xsl:otherwise>
</xsl:choose>
  </xsl:otherwise>
</xsl:choose>
						</xsl:for-each>
-->
						
<!--
							<xsl:choose>
								<xsl:when test="indent=1">
								<li><xsl:value-of select="$content[position() = $current_pos - 1]/" /></li>
								</xsl:when>
								<xsl:otherwise>
									<li><a href="#{position()}">AAA:<xsl:value-of select="title"/></a></li>
								</xsl:otherwise>
							</xsl:choose>

-->
						</ul>
					</aside>
					<main>
						<xsl:apply-templates mode="detail" />
					</main>
				</body>
			</html>
		</xsl:template>
		
	<xsl:template match="/content/item" mode="tree">
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
	</xsl:template>
   
	<xsl:template match="/content/item" mode="detail">
		<xsl:element name="h{indent}">
		<xsl:attribute name="id"><xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		<div><xsl:copy-of select="txt"/></div>
	</xsl:template>

<!--
		<h1 id="{position()}"><xsl:value-of select="title"/></h1>
-->
</xsl:stylesheet>