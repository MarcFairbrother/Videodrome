<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title></title>
</head>
<body>
<?php
	
	//Connect to DB
	include 'db_connection.php';
	
	if (!function_exists('curl_init')){
		die('CURL is not installed!');
	}

	if(isset($_POST["filmTitle"])){
		$query=$_POST["filmTitle"];
		
		//$query=$_GET["q"];
		$apikey = '';
		$q = urlencode($query); // make sure to url encode an query parameters
		
		// construct the query with our apikey and the query we want to make
		$endpoint = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=' . $apikey . '&q=' . $q . '&page_limit=5';
		
		$search_results = getJsonCurl($endpoint);

		if(isset($_POST["json"])){
			echo $search_results;
		}
		
		// play with the data!
		$movies = $search_results->movies;
		
		echo '<ul>';
		
		foreach ($movies as $movie) {
		
			echo '<li>';
			//<a href="http://api.rottentomatoes.com/api/public/v1.0/movies/' . $movie->id . '.json?apikey=' . $apikey . '">' . $movie->title . " (" . $movie->year . ")</a><br>";
			$details = getDetailMovie($movie->id);
			echo '</li>';
		
		}
		
		echo '</ul>';
		
	}

	function getJsonCurl($url){
		
		// setup curl to make a call to the endpoint
		$session = curl_init($url);
		
		// indicates that we want the response back
		curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
		
		// exec curl and get the data back
		$data = curl_exec($session);
		
		// remember to close the curl session once we are finished retrieveing the data
		curl_close($session);
		
		/*
		// decode the json data to make it easier to parse the php
		echo $data;
		*/
		
		$search_results = json_decode($data);
		
		if ($search_results === NULL) die('Error parsing json');
		
		return $search_results;
	}
		
	function getDetailMovie($id){
	
		global $apikey;
		
		$url = "http://api.rottentomatoes.com/api/public/v1.0/movies/" . $id . ".json?apikey=". $apikey;
		$result = getJsonCurl($url);
		
		//Send TITLE and YEAR to DB
		if(isset($result->title)){
			$title = $result->title;
			$titleEscaped =  mysql_real_escape_string($title);

			if(isset($result->year)){
				$year = $result->year;
			}
			
			$sql = "SELECT * FROM film_title_table WHERE rotten_tomatoes_api_id='$id'";
					
			$sqlResult = mysql_query ($sql);
			
			if (! $tab_line = mysql_fetch_row($sqlResult)){
				
				$writeFilmTitle = "INSERT INTO film_title_table (film_title, release_year, rotten_tomatoes_api_id) VALUES ('$titleEscaped', '$year', '$id')";
				mysql_query ($writeFilmTitle);
				$FilmTitleID = mysql_insert_id();
				
				$newDoc = "INSERT INTO doc (doc_title, doc_usage, film_title_id) VALUES ('$titleEscaped', '1', '$FilmTitleID')";
				mysql_query ($newDoc);
				$newDocID = mysql_insert_id();		
				
			}
			
		}
		
		//Get DIRECTOR NAME and send to DB
		if(isset($result->abridged_directors)){
			$directors = $result->abridged_directors;
			
			foreach ($directors as $director){
				$directorName = $director->name;
				$directorNameEscaped =  mysql_real_escape_string($directorName);
		
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$directorNameEscaped' AND meta_tag_type='1'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeDirector = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$directorNameEscaped', '1')";
					mysql_query ($writeDirector);
					$DirectorID = mysql_insert_id();
					
					$addRelation = "INSERT INTO meta_tag_to_doc (meta_tag_id, doc_id) VALUES ('$DirectorID', '$newDocID')";
					mysql_query ($addRelation);
				
				}
				else{
				
					$fetchDirectorID = "SELECT * FROM meta_tag WHERE meta_tag_title='$directorNameEscaped' AND meta_tag_type='1'";
					$DirectorResult = mysql_query ($fetchDirectorID);
					while ($tab_line = mysql_fetch_row($DirectorResult)){
						$DirectorID = $tab_line[0];
						$addRelation = "INSERT INTO meta_tag_to_doc (meta_tag_id, doc_id) VALUES ('$DirectorID', '$newDocID')";
						mysql_query ($addRelation);
					}
					
				}
			
			}
		
		}
		
		//Get CAST NAMES and send to DB
		if(isset($result->abridged_cast)){
			$actors = $result->abridged_cast;
			
			foreach ($actors as $actor){
				$actorName = $actor->name;
				$actorNameEscaped =  mysql_real_escape_string($actorName);
		
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$actorNameEscaped' AND meta_tag_type='3'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeActor = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$actorNameEscaped', '3')";
					mysql_query ($writeActor);
					$ActorID = mysql_insert_id();
					
					$addRelation = "INSERT INTO meta_tag_to_doc (meta_tag_id, doc_id) VALUES ('$ActorID', '$newDocID')";
					mysql_query ($addRelation);
				
				}
				else{
				
					$fetchActorID = "SELECT * FROM meta_tag WHERE meta_tag_title='$actorNameEscaped' AND meta_tag_type='3'";
					$ActorResult = mysql_query ($fetchActorID);
					while ($tab_line = mysql_fetch_row($ActorResult)){
						$ActorID = $tab_line[0];
						$addRelation = "INSERT INTO meta_tag_to_doc (meta_tag_id, doc_id) VALUES ('$ActorID', '$newDocID')";
						mysql_query ($addRelation);
					}
					
				}
			
			}
		}
		
		//Get GENRES and send to DB
		if(isset($result->genres)){
			$genres = $result->genres;
			
			foreach ($genres as $genre){
				$genreEscaped =  mysql_real_escape_string($genre);
				
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$genreEscaped'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeGenre = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$genreEscaped', '4')";
					mysql_query ($writeGenre);
				
				}
				else{
				
					$fetchGenreID = "SELECT * FROM meta_tag WHERE meta_tag_title='$genreEscaped'";
					$GenreResult = mysql_query ($fetchGenreID);
					while ($tab_line = mysql_fetch_row($GenreResult)){
						$GenreID = $tab_line[0];
						$addRelation = "INSERT INTO meta_tag_to_doc (meta_tag_id, doc_id) VALUES ('$GenreID', '$newDocID')";
						mysql_query ($addRelation);
					}
				
				}
				
			}
		}
		
		//Print film details
		echo '<p><a href="http://api.rottentomatoes.com/api/public/v1.0/movies/' . $result->id . '.json?apikey=' . $apikey . '">' . $title;
		
		if(isset($result->year) && ! $year==null){
			echo " (" . $year . "), ";
		}
		
		//Get then Print director name
		if(isset($result->abridged_directors) && ! $directors==null){
			echo "un film réalisé par ";
			foreach ($directors as $director){
				$directorName = $director->name;
				echo $directorName . ", ";
			}
		}
		echo "</a><br>";
		
		//Get then Print actor's names
		if(isset($result->abridged_cast) && ! $actors==null){
			echo "Avec : ";
			foreach ($actors as $actor){
				$actorName = $actor->name;
				echo $actorName . ", ";
			}
		echo "<br>";
		}
		
		//Print genres
		if(isset($result->genres) && ! $genres==null){
			echo "Genres : ";
			foreach ($genres as $genre){
				echo $genre . ", ";
			}
		}
		
		echo "</p>";
		
	}

	mysql_close ($connexion);

?>
<p><a href="film_search.html">Lancer une autre recherche</a></p>
<!-- FOR DVPT PURPOSE ONLY : RESETS ALL TABLES OF DATABASE TO ZERO -->
<form action="empty_db.php">
<input type="submit" value="Vider la base de données" >
</form>
</body>
</html>