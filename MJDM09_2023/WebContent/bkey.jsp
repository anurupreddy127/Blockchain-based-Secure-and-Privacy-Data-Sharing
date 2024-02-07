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
	<body style="background-image: url(./images/food.jpg);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="bhome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing</a>
					<nav id="nav">
						<a href="bhome.jsp">Home</a>
						<a href="bdeposit.jsp">Account</a>
						<a href="search.jsp">Search</a>
						<a href="bkey.jsp">Dishes</a>
						<a href="bverify.jsp">Verify</a>
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
						<h1>Product Key</h1>
						<table>
						<tr><th style="color: white;">ProductId</th><th style="color: white;">ProductId</th>
						<th style="color: white;">Product Name</th><th style="color: white;">Quantity</th>
						<th style="color: white;">Price</th><th style="color: white;">Key</th></tr>
						<%
						String sql = "select * from pkey where uid='"+session.getAttribute("uid")+"' and Astatus='Approved'";
						List<String> lt = Dao.getUKey(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
							int id = Integer.parseInt(itr.next());
							sql = "select qun from orders where id="+id;
							String qun = Dao.getName(sql);
							sql = "select price from orders where id="+id;
							String price = Dao.getName(sql);
						%>
						<tr><td style="color: white;"><%=id %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=qun %></td><td style="color: white;"><%=price %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td></tr>
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