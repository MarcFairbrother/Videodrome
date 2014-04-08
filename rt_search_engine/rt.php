<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title></title>
</head>
<body>
<?php
	if (!function_exists('curl_init')){
		die('CURL is not installed!');
	}

	if(isset($_POST["filmTitle"])){
		$query=$_POST["filmTitle"];
		
		//$query=$_GET["q"];
		$apikey = 'grg2t2pmwkzc26f9xbewwns5';
		$q = urlencode($query); // make sure to url encode an query parameters
		
		// construct the query with our apikey and the query we want to make
		$endpoint = 'http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=' . $apikey . '&q=' . $q;
		
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
		
		//Get TITLE and send TITLE & ID to DB/film_title_table
		if(isset($result->title)){
			$title = $result->title;
			
			$connexion = mysql_connect ("localhost", "root", "");
			$select = mysql_select_db ("videodrome", $connexion);
			$sql = "SELECT * FROM film_title_table WHERE rotten_tomatoes_api_id='$id'";
			
			$sqlResult = mysql_query ($sql);
			
			if(! $sqlResult==$id){
				
				$write = "INSERT INTO film_title_table (film_title, rotten_tomatoes_api_id) VALUES ('$title', '$id')";
				
				mysql_query ($write);
				
				mysql_close ($connexion);
			
			}
			else{
			
				mysql_close ($connexion);
			
			}
			
		}
		
		//Get year
		if(isset($result->year)){
			$year = $result->year;
		}
		
		//Get director details
		if(isset($result->abridged_directors)){
			$directors = $result->abridged_directors;
		}
		
		//Get cast details
		if(isset($result->abridged_cast)){
			$actors = $result->abridged_cast;
		}
		
		//Get genres
		if(isset($result->title)){
			$genres = $result->genres;
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
				
		//Button to send info to DB
		//echo '<form><input type="submit" value="Sélectioner ce film" ></form>';
		
	}

?>
</body>
</html>