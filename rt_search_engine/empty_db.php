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
	mysql_close ($connexion);
	header("Location: film_search.html");
	exit;
?>