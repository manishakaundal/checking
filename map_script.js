    var x = document.getElementById("demo");
function getLocation() {
    if (navigator.geolocation) {
            alert("getLocation wroking"); 
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}


function showPosition(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var latlon = new google.maps.LatLng(lat, lon);
    var mapholder = document.getElementById("mapholder"); //change double qoutes
    mapholder.style.height = '250px';
    mapholder.style.width = '500px';
    var myOptions = {
        center:latlon,zoom:14,
        mapTypeId:google.maps.MapTypeId.ROADMAP,
        mapTypeControl:false,
        navigationControlOptions: {style:google.maps.NavigationControlStyle.SMALL}
    }
    var map = new google.maps.Map(document.getElementById("mapholder"),myOptions);
    alert("the middle of creating");   
    var marker = new google.maps.Marker({ position: latlon, map: map, title: "You are here!" });
   alert(lat+"     "+lon);
    getReverseGeocodingData(lat,lon);  
    }

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}


function getReverseGeocodingData(lat, lng) {  

    var latlng = new google.maps.LatLng(lat, lng); 
    // This is making the Geocode request
    var geocoder = new google.maps.Geocoder();
   // alert("reverse geocoding working");
    geocoder.geocode({ 'latLng': latlng }, function (results, status) {
        if (status !== google.maps.GeocoderStatus.OK) {
            alert("geo coding status");
        }
        alert("check 1");
        // This is checking to see if the Geoeode Status is OK before proceeding
        if (status == google.maps.GeocoderStatus.OK) {
            console.log(results);
            var address = (results[0].formatted_address);  //First parameter - area
            var address1 = (results[1].formatted_address);
            var address2 = (results[2].formatted_address);
            var address3 = (results[3].formatted_address);
            alert("\n add : " + address+ "\n add1 : " + address1+ "\n add2 : " + address2+ "\n add3 : " + address3); 
            alert("check 2");

            var street, route, locality, arealevel, postalcode;   
          //  var arrAddress = results[0].address_components; 
            // ac = 0,1 gives route 2 gives locality
          //  ac = arrAddress.length-1;  
          alert("check");
          /*  for (ac = 0; ac < arrAddress.length; ac++) {
                if (arrAddress[ac].types[0] == "street_number") { street = arrAddress[ac].short_name; }
                if (arrAddress[ac].types[0] == "route") { route = arrAddress[ac].short_name;}
                if (arrAddress[ac].types[0] == "locality") { locality = arrAddress[ac].long_name; }
                if (arrAddress[ac].types[0] == "administrative_area_level_1") { arealevel = arrAddress[ac].short_name;}
                if (arrAddress[ac].types[0] == "postal_code") { postalcode = arrAddress[ac].long_name; }
               alert("\n add : " + street+ "\n add1 : " + route+ "\n add2 : " + locality+ "\n add3 : " + arealevel+ "\n add4 : " + postalcode); 
            }*/
            /*route=arrAddress[0].short_name;
            alert(route);
           ac = arrAddress.length-1;
            postalcode = arrAddress[ac].long_name;
            alert(postalcode);*/
            
            var strURL= "temp.php?name=" + postalcode;
            var xmlhttp = false;   
            try { xmlhttp = new XMLHttpRequest(); }
            catch(e) {      
                try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); }
                catch(e){
                    try{ xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); }
                    catch(e1){ xmlhttp = false; }
                }
            }
            //var req = xmlhttp;
            xmlhttp.onreadystatechange = function() {
                    if (xmlhttp.readyState == 4)
                    {     // only if "OK"
                        if (xmlhttp.status == 200) {
                            document.getElementById('address').innerHTML=xmlhttp.responseText; } 
                        else { alert("There was a problem while using XMLHTTP:\n" + xmlhttp.statusText); }
                    }
                 }
    
                xmlhttp.open("GET", strURL, true);
                xmlhttp.send(null);

        }
    });
} 



