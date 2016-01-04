<?php
include 'config.php';

$CAPI_host="http://content.guardianapis.com/";
                      
//set some parameters based on the querystring
if(array_key_exists("page", $_GET)) 
{
$page=$_GET["page"];    
}
else
{
$page=1;

    
}


$nextpage=$page+1;
if(array_key_exists("type", $_GET)) 
{
    if($_GET["type"] == "film")
    {
     $query="{$CAPI_host}search?tag=tone%2Freviews%2C+film%2Ffilm&page-size=100&order-by=newest&format=xml&show-fields=headline%2Ctrail-text%2Cthumbnail%2Cstar-rating&page={$page}&api-key={$API_key}";
     $title='Film Reviews';
     $nextpagelink="film&page={$nextpage}";
    }
    elseif($_GET["type"] == "music")
    {
     $query="{$CAPI_host}search?tag=tone%2Falbumreview%2C+music%2Fmusic&page-size=100&order-by=newest&format=xml&show-fields=headline%2Ctrail-text%2Cthumbnail%2Cstar-rating&page={$page}&api-key={$API_key}";
     $title='Music Reviews';
     $nextpagelink="music&page={$nextpage}";
    }
    elseif($_GET["type"] == "stage")
    {
     $query="{$CAPI_host}search?tag=tone%2Freviews%2C+stage%2Fstage&page-size=100&order-by=newest&format=xml&show-fields=headline%2Ctrail-text%2Cthumbnail%2Cstar-rating&page={$page}&api-key={$API_key}";
     $title='Stage Reviews';
     $nextpagelink="stage&page={$nextpage}";
    }
    
}   
    else


       {
        $title='Film Reviews';
        $query="{$CAPI_host}search?tag=tone%2Freviews%2C+film%2Ffilm&page-size=100&order-by=newest&format=xml&show-fields=headline%2Ctrail-text%2Cthumbnail%2Cstar-rating&page={$page}&api-key={$API_key}";
        $nextpagelink="?page={$nextpage}";;
       }




  $xp = new XsltProcessor();
  $xp->registerPHPFunctions();
  
 // create a DOM document and load the XSL stylesheet
  $xsl = new DomDocument;
  $xsl->load('guardian_markup.xsl');
  
  // import the XSL styelsheet into the XSLT process
  $xp->importStylesheet($xsl);
  
  //set some parameters in the XSLT

     $xp->setParameter($namespace, 'title', $title);
     $xp->setParameter($namespace, 'page', $page);
     $xp->setParameter($namespace, 'nextpage', $nextpage);
     $xp->setParameter($namespace, 'nextpagelink', $nextpagelink); 
          
    
  
    
  
  
  // create a DOM document and load the XML data
  $xml_doc = new DomDocument;
  $xml_doc->load($query);

  // transform the XML into HTML using the XSL file
  if ($html = $xp->transformToXML($xml_doc)) {
      echo $html;
  } else {
      trigger_error('XSL transformation failed.', E_USER_ERROR);
  } 

?> 