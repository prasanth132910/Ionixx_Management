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
<section>
  <!--for demo wrap-->
  <h1>List of Products</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
		        <th>ProductID</th>
		        <th>Product Name</th>
				<th>minSellQuant </th>
				<th>price</th>
				<th>Quant</th>
				<th>TotalCost</th>
        </tr>
      </thead>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
int LoginID=(int)session.getAttribute("LoginID");
session.setAttribute("LoginID",LoginID); 
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT *FROM ProductDetails"); 
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt("pdctID") %></td>
<td><%=rs.getString("pdctName") %></td>
<td><%=rs.getInt("minSellQuant") %></td>
<td><%=rs.getInt("price") %></td>
<td><%=rs.getInt("Quant") %></td>
<td><%=rs.getInt("TotalCost") %></td>
</tr>
<%
}
%>
  </table>
  </div>
</section>


</body>

</html>