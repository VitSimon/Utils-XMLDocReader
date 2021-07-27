<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:variable name="indexHead" select="0" />
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="content-type" content="text/html; charset=utf-8" />
				<meta name="generator" content="PSPad editor, www.pspad.com" />
				<title><xsl:value-of select="content/itemD[1]/title" /></title>
				<link rel="stylesheet" href="7.css" />
				<link rel="stylesheet" href="docs.css" />
			</head>
			<body class="surface custom-scrollbar" >

				<section id="social">&#160;</section>
				<aside>
					<ul class="tree-view">
						<xsl:apply-templates mode="tree" />
<!--
	<xsl:template match="/">
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

<script>
(() => {
    const includes = document.getElementsByTagName('include');
    [].forEach.call(includes, i => {
        let filePath = i.getAttribute('src');
        
    const req = new XMLHttpRequest();    
    req.onload = function() {
        const text = req.responseText;
        i.insertAdjacentHTML('afterend', text);
        i.remove();
    };    
    req.open('GET', filePath);
    req.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8')
    req.send();

        
        /*fetch(filePath).then(file => {
            file.text().then(content => {
                i.insertAdjacentHTML('afterend', content);
                i.remove();
            });
        });*/
    });
})();
</script>


				</body>
			</html>
		</xsl:template>
		
	<xsl:template match="itemD" mode="tree">
		<xsl:param name="tpl_prevPos" />
<!--
<xsl:choose>                                                                                                                                                        
    <xsl:when test="following-sibling::*[1]/indent = indent">
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
	</xsl:when>                                                                      
    <xsl:otherwise>
        <xsl:choose>
            <xsl:when test="following-sibling::*[1]/indent &gt; indent">
            <li>
              <details open=''>
                <summary><a href="#{position()}"><xsl:value-of select="title"/></a></summary>
			</xsl:when>
            <xsl:otherwise>
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
                </ul>
              </details>
            </li>
			</xsl:otherwise>
        </xsl:choose>
    </xsl:otherwise>                             
</xsl:choose>
		<xsl:attribute name="id"><xsl:value-of select="${count(ancestor::*)}_${position()}"/></xsl:attribute>
		<li><a href="#{count(ancestor::*)}_{position()}"><xsl:value-of select="title"/></a></li>
		<li><a href="#{$tpl_prevPos}}"><xsl:value-of select="title"/></a></li>
-->
		<xsl:variable name="indexHead" select="0" />

<xsl:choose>                                                                                                                                                        
    <xsl:when test="itemD">
      <li>
        <details open=''>
          <summary>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		  </summary>
          <ul>
		<xsl:for-each select="itemD">
			<xsl:apply-templates select="." mode="tree">
				<xsl:with-param name="tpl_prevPos"><xsl:value-of select="$tpl_prevPos"/>_<xsl:value-of select="position()"/></xsl:with-param> 
			</xsl:apply-templates>
		</xsl:for-each>
          </ul>
        </details>
      </li>
	</xsl:when>                                                                      
    <xsl:otherwise>
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
    </xsl:otherwise>                             
</xsl:choose>

	</xsl:template>
   
	<xsl:template match="itemD" mode="detail">
		<xsl:param name="tpl_prevPos" />
		
		<xsl:element name="h{count(ancestor::*)}">
		<xsl:attribute name="id"><xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		<div>
		<xsl:copy-of select="txt"/>
		<xsl:if test="embedfile != ''">
			<xsl:for-each select="embedfile">
				<include src="{.}"></include>
			</xsl:for-each>
<!--
		<p><xsl:copy-of select="document('DataProInkluzi.html.txt')"/></p>
		<xsl:value-of select="embedfile"/>
		<xsl:copy-of select="document(@embedfile)"/>
		<p>
		<xsl:copy-of select="document('/DataProInkluzi.html')"  />
		</p>

-->
		</xsl:if>
		
		</div>

<!--
		<xsl:apply-templates select="document(@embedfile)/" />
-->
		
		<xsl:if test="filepath != ''">
		<br />
		<ul>
		<xsl:for-each select="filepath">
			<li><a href="{.}"><xsl:value-of select="."/></a></li>
		</xsl:for-each>
		</ul>
		</xsl:if>
		
		<xsl:for-each select="itemD">
			<xsl:apply-templates select="." mode="detail">
				<xsl:with-param name="tpl_prevPos"><xsl:value-of select="$tpl_prevPos"/>_<xsl:value-of select="position()"/></xsl:with-param> 
			</xsl:apply-templates>
		</xsl:for-each>
		
<!--
		<xsl:for-each select="itemD">
			<xsl:apply-templates select="itemD" mode="detail" />
		</xsl:for-each>
-->		
	</xsl:template>
</xsl:stylesheet>