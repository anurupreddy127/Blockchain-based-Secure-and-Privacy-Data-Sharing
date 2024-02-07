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
	<body style="background-image: url(./images/rafi.jpg);">

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="shome.jsp" class="logo">Blockchain based Secure and Privacy Data Sharing </a>
					<nav id="nav">
						<a href="shome.jsp">Home</a>
						<a href="upload.jsp">Upload Product</a>
						<a href="sproduct.jsp">Send Product</a>
					<!-- 	<a href="sverify.jsp">Verify</a> -->
						<a href="scourier.jsp">Courier</a>
						<a href="logout.jsp">Logout</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Send Product</h1>
						<table>
						<tr><th style="color: white;">User</th><th style="color: white;">ProductId</th>
						<th style="color: white;">Name</th><th style="color: white;">Quantity</th>
						<th style="color: white;">Price</th><th style="color: white;">Send</th></tr>
						<%
						session = request.getSession(false);
						String sql = "select * from orders where com ='"+session.getAttribute("com")+"' and status1='pending'";
						List<String> lt = Dao.getSOrder(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
							String id = itr.next();
						%>
						<tr><td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td><td style="color: white;"><%=itr.next() %></td>
						<td style="color: white;"><%=itr.next() %></td>
						<td><a href="sendproduct.jsp?id=<%=id%>" class="button special">Send Product</a></td></tr>
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