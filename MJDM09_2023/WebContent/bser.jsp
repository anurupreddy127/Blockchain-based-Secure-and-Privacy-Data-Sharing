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
		<link rel="stylesheet" href="w3.css">
	</head>
	<body style="background-image: url(./images/coin.jpg);">

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
							String pname = request.getParameter("pname");
							String sql = "select * from product where product='"+pname+"'";
							List<String> lt = Dao.getCourier(sql);
							%>
						</header>
						<%
						Iterator<String> itr = lt.iterator();
						String s2;
						while(itr.hasNext()){
							s2 = itr.next();
							String s3 = "Product.jsp?id="+s2; 
						%>
						<div >
						<table>
						<tr>
						<td>
						<table>
						<tr><td><%
								String s="photo.jsp?name="+s2;
								%>
							<img src=<%=s %> height="200px" width="200px"></td>
							<td><%=itr.next() %></td><td ><%=itr.next()%></td>
							<td><%=itr.next() %></td><td><%=itr.next() %></td>
							<td><%=itr.next()%></td><td ><%=itr.next()%></td>
							</table></td><td>
							<table>
							<tr><td><a href=<%=s3 %>><%=s2 %></a></td></tr>
								<tr></tr>
								<tr></tr>
								</table>
								</td></tr>
							</table>
						</div>
						<%} %>
					

				</div>
			</section>




		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>