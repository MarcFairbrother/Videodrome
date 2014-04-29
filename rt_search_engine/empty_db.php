<?php
	include 'db_connection.php';
	$query = "TRUNCATE TABLE meta_tag_to_doc";
	mysql_query ($query);
	$query = "TRUNCATE TABLE doc";
	mysql_query ($query);
	$query = "TRUNCATE TABLE film_title_table";
	mysql_query ($query);
	$query = "TRUNCATE TABLE meta_tag";
	mysql_query ($query);
	$query = "TRUNCATE TABLE cast";
	mysql_query ($query);
	$query = "TRUNCATE TABLE cast_to_film_title";
	mysql_query ($query);
	$query = "TRUNCATE TABLE genres";
	mysql_query ($query);
	$query = "TRUNCATE TABLE genres_to_film_title";
	mysql_query ($query);
	mysql_close ($connexion);
	header("Location: film_search.html");
	exit;
?>