<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="log.css">
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();
int PdctID=Integer.parseInt(request.getParameter("pdctID"));
System.out.println(PdctID);
String sql="DELETE FROM productdetails WHERE pdctID='"+PdctID+"'";
System.out.println(sql);
st.execute(sql);
response.sendRedirect("ViewProductList.jsp");
%>


 
</body>
</html>