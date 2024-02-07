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
						<h1>Product Key</h1>
						<form action="SendDB" method="post">
						<table>
						<tr><th style="color: white;">Id</th><th style="color: white;">UserId</th>
						<th style="color: white;">ProductId</th><th style="color: white;">Product Name</th>
						<th style="color: white;">Quantity</th><th style="color: white;">Price</th>
						<th style="color: white;">Key</th><th style="color: white;">Delivery Boy</th>
						<th style="color: white;">Send Key</th></tr>
						<%
						String ui = request.getParameter("uid");
						int d = Integer.parseInt(request.getParameter("id"));
						String sql = "select * from pkey where sstatus='pending' and cid='"+session.getAttribute("uid")+"'";
						List<String> lt = Dao.getKey(sql);
						Iterator<String> itr = lt.iterator();
						while(itr.hasNext()){
							int id = Integer.parseInt(itr.next());
							sql = "select qun from orders where id="+id;
							String qun = Dao.getName(sql);
							sql = "select price from orders where id="+id;
							String price = Dao.getName(sql);
							sql = "select location from buyer where email='"+ui+"'";
							String loc = Dao.getName(sql);
							sql = "select email from deliveryboy where location='"+loc+"' and cid='"+session.getAttribute("uid")+"'";
							List<String> lt1 = Dao.getCId(sql);
							Iterator<String> itr1 = lt1.iterator();
						%>
						<tr><td><input type="text" name="id" value="<%=id%>"></td>
						<td><input type="text" name="uid" value="<%=itr.next()%>"></td>
						<td><input type="text" name="pid" value="<%=itr.next() %>"></td>
						<td><input type="text" name="pname" value="<%=itr.next() %>"></td>
						<td><input type="text" name="qun" value="<%=qun %>"></td>
						<td><input type="text" name="price" value="<%=price %>"></td>
						<td><input type="text" name="key" value="<%=itr.next() %>"></td>
						<td><select name="db">
						<option>----Select----</option>
						<%
							while(itr1.hasNext()){
								String n = itr1.next();
						%>
						<option value="<%=n%>"><%=n %></option>
						<%} %>
						</select></td>
						<td><input type="submit" value="Send"></td></tr>
						<%} %>
						</table>
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