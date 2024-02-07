<!DOCTYPE HTML>
<html>
	<head>
		<title>A Secure and Privacy Data Sharing with Example</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="chome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="chome.jsp">Home</a>
						<a href="cserach.jsp">Search Company</a>
						<a href="cdb.jsp">Add Delivery Boy</a>
						<a href="cdbs.jsp">Delivery Boy</a>
						<a href="ckey.jsp">Provide Key</a>
						<a href="logout.jsp">Logout</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
					<%session = request.getSession(false); %>
						<h1>Search Company</h1>
						<form action="cser.jsp">
						<table>
						<tr><th style="color: white;">Enter Company Name</th><th style="color: white;">Search</th></tr>
						<tr><td><input type="text" name="com"></td><td><input type="submit" value="Search"></td></tr>
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