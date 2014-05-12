<?php

	//Connect to DB
	include 'db_connection.php';

	$filmID = $_GET['film'];

	$sql = "SELECT film_title, data FROM films WHERE film_title_id='$filmID'";
	$sqlResult = mysql_query($sql);

	while ($row = mysql_fetch_row($sqlResult)){
	
		echo "<h1>" . $row[0] . "</h1><p>" . $row[1] . "</p>";
	
	}
	
	mysql_close ($connexion);

?>