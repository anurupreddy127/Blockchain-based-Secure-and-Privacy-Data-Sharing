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
					<a href="dhome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="dhome.jsp">Home</a>
						<a href="dkey.jsp">product Key</a>
						<a href="dverify.jsp">customer Key</a>
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
						<h1>Product Keys</h1>
					</header>
					<table>
					<tr><th style="color: white;">UserId</th><th style="color: white;">ProductId</th>
					<th style="color: white;">Name</th><th style="color: white;">Quantity</th>
					<th style="color: white;">Price</th><th style="color: white;">Key</th>
					<th style="color: white;">Request</th></tr>
					<%
					String sql = "Select * from dkey where did='"+session.getAttribute("uid")+"' and dstatus='pending'";
					List<String> lt = Dao.getDKeys(sql);
					Iterator<String> itr = lt.iterator();
					while(itr.hasNext()){
						String id = itr.next();
						String uid = itr.next();
					%>
					<tr><td style="color: white;"><%=uid %></td><td style="color: white;"><%=itr.next() %></td>
					<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
					<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
					<td><a href="BReq?id=<%=id%>&&uid=<%=uid%>" class="button special">Key Request</a></td></tr>
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