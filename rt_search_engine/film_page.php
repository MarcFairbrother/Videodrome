<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<?php

	//Connect to DB
	include 'db_connection.php';

	$filmID = $_GET['film'];

	$sql = "SELECT film_title, release_year, data, poster FROM films WHERE film_title_id='$filmID'";
	$sqlResult = mysqli_query($connexion, $sql);

	while ($row = mysqli_fetch_row($sqlResult)){
	
		$title = $row[0];
		$year = $row[1];
		$detail = $row[2];
		$posterURL = $row[3];
	
	}
	
	//Fetch annotations where current Movie is source
	
	$sql = "SELECT annotation_title, target_movie_id, brief_description, annotation_description FROM user_annotation WHERE source_movie_id='$filmID'";
	$sqlResult = mysqli_query($connexion, $sql);
	
	$annotationCounter = 0;
	
	$arrAnnotation=[
			"foo" => "bar",
			"bar" => "foo",
		];
	
	while ($row = mysqli_fetch_row($sqlResult)){
		
		$sql = "SELECT film_title, release_year FROM films WHERE film_title_id='$row[1]'";
		$sqlMovie = mysqli_query($connexion, $sql);
		
		while($rowMovie = mysqli_fetch_row($sqlMovie)){
		
			$linkedMovie = "<a href='film_page.php?film=".$row[1]."' >".$rowMovie[0]." (".$rowMovie[1].")</a>";
		
		}
	
		$arrAnnotation[$annotationCounter]= "<strong>Titre de l'annotation:</strong> ".$row[0]."<br><strong>Descriptif:</strong> ".$row[2]."<br><strong>Lié au film:</strong> ".$linkedMovie."<br><strong>Détail:</strong> ".$row[3]."<br><br>";
	
		$annotationCounter++;
	
	}
	
	//Fetch annotations where current Movie is target
	
	$sql = "SELECT annotation_title, source_movie_id, brief_description, annotation_description FROM user_annotation WHERE target_movie_id='$filmID'";
	$sqlResult = mysqli_query($connexion, $sql);
	
	$annotationCounterInverted = 0;
	
	$arrAnnotationInverted=[
			"foo" => "bar",
			"bar" => "foo",
		];
	
	while ($row = mysqli_fetch_row($sqlResult)){
		
		$sql = "SELECT film_title, release_year FROM films WHERE film_title_id='$row[1]'";
		$sqlMovie = mysqli_query($connexion, $sql);
		
		while($rowMovie = mysqli_fetch_row($sqlMovie)){
		
			$linkedMovieInverted = "<a href='film_page.php?film=".$row[1]."' >".$rowMovie[0]." (".$rowMovie[1].")</a>";
		
		}
	
		$arrAnnotationInverted[$annotationCounterInverted]= "<strong>Titre de l'annotation:</strong> ".$row[0]."<br><strong>Descriptif:</strong> ".$row[2]."<br><strong>Lié au film:</strong> ".$linkedMovieInverted."<br><strong>Détail:</strong> ".$row[3]."<br><br>";
	
		$annotationCounterInverted++;
	
	}
	
	mysqli_close ($connexion);

