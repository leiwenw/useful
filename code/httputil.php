<?php

//********************************************************
//* getJSON - return json array of response
//********************************************************
function getJSON0($response)
{
	$body = $response->getBody();
	#$body = preg_replace('/^callback\(/','',$body);
	#$body = preg_replace('/\);$/','',$body);
	$json_array = json_decode($body, true);
	if ($response->getResponseCode()==200)
	{
		return $json_array[0];
	}
	else
	{
		echo "failed to get a successful response: ";
		echo $json_array['message'] . "<br/>";
		return null;
	}
}

//********************************************************
//* getJSON - return json array of response
//********************************************************
function getJSON($response)
{
	$body = $response->getBody();
	#$body = preg_replace('/^callback\(/','',$body);
	#$body = preg_replace('/\);$/','',$body);
	$json_array = json_decode($body, true);
	if ($response->getResponseCode()==200)
	{
		return $json_array;
	}
	else
	{
		echo "failed to get a successful response: ";
		echo $json_array['message'] . "<br/>";
		return null;
	}
}

//********************************************************
//* http_get_class
//********************************************************
function http_get_class($url,$query_content)
{
  $query = http_build_query($query_content);
  //echo "$url?$query";
	$options = array(
    'useragent'      => "Chrome", // who am i 
    'connecttimeout' => 120, // timeout on connect 
    'timeout'        => 120, // timeout on response 
    'redirect'       => 10, // stop after 10 redirects
    //'httpauth'       => $credentials1,
		//'httpauthtype'   => HTTP_AUTH_NTLM,
	);

	$request = new HttpRequest($url, HttpRequest::METH_GET);
	$request->setOptions($options);
	$request->setContentType("application/json");
	$request->setQueryData($query);
	if (DEBUG) print "$query <br/>";
	return $request->send();
}

//********************************************************
//* http_post_class
//********************************************************
function http_post_class($url, $content, $query_content=null)
{
	$options = array(
    'useragent'      => "Chrome", // who am i 
    'connecttimeout' => 120, // timeout on connect 
    'timeout'        => 120, // timeout on response 
    'redirect'       => 10, // stop after 10 redirects
    //'httpauth'       => $credentials1,
		//'httpauthtype'   => HTTP_AUTH_NTLM,
	);

  $request = new HttpRequest($url, HttpRequest::METH_POST);

	$request->setOptions($options);
	$request->setContentType("application/json");
	$request->setPostFields($content);
	if (isset($query_content))
	{
		$query = http_build_query($query_content);
		$request->setQueryData($query);
		if (DEBUG) print "$query <br/>";
	}
	return $request->send();
}

//********************************************************
//* http_post_lite
//* Not Used
//********************************************************
function http_post_lite($url, $content, $headers=null)
{
	$credentials = 'DCSAutomation:gN%9GQeR';
	
	$query = http_build_query($content);	
	$opts = array(
		'http'=>array(
			'method'=>'POST',
			//'content' => $query,
			'httpauth' => $credentials,
			'httpauthtype' => HTTP_AUTH_NTLM
		)
	);
	
	if($headers) {
		$opts['http']['header'] = $headers;
	}
	
	$st = stream_context_create($opts);
	$fp = fopen($url, 'rb', false, $st);
	
	echo "<br/>http request<br/>";
	if(!$fp) {
		return false;
	}
	return stream_get_contents($fp);
}

?>
