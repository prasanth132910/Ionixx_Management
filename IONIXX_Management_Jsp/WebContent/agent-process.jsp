<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/log.css">
</head>
<body>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
int LoginID=(int)session.getAttribute("LoginID");
session.setAttribute("LoginID",LoginID); 
Statement st=conn.createStatement();
%>


<form action="Transaction-Process.jsp" method="post">
<table>
<tr>
<td>
Buy/Sell
</td>
<td>
<input type="text" name="TransType">
</td>
</tr>

<tr>
<td>Product ID</td>
<td><input type="text" name="pdID"></td>
</tr>

<tr>
<td>Quantity </td>
<td><input type="text" name="Quant"></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="submit"><td>

</tr>

</form>

</body>

</html>