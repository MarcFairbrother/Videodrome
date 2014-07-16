<?php

//Connect to DB
include 'db_connection.php';
//pour les tests
//$_POST['movieSearch'] = "test";
if (empty($_POST['movieSearch'])) {

	$return['error'] = true;
	$return['msg'] = 'Aucun film ne correspond à votre recherche';

}
else {

	$query = $_POST['movieSearch'];
	
	$return['error'] = false;
	$return['msg'] = getMovies($query);
	
}

function getMovies($query){

	
	$sql = "SELECT film_title, film_title_id FROM films WHERE UPPER(data) LIKE UPPER('%$query%')";
		
	//$sqlResult = mysqli_query($connexion, $sql);
	//$connexion = mysqli_connect ("", "", "");
	//$select = mysqli_select_db ($connexion, "videodrome");
	
	$sqlResult = mysql_query($sql);
	
	$i=0;
	
	$movies="";
	
	//while (($row = mysqli_fetch_row($sqlResult)) && ($i < 5)){
	while (($row = mysql_fetch_row($sqlResult)) && ($i < 5)){
		
		$i++;
		
		$movie["id"] = $row[1];
		$movie["title"] = $row[0];
		
		$movies[] = $movie;
		
	}
	
	return $movies;
	
	mysqli_close ($connexion);

}
		
echo json_encode($return);
	
?>