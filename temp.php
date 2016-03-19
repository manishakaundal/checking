<?php
include_once('omhconnection.php');
 $postalcode = $_GET['name'];
 echo $postalcode;
		    
		    			//fetch data from GPS
		   	$district = "";
		 
		    if((!$stmt = $mysqli->prepare("SELECT DISTINCT PINCODE, DISTRICT FROM LOCATION WHERE PINCODE=$postalcode")))
			{
				echo "statement prepare problem";
			}
			if(!($stmt->execute()))
			{
				echo "statement execution problem";
			}	
			$res = $stmt->get_result();

			 while($row = $res->fetch_array(MYSQLI_ASSOC))
			 {
			 	$district = $row['DISTRICT'];
			 }

			 echo $district;
			$area = "M";
			//$district = "Chanakyapuri";


			$value = 2;
			$value1 = 3;

			
				$query = "SELECT * FROM mechanics WHERE district = '$district' ";
				$array = array("Mechanic name","Phone no","area");
				display($mysqli,$query,$array,3) ; 
		

			
			//  ******************* function defintion - table display ***********************

			function display($mysqli, $query, $array, $limit) {  //limit : for loop no. of columns to display using mysqli_num ; 
				$stmt = $mysqli->prepare($query);                //array : column name headings
				$stmt->execute();	
				$res = $stmt->get_result();
			?>
				<table style = "border:1px solid black"><tr> 
			<?php foreach ($array as $value) {   //Column headings ?>
				    <th style="background-color:green;color:white"> 
			        <?php echo $value . "</th>";
		    	   }      //foreach loop end

				while( $row = $res->fetch_array(MYSQLI_NUM) ){  ?>
				    <tr>
			        <?php for($i=0; $i<$limit; $i++) { ?>
			                 <td style="border:1px solid black">
			                 <?php echo $row[$i] . "</td>"; // column values - entire row 
			               } // for loop end 
				echo "</tr>";
				}  //while loop end
				echo "</table> ";
			}  //function end*/
			?> 