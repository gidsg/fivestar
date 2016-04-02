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
      <style>
          .star-on{
              color: rgb(255,215,64);
          }
          .trail-pic{
              vertical-align: text-top;
              float:left;
              margin-right: 5px;
            
          }
          .item{
             align-items: baseline;
              overflow: visible;
              display:inline-block;
                clear:both;
          }
          .nav-icon{
              color:rgb(117, 117, 117);
              font-size: 48px !important;
          }
          
      </style>

    <!-- Material Design icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Five Star</title>

    <!-- Disable tap highlight on IE -->
    <meta name="msapplication-tap-highlight" content="no" />

    <!-- Web Application Manifest -->
    <link rel="manifest" href="manifest.json" />

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes" />
    <meta name="application-name" content="Web Starter Kit" />
    <link rel="icon" sizes="192x192" href="images/touch/chrome-touch-icon-192x192.png" />

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-mobile-web-app-title" content="Web Starter Kit" />
    <link rel="apple-touch-icon" href="images/touch/apple-touch-icon.png" />

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png" />
    <meta name="msapplication-TileColor" content="#2F3BA2" />

    <!-- Color the status bar on mobile devices -->
    <meta name="theme-color" content="#2F3BA2" />
        </head>
       
  <body>
   <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
  <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
        <span class="mdl-layout-title">Five Star</span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation mdl-layout--large-screen-only">
        <a class="mdl-navigation__link" href="">Link</a>
        <a class="mdl-navigation__link" href="">Link</a>
        <a class="mdl-navigation__link" href="">Link</a>
        <a class="mdl-navigation__link" href="">Link</a>
      </nav>
    </div>
  </header>
  <div class="mdl-layout__drawer">
    <span class="mdl-layout-title">Five Star</span>

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
        <xsl:if test="fields/field[@name='thumbnail']"><img src="{fields/field[@name='thumbnail']}" width="140" height="84" class="trail-pic" /></xsl:if>
        <xsl:variable name="trail-text" select="fields/field[@name='trail-text']"/>
        <xsl:value-of select="php:function('strip_tags',string($trail-text))" disable-output-escaping="yes"/>
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

               <a class="mdl-list__item-secondary-action" href="#"><i class="nav-icon material-icons">keyboard_arrow_left</i></a>  
               <a class="mdl-list__item-secondary-action" href="#"><i class="nav-icon material-icons">keyboard_arrow_right</i></a>   
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