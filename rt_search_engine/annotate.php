<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Résultat de l'annotation</title>
</head>
<body>
<?php
	
	//Connect to DB
	include 'db_connection.php';

	$annotationTitle = mysqli_real_escape_string($connexion, $_POST['annotationTitle']);

	$sourceMovie = mysqli_real_escape_string($connexion, $_POST['sourceMovie']);

	$targetMovie = mysqli_real_escape_string($connexion, $_POST['filmChoice']);

	$briefDescription = mysqli_real_escape_string($connexion, $_POST['briefDescription']);

	$description = mysqli_real_escape_string($connexion, $_POST['annotationDescription']);

	$annotationType = mysqli_real_escape_string($connexion, $_POST['annotationType']);
	
	$sql = "INSERT INTO user_annotation (annotation_title, source_movie_id, target_movie_id, brief_description, annotation_description, annotated_for_tag_type_id) VALUES ('$annotationTitle', '$sourceMovie', '$targetMovie', '$briefDescription', '$description', '$annotationType')";
	mysqli_query($connexion, $sql);

	echo "<p>ID du film-source : ".$sourceMovie."<br>ID du film-cible : ".$targetMovie."<br>Titre de l'annotation : ".$annotationTitle."<br>Description brève : ".$briefDescription."<br>Descrpition détaillée : ".$description."<br>ID du type de l'annotation : ".$annotationType;

	mysqli_close ($connexion);

?>
</body>
</html>