?>
<title><?php echo $title ?></title>
<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
<style>
body{
	font-family: 'Ubuntu', sans-serif;
	padding:0;
	margin:0;
	background-image:url('../img/logo.png');
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-position:center; 
}
h1{
	color:#d51b17;
}
img{
	margin:0;
	padding:0;
	border:0;
}
header{
	width:100%;
	text-align:center;
	position:fixed;
	top:0;
	z-index:1;
}
.scroll_arrow{
	width:100%;
	text-align:center;
	position:absolute;
	bottom:10px;
}
.scroll_arrow img{
	border-radius:25px;
}
.scroll_arrow img:hover{
	box-shadow:inset 0 0 8px #891b1f;
}
#landing{
	width:100%;
	height:100vh;
	text-align:center;
	position:relative;
}
#poster{
	margin-top:35vh;
	border:solid 1px #000;
}
#cast{
	width:100%;
	height:75vh;
	position:relative;
	padding-top:25vh;
}
#castDetails{
	width:50vw;
	height:50vh;
	margin:auto;
	padding:5px;
	font-size:15px;
	line-height:150%;
	color:#d51b17;
	border:solid 1px #000;
	background:rgba(255,255,255,0.85);
	overflow-y:scroll;
	overflow-x:hidden;
}
#castDetails::-webkit-scrollbar {
    width: 1em;
}
#castDetails::-webkit-scrollbar-track {
	background-color: rgba(255,255,255,0);
}
#castDetails::-webkit-scrollbar-thumb {
	background-color: #d51b17;
}
#player{
	width:100%;
	height:55vh;
	padding-top:45vh;
	position:relative;
	background-image:url('../img/player.jpg');
	background-repeat:no-repeat;
	background-position:center; 
}
#Form{
	width:25vw;
	margin:0 auto;
	background:#fff;
}
#message{
	color:#d51b17;
	text-align:center;
}
#movieResults{
	width:25vw;
	margin:0 auto;
	background:#fff;
}
</style>
</head>
<body>
	<header>
		<?php echo "<h1>" . $title . " (" . $year .")</h1>"; ?>
	</header>
	<section id="landing">
		<img id="poster" src="<?php echo $posterURL ?>" alt="<?php echo $title ?>"/>
		<nav class="scroll_arrow">
			<img src="../img/arrow_down.png" alt="Scroller" id="toCast"/>
		</nav>
	</section>
	<section id="cast">
		<div id="castDetails">
			<?php
				echo $detail;
				
				echo "<br><br>";
				
				$i = 0;
				
				while($i<$annotationCounter){
				
					echo $arrAnnotation[$i]."<br>";
					
					$i++;
					
				}
				
				echo "<br><br>";
				
				$i = 0;
				
				while($i<$annotationCounterInverted){
				
					echo $arrAnnotationInverted[$i]."<br>";
					
					$i++;
					
				}
				
			?>
		</div>
		<nav class="scroll_arrow">
			<img src="../img/arrow_down.png" alt="Scroller" id="toPlayer"/>
		</nav>
	</section>
	<section id="player">
			<div id="message" style="display:none">
			</div>
			<form action="" id="Form" method="post">
                <fieldset>
                    <legend>Lier à un autre film</legend>
                    <p>
                        <label for="movieSearch">Titre du film:</label>
                        <input type="text" name="movieSearch" id="movieSearch" value="" />
                    </p>
                    <p>
                        <input type="submit" name="filmSearch" id="filmSearch" style="float: right; clear: both; margin-right: 3px;" value="Chercher le film" />
                    </p>
                </fieldset>
            </form>
			<div id="movieResults"></div>
            
		<nav class="scroll_arrow">
			<img src="../img/arrow_up.png" alt="Scroller" id="toTop"/>
		</nav>
	</section>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
	
		//Scrolling animations
	
		$("#poster").click(function() {
			$('html, body').animate({
				scrollTop: $("#player").offset().top
			}, 800);
		});
		$("#toCast").click(function() {
			$('html, body').animate({
				scrollTop: $("#cast").offset().top
			}, 800);
		});
		$("#toPlayer").click(function() {
			$('html, body').animate({
				scrollTop: $("#player").offset().top
			}, 800);
		});
		$("#toTop").click(function() {
			$('html, body').animate({
				scrollTop: $("#landing").offset().top
			}, 800);
		});
		
		//Ajax
		
		$(document).ready(function(){
			$('#filmSearch').click(function() {

				$('#Form').hide(0);
				$('#message').hide(0);
				
				var sourceMovie = <?php echo json_encode($filmID); ?>;

				$.ajax({
					type : 'POST',
					url : 'post.php',
					dataType : 'json',
					data: {
						movieSearch : $('#movieSearch').val()
					},
					success : function (data) {
						$("#movieResults").html("<form id='moviesLinks' action='annotate.php' method='post'></form>");
						$("#moviesLinks").append("<input name='sourceMovie' type='hidden' value='" + sourceMovie + "'><br>");
						$("#moviesLinks").append("<input name='annotationTitle' type='text' value='Choisissez un titre'><br>");
						$("#moviesLinks").append("<input name='briefDescription' type='text' value='Description brève de l'annotation'><br>");
						data.msg.forEach(function(film){
							$("#moviesLinks").append("<input class='movieChoices' type='radio' name='filmChoice' value='" + film.id + "'><a href='film_page.php?film=" + film.id + "'>" + film.id + ": " + film.title + "</a><br>");
						});
						$("#moviesLinks").append("<input name='annotationDescription' type='text' value='Expliquez les raisons de l'annotation'><br>");
						$("#moviesLinks").append("<select name='annotationType'><option value='0' selected>Raison de l'annotation</option><option value='5'>Décors et costumes</option><option value='6'>Référence ou citation</option><option value='7'>Personnage récurrent</option><option value='8'>Thème ou sujet</option><option value='9'>Mise en scène</option>");
						$("#moviesLinks").append("<input type='submit'>");
						if (data.error === true)
						$('#Form').show(500);
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						$('#message').removeClass().addClass('error')
							.text('There was an error.').show(500);
						$('#Form').show(500);
					}
				});

				return false;
				
			});
		});
		
	</script>
</body>
</html>