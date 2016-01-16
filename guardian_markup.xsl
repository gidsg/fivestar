<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl"
    xsl:extension-element-prefixes="php"
>

<xsl:output method="html" version="4.0" indent="yes"/>
<xsl:template match="/">
   <html>
    <head>
      <link rel="stylesheet" type="text/css" href="/fivestar/style.css" />
        <title>Five star - Latest top rated <xsl:value-of select="$title"/> from the Guardian </title>
        <meta name="description" content="Latest top rated reviews from the Guardian, sorted by Star Rating" />
    </head>
       
  <body>
    <h1>Five star - <xsl:value-of select="$title"/></h1>
    <div id="navcontainer">
<ul id="navlist">
<li>Review type: <a href="/fivestar/type/film" id="current">Film Reviews</a></li>
<li><a href="/fivestar/type/music">Music Reviews</a></li>
<li><a href="/fivestar/type/stage">Stage Reviews</a></li>
</ul>

<ul id="ratinglist">
<li>Filter by star rating: 
<a href="{path}?star-rating=5">5</a></li>
<li><a href="{path}?star-rating=4">4</a></li>
<li><a href="{path}?star-rating=3">3</a></li>
<li><a href="{path}?star-rating=2">2</a></li>
<li><a href="{path}?star-rating=1">1</a></li>
</ul>

        
        
        
</div>
    <div class="intro">Latest Guardian <xsl:value-of select="$title"/> sorted by Star Rating. <em>Cut the crap!</em></div>    
   <ol>
 <xsl:for-each select="/response/results/result">
 <xsl:sort select="fields/field[@name='star-rating']" data-type="number" order="descending" />
 <div class="item">
     <xsl:variable name="headline" select="fields/field[@name='headline']"/>
      <li class="listitem"><a href="{@web-url}"><xsl:value-of select="php:function('strip_tags',string($headline))" disable-output-escaping="yes"/></a>
      <xsl:if test="fields/field[@name='thumbnail']"> <img class="thumbnail" src="{fields/field[@name='thumbnail']}" height="84" width="140" /> </xsl:if> 
          <xsl:variable name="trail-text" select="fields/field[@name='trail-text']"/>
         <div class="trail"> <xsl:value-of select="php:function('strip_tags',string($trail-text))" disable-output-escaping="yes"/>
           </div>   
        <div class="verdict">
          <xsl:choose>
    <xsl:when test="fields/field[@name='star-rating'] = 0">
   <img src="/fivestar/images/0.png" alt="0 stars" />
    </xsl:when>
     <xsl:when test="fields/field[@name='star-rating'] = 1">
   <img src="/fivestar/images/1.png" alt="1 star" />
    </xsl:when>
  <xsl:when test="fields/field[@name='star-rating'] = 2">
   <img src="/fivestar/images/2.png" alt="2 stars" />
    </xsl:when>
    <xsl:when test="fields/field[@name='star-rating'] = 3">
   <img src="/fivestar/images/3.png" alt="3 stars" />
    </xsl:when>
       <xsl:when test="fields/field[@name='star-rating'] = 4">
   <img src="/fivestar/images/4.png" alt="4 stars" />
    </xsl:when>
    <xsl:when test="fields/field[@name='star-rating'] = 5">
   <img src="/fivestar/images/5.png" alt="5 stars" />
    </xsl:when>
  </xsl:choose>
        </div>          
</li>
 </div>
      </xsl:for-each> 
   </ol>
   <a href="{$nextpagelink}">Next page (older reviews)</a><br/>
<a href="http://www.guardian.co.uk"><img src="/fivestar/images/poweredbyguardianBLACK.png" alt="Powered by the Guardian" width="140" height="45"  /></a><br /> By <a href="/">Gideon Goldberg</a>
  </body>
  </html>

</xsl:template>
</xsl:stylesheet>