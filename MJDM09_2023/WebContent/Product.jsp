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
		<link rel="stylesheet" href="w3.css">
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="bhome.jsp" class="logo">A Secure and Privacy Data Sharing with Example </a>
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
							String id = request.getParameter("id");
							String sql = "select * from product where pid='"+id+"'";
							List<String> lt = Dao.getCourier(sql);
							Iterator<String> itr = lt.iterator();
					%>
						<h1>Buy Product</h1>
						<form action="payment.jsp">
						<%while(itr.hasNext()){ 
						itr.next();
						%>
						<div class="w3-text-white w3-blue" style="display: inline-block; width: 80%; height: 100%;margin: 20px;">
						<table  style="width: 900px;">
						<tr><td><table class="w3-table">
						<tr><td><%
								String s="photo.jsp?name="+id;
								%>
						<img src=<%=s %> height="200px" width="200px"></td></tr>
						</table></td><td>
						<table class="w3-table">
						<tr><td><%=id %></td></tr>
						<tr><td><%=itr.next() %></td></tr>
						<tr><td><%=itr.next() %></td></tr>
						<tr><td><%=itr.next()%></td></tr>
						<tr><td ><%=itr.next()%></td></tr>
						<tr><td><%String cost=itr.next();%><%=cost %></td></tr>
						<tr><td ><%=itr.next()%></td></tr>
						</table>
						</td></tr>
						<tr><td>Quantity</td><td><input type="text" name="qun" ></td></tr>
						</table>
						<input type="hidden" name="id" value="<%=id %>">
						<input type="hidden" name="price" value="<%=cost%>">
						<input type="submit" value="Payment" class="button special"></div>
						<%} %>
						</form>
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