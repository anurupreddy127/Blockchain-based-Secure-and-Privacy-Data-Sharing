<!DOCTYPE HTML>
<html>
	<head>
		<title>A Secure and Privacy Data Sharing with Example</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body style="background-image: url(./images/rafi.jpg);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="shome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="shome.jsp">Home</a>
						<a href="upload.jsp">Upload Product</a>
						<a href="sproduct.jsp">Send Product</a>
						<!-- <a href="sverify.jsp">Verify</a> -->
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
					<%
					session = request.getSession(false);
					%>
						<h1>Welcome to <%=session.getAttribute("name") %></h1>
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