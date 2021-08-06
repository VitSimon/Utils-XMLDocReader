<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:xfn="http://www.w3.org/2005/xpath-functions"
xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
>

	<xsl:variable name="indexHead" select="0" />
	
	<xsl:template match="/">

        <xsl:copy>
            <xsl:iterate select="uri-collection('/filepath') ! doc(.)">
                <xsl:variable name="fileUri" select=" concat('update/', tokenize( document-uri(.),'/')[last()])"/>
                <xsl:value-of select="fileUri"/>
            </xsl:iterate>
        </xsl:copy>
	
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
			<script>
			//<![CDATA[
			document.write(window.location.href);
			//]]>
			</script>
						
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
<![CDATA[
function URLToArray(url)
{
	var urlstring = url;
	
	if (typeof urlstring === "undefined" || urlstring == '')
		urlstring = window.location.href.toString();
	
	var split1 = urlstring.split('?');
	
	var mainPart = "";
	var parms = "";
	var bookmark = "";
	var split2 = "";
	var fromPars = false;
	
	if (Array.isArray(split1))
	{
		mainPart = split1[0];

		if (split1.length > 1)
		{
			parms = split1[1];
			parms = parms.split('&');
			fromPars = Array.isArray(parms) && parms.length > 0;
			
			if (fromPars)
			{
				parms = parms.filter(x => x | x != '');
				split2 = parms[parms.length - 1];
			} else {
				split2 = split1[1];
			}
		}
	} else {
		mainPart = urlstring;
	}
	
	if (split2 === "")
	{
		split2 = urlstring;
		fromPars = false;
	}
	
	split2 = split2.split('#');
	
	if (split2.length > 1)
		bookmark = split2[1];
	
	if (fromPars)
		parms[parms.length - 1] = split2[0];
	else {
		mainPart = split2[0];
	}
	
	for (i = 0; i < parms.length; i++) {
		parms[i] = parms[i].split('=');
	}

	var protocol = '';
	
	if (mainPart.indexOf(':') != -1)
	{
		mainPart = mainPart.split(':');
		protocol = mainPart.shift();
		mainPart = mainPart.join(':');
	}
	
	//var finReply = [ protocol, mainPart, parms, bookmark ];
	var finReply = { urlstring, protocol, mainPart, parms, bookmark };
	
	return finReply;
}

function ShowOnlyBookmark()
{
    let divs = document.querySelectorAll('div');
    
    [].forEach.call(divs, i => {
    	if (i.id.startsWith('DIV--'))
        	i.style.display = "none";
    });
    
    //alert('DIV--' + URLToArray()["bookmark"]);
    
    let obj = document.getElementById('DIV--' + URLToArray()["bookmark"]);
    
    if (obj)
    	obj.style.display = "block";
}

//URLToArray()
//'a.txt?aa=7'
window.addEventListener("popstate", function(){
    ShowOnlyBookmark();
});
]]>
</script>

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
		
<!--
	<xsl:template match="treelink" mode="tree">
		<xsl:param name="tpl_prevPos" />
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href"><xsl:value-of select="filepath"/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
	</xsl:template>
-->
	<xsl:template match="treelink" mode="tree">
		<xsl:param name="tpl_prevPos" />
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href"><xsl:value-of select="filepath"/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
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

<xsl:choose>
    <xsl:when test="itemD|treelink">
      <li>
        <details open=''>
          <summary>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:apply-templates select="treeicon" mode="tree" />
		<xsl:value-of select="title"/>
		</xsl:element>
		  </summary>
          <ul>
		<xsl:for-each select="itemD">
			<xsl:apply-templates select="." mode="tree">
				<xsl:with-param name="tpl_prevPos"><xsl:value-of select="$tpl_prevPos"/>_<xsl:value-of select="position()"/></xsl:with-param> 
			</xsl:apply-templates>
		</xsl:for-each>
		
		<xsl:for-each select="treelink">
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href"><xsl:value-of select="filepath"/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
		</xsl:for-each>
          </ul>
        </details>
      </li>
	</xsl:when>                                                                      
    <xsl:otherwise>
		<li>
		<xsl:element name="a">
		<xsl:attribute name="href">#<xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:apply-templates select="treeicon" mode="tree" />
		<xsl:value-of select="title"/>
		</xsl:element>
		</li>
    </xsl:otherwise>                             
</xsl:choose>

	</xsl:template>
   
	<xsl:template match="treelink" mode="detail">
	</xsl:template>
	
	<xsl:template match="itemD" mode="detail">
		<xsl:param name="tpl_prevPos" />

		<xsl:if test="txt != '' or embedfile != ''">
		
		<xsl:element name="div">
		<xsl:attribute name="id">DIV--<xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>

		<xsl:element name="h{count(ancestor::*)}">
		<xsl:attribute name="id"><xsl:value-of select="$tpl_prevPos"/>_<xsl:number/></xsl:attribute>
		<xsl:value-of select="title"/>
		</xsl:element>

		<xsl:copy-of select="txt/node()"/>
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

<!--
		<xsl:apply-templates select="document(@embedfile)/" />
-->
		
		<xsl:if test="filepath != ''">
		<br />
		<ul>
		<xsl:for-each select="./filepath">
			<li><a href="{.}"><xsl:value-of select="."/></a></li>
		</xsl:for-each>
		</ul>
		</xsl:if>

		</xsl:element>

		<xsl:for-each select="itemD">
			<xsl:apply-templates select="." mode="detail">
				<xsl:with-param name="tpl_prevPos"><xsl:value-of select="$tpl_prevPos"/>_<xsl:value-of select="position()"/></xsl:with-param> 
			</xsl:apply-templates>
		</xsl:for-each>

		</xsl:if>
<!--
		<xsl:for-each select="itemD">
			<xsl:apply-templates select="itemD" mode="detail" />
		</xsl:for-each>
-->		
	</xsl:template>
	
	<xsl:template match="treeicon" mode="tree">
		<img src="{.}" />&#160;
	</xsl:template>
	
</xsl:stylesheet>