<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>A Secure and Privacy Data Sharing with Example</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body style="background-image: url(./images/customer01.jpg);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="ahome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="ahome.jsp">Home</a>
						<a href="abuyer.jsp">Customer</a>
						<a href="aseller.jsp">Resturant</a>
						<a href="aproduct.jsp">Dishes</a>
						<a href="areq.jsp">Request</a>
						<a href="index.html">Logout</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Buyer Details</h1>
						<%
						String sql = "select * from buyer";
							List<String> lt = Dao.getBuyer(sql);
							Iterator<String> itr = lt.iterator();
						%>
						<table>
						<tr><td style="color: white;">Name</td><td style="color: white;">Email</td>
						<td style="color: white;">Mobile</td><td style="color: white;">Location</td>
						<td style="color: white;">Address</td></tr>
						<%
						while(itr.hasNext()){
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td></tr>
						<%} %>
						</table>
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