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
		
		//Get TITLE
		if(isset($result->title)){
			$title = $result->title;
		}
		
		//Get YEAR
		if(isset($result->year)){
			$year = $result->year;
		}

		//Send TITLE and YEAR to DB
		
		$sql = "SELECT * FROM film_title_table WHERE rotten_tomatoes_api_id='$id'";
			
		$sqlResult = mysql_query ($sql);
		
		if (! $tab_line = mysql_fetch_row($sqlResult)){
							
			$writeFilmTitle = "INSERT INTO film_title_table (film_title, release_year, rotten_tomatoes_api_id) VALUES ('$title', '$year', '$id')";
			mysql_query ($writeFilmTitle);
			
			$newDoc = "INSERT INTO doc (doc_title, doc_usage) VALUES ('$title', '1')";
			mysql_query ($newDoc);
			
		}
		
		//Get DIRECTOR NAME and send to DB
		if(isset($result->abridged_directors)){
			$directors = $result->abridged_directors;
			
			foreach ($directors as $director){
				$directorName = $director->name;
		
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$directorName'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeDirector = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$directorName', '1')";
					mysql_query ($writeDirector);
				
				}
			
			}
		
		}
		
		//Get CAST NAMES and send to DB
		if(isset($result->abridged_cast)){
			$actors = $result->abridged_cast;
			
			foreach ($actors as $actor){
				$actorName = $actor->name;
		
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$actorName'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeActor = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$actorName', '3')";
					mysql_query ($writeActor);
				
				}
			
			}
		}
		
		//Get GENRES and send to DB
		if(isset($result->genres)){
			$genres = $result->genres;
			
			foreach ($genres as $genre){
		
				$sql = "SELECT * FROM meta_tag WHERE meta_tag_title='$genre'";
			
				$sqlResult = mysql_query ($sql);
		
				if (! $tab_line = mysql_fetch_row($sqlResult)){
								
					$writeGenre = "INSERT INTO meta_tag (meta_tag_title, meta_tag_type) VALUES ('$genre', '4')";
					mysql_query ($writeGenre);
				
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
</body>
</html>