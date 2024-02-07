<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
Statement stmt1 = null;
ResultSet rs = null;
ResultSet rs1 = null;
OutputStream o =null;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vtjnw07_2019","root","root");
stmt = con.createStatement();
//stmt1 = con.createStatement();
String mail=request.getParameter("name");
String db=request.getParameter("db");
String 	sql = "select Image from product where PId='"+mail+"'";
rs = stmt.executeQuery(sql);
if (rs.next()) {
image = rs.getBlob("Image");
imgData = image.getBytes(1,(int)image.length());
} 
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
// display the image
response.setContentType("image/jpg");
o= response.getOutputStream();%>
<img alt="logo" src="<%o.write(imgData);%>" width="30%" height="20%">
<% 

} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} finally {
try {
	
rs.close();
stmt.close();
con.close();
o.flush();
o.close();
} catch (Exception e) {
}
}
%>
</body>
</html>