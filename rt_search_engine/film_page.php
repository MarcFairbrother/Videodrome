<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<?php

	//Connect to DB
	include 'db_connection.php';

	$filmID = $_GET['film'];

	$sql = "SELECT film_title, release_year, data, poster FROM films WHERE film_title_id='$filmID'";
	$sqlResult = mysql_query($sql);

	while ($row = mysql_fetch_row($sqlResult)){
	
		$title = $row[0];
		$year = $row[1];
		$detail = $row[2];
		$posterURL = $row[3];
	
	}
	
	mysql_close ($connexion);

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
	height:100vh;
	position:relative;
	background-image:url('../img/player.jpg');
	background-repeat:no-repeat;
	background-position:center; 
}
#annotate{
	border:0;
	margin:-1px -5px;
	background:transparent;
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
			<?php echo $detail ?>
		</div>
		<nav class="scroll_arrow">
			<img src="../img/arrow_down.png" alt="Scroller" id="toPlayer"/>
		</nav>
	</section>
	<section id="player">
		<nav class="scroll_arrow">
			<img src="../img/arrow_up.png" alt="Scroller" id="toTop"/>
		</nav>
	</section>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
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
	</script>
</body>
</html>