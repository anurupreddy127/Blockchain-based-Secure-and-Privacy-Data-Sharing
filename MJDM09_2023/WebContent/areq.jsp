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
		<body style="background-image: url(./images/req.jpg);">
	

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
						<h1>Send Key</h1>
						<table>
						<tr><th style="color: white;">ProductId</th><th style="color: white;">Product Name</th>
						<th style="color: white;">Quantity</th><th style="color: white;">Price</th>
						<th style="color: white;">Key</th><th style="color: white;">Send Key</th></tr>
						<%
						String sql = "select * from pkey where Astatus='pending'";
						List<String> lt = Dao.getUKey(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
							int id = Integer.parseInt(itr.next());
							sql = "select qun from orders where id="+id;
							String qun = Dao.getName(sql);
							sql = "select price from orders where id="+id;
							String price = Dao.getName(sql);
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=qun %></td><td style="color: white;"><%=price %></td>
						<td style="color: white;"><%=itr.next() %></td>
						<td><a href="SendKey?id=<%=id%>" class="button special">Send Key</a></td></tr>
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