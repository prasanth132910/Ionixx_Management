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
<form action="Update-process.jsp" method="get">
 <div class="tbl-header">
  <table cellpadding="0" cellspacing="0" border="0">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();

String id = request.getParameter("id");
session.setAttribute("id", id);
String sql="SELECT *FROM productdetails WHERE pdctID="+id;
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
%>
<tr><td>Product ID</td><td><input type="text" value="<%=rs.getInt("pdctID") %>" name="PdctID" disabled="disabled"></td></tr>
<tr><td>Product Name</td><td><input type="text" placeholder="<%=rs.getString("pdctName") %>" name="pdctName"></td></tr>
<tr><td>Cost</td><td><input type="text" placeholder="<%=rs.getInt("Quant") %>" name="Quant"></td></tr>
<tr><td>Quant</td><td><input type="text" placeholder="<%=rs.getInt("price")%>" name="price"></td></tr>

<%

}
%>
</table>
</div>
<input type="submit" value="Update">
</form>
</body>
</html>