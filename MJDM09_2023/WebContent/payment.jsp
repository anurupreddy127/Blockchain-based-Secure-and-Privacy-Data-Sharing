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
					<a href="bhome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="bhome.jsp">Home</a>
						<a href="bdeposit.jsp">Account</a>
						<a href="search.jsp">Search</a>
						<a href="bkey.jsp">Request</a>
						<a href="bverify.jsp">Key</a>
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
							String id = request.getParameter("id");
							double cost = Double.parseDouble(request.getParameter("price"));
							int qun = Integer.parseInt(request.getParameter("qun"));
							/* System.out.println(cost); */
					%>
						<h1>Payment</h1>
						<form action="Payment" method="post">
						<input type="hidden" name="id" value="<%=id%>">
						
						<table>
						<tr><td>Account</td><td><input type="password" name="acc"></td></tr>
						<tr><td>Password</td><td><input type="password" name="pwd"></td></tr>
						<tr><td>Price</td><td><input type="text" name="price" value="<%=(cost * qun)%>"></td></tr>
						<tr><td>Quantity</td><td><input type="text" name="qun" value="<%=qun%>"></td></tr>
						<tr><td><input type="submit" value="Payment"></td></tr>
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