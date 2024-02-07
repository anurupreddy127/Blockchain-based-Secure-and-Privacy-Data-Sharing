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
						<h1>Company Details</h1>
						<%
							String com = request.getParameter("com");
							String sql = "select * from seller where company like'%"+com+"%'";
							List<String> lt = Dao.getSeller(sql);
							Iterator<String> itr = lt.iterator();
						%>
						<table>
						<tr><td style="color: white;">Name</td><td style="color: white;">Email</td>
						<td style="color: white;">Mobile</td><td style="color: white;">Company</td>
						<td style="color: white;">Location</td><td style="color: white;">Send Request</td></tr>
						<%
						while(itr.hasNext()){
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%String sid=itr.next(); %><%=sid %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td>
						<td><a href="MakeReq?sid=<%=sid %>" class="button special">Send Request</a></tr>
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