<?php
include 'config.php';

$CAPI_host="http://content.guardianapis.com/";


//set some parameters based on the querystring
if(array_key_exists("type", $_GET)) 
{
$type=$_GET["type"];    
}
else
{
$type="film";  
}

if(array_key_exists("page", $_GET)) 
{
$page=$_GET["page"];    
}
else
{
$page=1;  
}

//set some parameters based on the querystring
if(array_key_exists("star-rating", $_GET)) 
{
$star_rating=$_GET["star-rating"];    
}
else
{
$star_rating="5|4|3|2|1";  
}


$nextpage=$page+1;


function setQueryString($key, $val=''){
    $pUrl = parse_url($_SERVER['REQUEST_URI']);
    if(isset($pUrl['query']))
        parse_str($pUrl['query'], $pUrl['query']);
    else $pUrl['query'] = [];
    $pUrl['query'][$key] = $val;
    $path = isset($pUrl['path']) ? $pUrl['path'] : '';
    $path = count($pUrl['query'])>0 ? $path.'?' : $path;

    return $path . http_build_query($pUrl['query']);
}


$nextpagelink = setQueryString('page', $nextpage);
$starratinglink = setQueryString('star-rating');

$common_params = array(
              'page-size'=>'100',
              'order-by'=>'newest',
              'format'=>'xml',
              'show-fields' => 'headline,trail-text,thumbnail,star-rating,byline',
              'page' => $page,
              'star-rating' => $star_rating,
              'api-key' => $API_key);
$film_params = array('tag' => 'tone/reviews, film/film');
$music_params = array('tag' => 'tone/albumreview, music/music');
$stage_params = array('tag' => 'tone/reviews, stage/stage');

    if($type == "film")
    {        
     $query="{$CAPI_host}search?".http_build_query(array_merge($common_params, $film_params));
     $title='Film Reviews';
    }
    elseif($type == "music")
    {
     $query="{$CAPI_host}search?".http_build_query(array_merge($common_params, $music_params));;
     $title='Music Reviews';
    }
    elseif($type == "stage")
    {
     $query="{$CAPI_host}search?".http_build_query(array_merge($common_params, $stage_params));   ;
     $title='Stage Reviews';
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
     $xp->setParameter($namespace, 'nextpagelink', $nextpagelink); 
     $xp->setParameter($namespace, 'starratinglink', $starratinglink); 
            
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