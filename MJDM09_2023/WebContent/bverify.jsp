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
					session = request.getSession(false);
					%>
						<h1>Product Key Verification</h1>
					</header>
					<table>
					<tr><th style="color: white;">ID</th><th style="color: white;">Delivery Boy</th>
					<th style="color: white;">Send Key</th></tr>
					<%
					String sql = "select * from breq where userid='"+session.getAttribute("uid")+"' and status1='pending'";
					List<String> lt = Dao.getReq(sql);
					Iterator<String> itr = lt.iterator();
					while(itr.hasNext()){
						String id = itr.next();
						String db = itr.next();
					%>
					<tr><td style="color: white;"><%=id %></td><td style="color: white;"><%=db %></td>
					<td><a href="bskey.jsp?id=<%=id%>&&db=<%=db%>" class="button special">Send Key</a></td></tr>
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