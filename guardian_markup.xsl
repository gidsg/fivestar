<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl"
    xsl:extension-element-prefixes="php"
>

<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match="/">
   <html>
     <head>
           <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.orange-amber.min.css" />
           <link rel="stylesheet" href="./style.css" />
         <script defer="" src="https://code.getmdl.io/1.1.3/material.min.js"></script>

    <!-- Material Design icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Guardian reviews sorted by Star Rating." />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Five star - Latest <xsl:value-of select="concat($starratingtitle,' ', $title)"/>
 from the Guardian</title>

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no" />
        </head>

  <body>
   <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
        <h1><span class="mdl-layout-title title">Five Star</span></h1>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <span class="mdl-navigation__link"><i class="material-icons">filter_list</i> Filter to: </span>
        <a class="mdl-navigation__link" href="{$starratinglink}5">Five star reviews</a>
        <a class="mdl-navigation__link" href="{$starratinglink}1">One star reviews</a>
      </nav>

    </div>
  </header>
     <div class="mdl-layout__drawer">
       <span class="mdl-layout-title">Five Star</span>
       <nav class="mdl-navigation">
         <a class="mdl-navigation__link" href="./">Film reviews</a>
         <a class="mdl-navigation__link" href="./?type=music">Music reviews</a>
         <a class="mdl-navigation__link" href="./?type=stage">Stage reviews</a>
           <hr />
        <a class="mdl-navigation__link" href="{$starratinglink}5">Five star reviews</a>
        <a class="mdl-navigation__link" href="{$starratinglink}1">One star reviews</a>
       </nav>
     </div>

<main class="mdl-layout__content">
    <div class="page-content">
      <ul class="demo-list-two mdl-list">

          <!-- templated items -->

                     <xsl:for-each select="/response/results/result">
            <xsl:sort select="fields/field[@name='star-rating']" data-type="number" order="descending" />

   <li class="mdl-list__item mdl-list__item--three-line item">
    <span class="mdl-list__item-primary-content">
     <xsl:variable name="headline" select="fields/field[@name='headline']"/>
        <h5><a href="{@web-url}"><xsl:value-of select="php:function('strip_tags',string($headline))" disable-output-escaping="yes"/></a></h5>
        <xsl:if test="fields/field[@name='thumbnail']"><img src="{fields/field[@name='thumbnail']}" width="140" height="84" class="trail-pic" alt="" /></xsl:if>
        <xsl:variable name="trail-text" select="fields/field[@name='trail-text']"/>
        <xsl:value-of select="php:function('strip_tags',string($trail-text))" disable-output-escaping="yes"/> - <em><xsl:value-of select="fields/field[@name='byline']" disable-output-escaping="yes"/></em>
        <br />
        <!-- stars -->
        <xsl:choose>
         <xsl:when test="fields/field[@name='star-rating'] = 0">

        <i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i>

    </xsl:when>
         <xsl:when test="fields/field[@name='star-rating'] = 1">

       <i class="material-icons star-on">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i>

    </xsl:when>
         <xsl:when test="fields/field[@name='star-rating'] = 2">
        <i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i>

    </xsl:when>
                <xsl:when test="fields/field[@name='star-rating'] = 3">

        <br /><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons">star</i><i class="material-icons">star</i>

    </xsl:when>
    <xsl:when test="fields/field[@name='star-rating'] = 4">

        <i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons">star</i>

    </xsl:when>
    <xsl:when test="fields/field[@name='star-rating'] = 5">
        <i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i><i class="material-icons star-on">star</i>

        </xsl:when>
        </xsl:choose>
       </span>
                         </li>

          </xsl:for-each>


         </ul>



    </div>
    <xsl:if test="$page &lt; 5">
               <a title="Next page" class="mdl-list__item-secondary-action" href="{$nextpagelink}"><i class="nav-icon material-icons">keyboard_arrow_right</i></a>
    </xsl:if>
                    
<!--               <a class="mdl-list__item-secondary-action" href="#"><i class="nav-icon material-icons">keyboard_arrow_right</i></a>   -->
          <footer class="mdl-mini-footer">
                <div class="mdl-mini-footer__left-section">
      <div class="mdl-logo">By <a href="/">Gideon Goldberg</a></div> <img src="https://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2010/03/01/poweredbyguardianWHITE.png" alt="Powered by the Guardian" width="140" height="45" />
             
  </div>


</footer>
           </main>
      </div>
  </body>
  </html>

</xsl:template>
</xsl:stylesheet>
