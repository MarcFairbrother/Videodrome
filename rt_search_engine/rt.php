<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>Moteur de recherche par titre de film</title>
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
			
		echo '<ul>';
		
		//Search for up to five results in DB
		
		$sql = "SELECT film_title, release_year, rotten_tomatoes_api_id, film_title_id FROM films WHERE UPPER(data) LIKE UPPER('%$query%')";
		
		$sqlResult = mysqli_query($connexion, $sql);
		
		$i=0;
		
		$arrResult=[
			"foo" => "bar",
			"bar" => "foo",
		];
		
		while (($row = mysqli_fetch_row($sqlResult)) && ($i < 5)){
			
			$i++;
			
			echo  '<li>' . $i . '/' . '<a href="film_page.php?film=' . $row[3] . '">' . $row[0] . ' (' . $row[1] . ')</a> (DB)</li>';
			
			$arrResult[$row[2]]=$row[0];
			
		}
		
		//Search Rotten Tomatoes API for extra results up to total of five
		if($i<5){
		
			$apikey = '';
			$q = urlencode($query); // make sure to url encode query parameters

			// construct the query with our apikey and the query we want to make
			$endpoint = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=' . $apikey . '&q=' . $q . '&page_limit=5';

			$search_results = getJsonCurl($endpoint);

			// play with the data!
			$movies = $search_results->movies;
			
			foreach ($movies as $movie){
				
				//EXCLUDE DB RESULTS FROM API RESULTS
				
				if(!array_key_exists($movie->id, $arrResult) && $i < 5){
				
					$i++;
				
					echo '<li>' . $i ."/";
					$details = getDetailMovie($movie->id);
					echo '</li>';
				
				}
			
			}
		
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
		
		/*decode the json data to make it easier to parse the php
		echo $data;
		*/
		
		$search_results = json_decode($data);
		
		if ($search_results === NULL) die('Error parsing json');
		
		return $search_results;
		
	}
	
	function getDetailMovie($id){
	
		global $apikey;
		global $connexion;
		
		$url = "http://api.rottentomatoes.com/api/public/v1.0/movies/" . $id . ".json?apikey=". $apikey;
		$result = getJsonCurl($url);
		
		//Send TITLE, YEAR and JSON to DB
		if(isset($result->title)){
			$title = $result->title;
			$titleEscaped = mysqli_real_escape_string($connexion, $title);

			if(isset($result->year)){
				$year = $result->year;
			}

			if(isset($result->posters->profile)){
				$posterURL = $result->posters->profile;
				$posterEscaped = mysqli_real_escape_string($connexion, $posterURL);
			}
			
			$sql = "SELECT * FROM films WHERE rotten_tomatoes_api_id='$id'";
			
			$sqlResult = mysqli_query($connexion, $sql);
			
			if (! $tab_line = mysqli_fetch_row($sqlResult)){
			
				$RTdata = json_encode($result);
				$RTdataEscaped = mysqli_real_escape_string($connexion, $RTdata);
				
				$sql = "INSERT INTO films (film_title, release_year, rotten_tomatoes_api_id, data,  poster) VALUES ('$titleEscaped', '$year', '$id', '$RTdataEscaped', '$posterEscaped')";
				mysqli_query($connexion, $sql);
				$FilmTitleID = mysqli_insert_id($connexion);
				
				$sql = "INSERT INTO doc (doc_title, doc_usage, film_title_id) VALUES ('$titleEscaped', '1', '$FilmTitleID')";
				mysqli_query($connexion, $sql);
				$newDocID = mysqli_insert_id($connexion);		
				
			}
			
		}
	
		//Get DIRECTOR NAME and send to DB
		if(isset($result->abridged_directors)){
			$directors = $result->abridged_directors;
			
			foreach ($directors as $director){
				$directorName = $director->name;
				$directorNameEscaped =  mysqli_real_escape_string($connexion, $directorName);
		
				$sql = "SELECT * FROM cast WHERE cast_name='$directorNameEscaped' AND cast_status='director'";
			
				$sqlResult = mysqli_query($connexion, $sql);
		
				if (! $tab_line = mysqli_fetch_row($sqlResult)){
								
					$sql = "INSERT INTO cast (cast_name, cast_status) VALUES ('$directorNameEscaped', 'director')";
					mysqli_query($connexion, $sql);
					$DirectorID = mysqli_insert_id($connexion);
					
					$sql = "INSERT INTO cast_to_film_title (cast_id, film_title_id) VALUES ('$DirectorID', '$FilmTitleID')";
					mysqli_query($connexion, $sql);
				
				}
				else{
				
					$fetchDirectorID = "SELECT * FROM cast WHERE cast_name='$directorNameEscaped' AND cast_status='director'";
					$DirectorResult = mysqli_query($connexion, $fetchDirectorID);
					while ($tab_line = mysqli_fetch_row($DirectorResult)){
						$DirectorID = $tab_line[0];
						$sql = "INSERT INTO cast_to_film_title (cast_id, film_title_id) VALUES ('$DirectorID', '$FilmTitleID')";
						mysqli_query($connexion, $sql);
					}
					
				}
			
			}
		
		}
		
		//Get CAST NAMES and send to DB
		if(isset($result->abridged_cast)){
			$actors = $result->abridged_cast;
			
			foreach ($actors as $actor){
				$actorName = $actor->name;
				$actorNameEscaped =  mysqli_real_escape_string($connexion, $actorName);
		
				$sql = "SELECT * FROM cast WHERE cast_name='$actorNameEscaped' AND cast_status='actor'";
			
				$sqlResult = mysqli_query($connexion, $sql);
		
				if (! $tab_line = mysqli_fetch_row($sqlResult)){
								
					$sql = "INSERT INTO cast (cast_name, cast_status) VALUES ('$actorNameEscaped', 'actor')";
					mysqli_query($connexion, $sql);
					$ActorID = mysqli_insert_id($connexion);
					
					$sql = "INSERT INTO cast_to_film_title (cast_id, film_title_id) VALUES ('$ActorID', '$FilmTitleID')";
					mysqli_query($connexion, $sql);
				
				}
				else{
				
					$sql = "SELECT * FROM cast WHERE cast_name='$actorNameEscaped' AND cast_status='actor'";
					$ActorResult = mysqli_query($connexion, $sql);
					while ($tab_line = mysqli_fetch_row($ActorResult)){
						$ActorID = $tab_line[0];
						$sql = "INSERT INTO cast_to_film_title (cast_id, film_title_id) VALUES ('$ActorID', '$FilmTitleID')";
						mysqli_query($connexion, $sql);
					}
					
				}
			
			}
		}
		
		//Get GENRES and send to DB
		if(isset($result->genres)){
			$genres = $result->genres;
			
			foreach ($genres as $genre){
				$genreEscaped =  mysqli_real_escape_string($connexion, $genre);
				
				$sql = "SELECT * FROM genres WHERE genre_name='$genreEscaped'";
			
				$sqlResult = mysqli_query($connexion, $sql);
		
				if (! $tab_line = mysqli_fetch_row($sqlResult)){
								
					$sql = "INSERT INTO genres (genre_name) VALUES ('$genreEscaped')";
					mysqli_query($connexion,$sql);
					$GenreID = mysqli_insert_id($connexion);
					
					$sql = "INSERT INTO genres_to_film_title (genre_id, film_title_id) VALUES ('$GenreID', '$FilmTitleID')";
					mysqli_query($connexion, $sql);
				
				}
				else{
				
					$sql = "SELECT * FROM genres WHERE genre_name='$genreEscaped'";
					$sqlResult = mysqli_query($connexion, $sql);
					while ($tab_line = mysqli_fetch_row($sqlResult)){
						$GenreID = $tab_line[0];
						$sql = "INSERT INTO genres_to_film_title (genre_id, film_title_id) VALUES ('$GenreID', '$FilmTitleID')";
						mysqli_query($connexion, $sql);
					}
				
				}
				
			}
		
		}
		
		//Print film details
		echo '<a href="film_page.php?film=' . $FilmTitleID . '">' . $title;
		
		if(isset($result->year) && ! $year==null){
			echo " (" . $year . "), ";
		}
		
		//Get then Print director name
		if(isset($directors) && ! $directors==null){
			echo "un film réalisé par ";
			foreach ($directors as $director){
				$directorName = $director->name;
				echo $directorName . ", ";
			}
		}
		echo "</a><br>";
		
		//Get then Print actor's names
		if(isset($actors) && ! $actors==null){
			echo "Avec : ";
			foreach ($actors as $actor){
				$actorName = $actor->name;
				echo $actorName . ", ";
			}
		echo "<br>";
		}
		
		//Print genres
		if(isset($genres) && ! $genres==null){
			echo "Genres : ";
			foreach ($genres as $genre){
				echo $genre . ", ";
			}
		}
	
	}

	mysqli_close ($connexion);

?>
<p><a href="film_search.html">Lancer une autre recherche</a></p>
<!-- FOR DVPT PURPOSE ONLY : RESETS ALL TABLES OF DATABASE TO ZERO -->
<form action="empty_db.php">
<input type="submit" value="Vider la base de données" >
</form>
</body>
</html>