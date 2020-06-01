<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
int LoginID=(int)session.getAttribute("LoginID");
session.setAttribute("LoginID",LoginID); 

String pdctID=request.getParameter("pdctID");
String pdctName=request.getParameter("pdctName");
String minSellQuant=request.getParameter("minquant");
String price=request.getParameter("price");
String Quant=request.getParameter("quantity");
int TotalCost=Integer.parseInt(price)*Integer.parseInt(Quant);

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();

int n=st.executeUpdate("INSERT INTO ProductDetails(pdctID,pdctName,minSellQuant,price,Quant,TotalCost) values('"+pdctID+"','"+pdctName+"','"+minSellQuant+"','"+price+"','"+Quant+"','"+TotalCost+"')");

if(n==1)
{
	%>
	<script> 
       alert("Product Added");
	</script>
	<% 
	response.sendRedirect("admin.html"); %>
	<% 
}
%>
</body>
</html>