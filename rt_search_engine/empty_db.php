<?php
	include 'db_connection.php';
	$query = "TRUNCATE TABLE meta_tag_to_doc";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE doc";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE films";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE meta_tag";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE cast";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE cast_to_film_title";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE genres";
	mysqli_query($connexion, $query);
	$query = "TRUNCATE TABLE genres_to_film_title";
	mysqli_query($connexion, $query);
	mysqli_close($connexion);
	header("Location: film_search.html");
	exit;
?>