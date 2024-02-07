<!DOCTYPE HTML>
<%@page import="java.util.Iterator"%>
<%@page import="com.dao.Dao"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<title>Blockchain based Secure and Privacy Data Sharing</title>
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
						<h1>Delivery Boys List</h1>
					</header>
					<table>
					<tr><th style="color: white;">ID</th><th style="color: white;">Name</th>
					<th style="color: white;">Email</th><th style="color: white;">Mobile</th>
					<th style="color: white;">Location</th></tr>
					<%
					String sql = "select * from deliveryboy where cid='"+session.getAttribute("uid")+"'";
					List<String> lt = Dao.getDb(sql);
					Iterator<String> itr = lt.iterator();
					while(itr.hasNext()){
					%>
					<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
					<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
					<td style="color: white;"><%=itr.next() %></td></tr>
					<%} %>
					</table>

				</div>
			</section>




		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>