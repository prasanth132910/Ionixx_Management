<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();


String pdctName=request.getParameter("pdctName");
System.out.println(pdctName);
int price=Integer.parseInt(request.getParameter("price"));
int Quant=Integer.parseInt(request.getParameter("Quant"));
int TotalCost=Quant*price;

String sql="Update   productdetails set price="+price+",pdctName='"+pdctName+"', Quant="+Quant+", TotalCost="+TotalCost+" WHERE pdctID='"+session.getAttribute("id")+"'";
System.out.println(sql);
st.execute(sql);
response.sendRedirect("ViewProductList.jsp");
%>
</body>
</html>