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
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="ahome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing</a>
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
						<h1>Product Details</h1>
						<table>
						<tr><th style="color: white;">ProductId</th><th style="color: white;">Product</th>
						<th style="color: white;">Name</th><th style="color: white;">Company</th>
						<th style="color: white;">Features</th><th style="color: white;">Cost</th>
						<th style="color: white;">Quantity</th></tr>
						<%
						String sql = "select * from product";
						List<String> lt = Dao.getCourier(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
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