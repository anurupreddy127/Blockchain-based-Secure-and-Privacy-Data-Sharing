<!DOCTYPE HTML>
<html>
	<head>
		<title>A Secure and Privacy Data Sharing with Example </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body style="background-image: url(./images/upload01.jpg);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="shome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="shome.jsp">Home</a>
						<a href="upload.jsp">Upload Food</a>
						<a href="sproduct.jsp">Send Food</a>
					<!-- 	<a href="sverify.jsp">Verify</a> -->
						<a href="scourier.jsp">Courier</a>
						<a href="logout.jsp">Logout</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Upload Food</h1>
						<form action="Upload" method="post" enctype="multipart/form-data">
						<table>
						<tr><td>ProductId</td><td><input type="text" name="pid"></td></tr>
						<tr><td>Product</td><td><input type="text" name="pro"></td></tr>
						<tr><td>Name</td><td><input type="text" name="pname"></td></tr>
						<tr><td>Features</td><td><input type="text" name="fea"></td></tr>
						<tr><td>Price</td><td><input type="text" name="cost"></td></tr>
						<tr><td>Quantity</td><td><input type="text" name="qun"></td></tr>
						<tr><td>Image</td><td><input type="file" name="img"></td></tr>
						<tr><td><input type="submit" value="Upload"></td></tr>
						</table>
						</form>
					</header>

				</div>
			</section>




		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>