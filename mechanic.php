<!--  Mechanic page 
      Input : Service, District from GPS
      Output : Mechanics list in table format (Name, Phone, [Area]) -->

<!DOCTYPE html>
<html>
    <head> 

    <!--	<script src="http://maps.google.com/maps/api/js?sensor=false"></script>-->
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="map_script.js"></script> 
    <title> Search Mechanics </title>
    </head>
	<body>
		<p id="demo">Click the button to get your position. </p>

    	<button id="search" name = "search" onclick="getLocation()">Try It</button>

    	<div id="mapholder"> </div>
    	<div id="address" name="address"></div>

		
		        
	</body>
</html>
