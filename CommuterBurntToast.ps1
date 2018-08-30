
$myName     =    "Abhishek"
$myHome     =    "&destinations=PutYourDestinationHere"
$myWork     =    "&origins=PutYourOriginHere"
$mapsKey    =    "&key=GetAKeyFromGoogleMapsAPI"
$departTime =    "&departure_time=now"
$mapApiUrl  =    "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial"
$finalUrl   =    "$mapApiUrl$myWork$myHome$departTime$mapsKey"
$shortUrl   =    "ShortenedURLofRoute" # this is shortened URL of google maps route
#$final_url

$map_response   =   Invoke-WebRequest $finalUrl
$mapObject      =   ConvertFrom-Json -InputObject $map_response
$travelTime     =   $mapObject.rows.elements.duration_in_traffic.text

$mapButton      =   New-BTButton -Content 'Open Maps' -Arguments $shortUrl

New-BurntToastNotification -Text "$myName,`nTime to home: $travelTime" -Button $mapButton
