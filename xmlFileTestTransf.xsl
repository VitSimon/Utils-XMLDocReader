<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
  <section id="social">
  &#160;
  </section>
  <aside>
    <ul class="tree-view">
    <xsl:for-each select="content/item">
<li><a href="#{position()}"><xsl:value-of select="title"/></a></li>
    </xsl:for-each>

    </ul>
  </aside>
  <main>
    <xsl:for-each select="content/item">
    <h1 id="{position()}"><xsl:value-of select="title"/></h1>
    <div>
    <xsl:copy-of select="txt"/>
	</div>
    </xsl:for-each>  
  </main>
  
  </body>
</html>
</xsl:template>

</xsl:stylesheet>