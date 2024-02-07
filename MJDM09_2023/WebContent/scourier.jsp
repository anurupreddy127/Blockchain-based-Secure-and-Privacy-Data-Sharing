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
					<a href="shome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="shome.jsp">Home</a>
						<a href="upload.jsp">Upload food</a>
						<a href="sproduct.jsp">Send food</a>
					<!-- 	<a href="sverify.jsp">Verify</a> -->
						
						<a href="logout.jsp">Logout</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Courier Request</h1>
						<table>
						<tr><th style="color: white;">Name</th><th style="color: white;">Email</th>
						<th style="color: white;">Mobile</th><th style="color: white;">Company</th>
						<th style="color: white;">Location</th><th style="color: white;">Approve</th></tr>
						<%
						session = request.getSession(false);
						String sql = "select * from creq where sid='"+session.getAttribute("uid")+"' and status1='pending'";
						List<String> lt = Dao.getCReq(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
							String cid = itr.next();
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=cid %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td>
						<td><a href="SApprove?cid=<%=cid%>">Approve</a></td></tr>
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