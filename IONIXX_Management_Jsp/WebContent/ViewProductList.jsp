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
  <h1>All Products</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <th>Product ID</th>
         <th>Product Name</th>
         <th>Price</th>
        <th>Quantity</th>
         <th>Total Cost</th>
        </tr>
      </thead>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();

String sql="SELECT * FROM productdetails";
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
%>

<tr>
<td><%=rs.getInt("pdctID") %></td>
<td><%=rs.getString("pdctName") %></td>
<td><%=rs.getInt("price") %></td>
<td><%=rs.getInt("Quant") %></td>
<td><%=rs.getInt("TotalCost") %></td>
<td>
	<form action="Delete-process.jsp" method="get">
	    <input type="text"  name="pdctID" value="<%=rs.getInt("pdctID") %>" hidden>
	    <input type="submit" value="Delete" Onclick="functiondelete()">
	   </form>	
</td>
<td>
<a href="update.jsp?id=<%=rs.getInt("pdctID")%>"><button type="button" style="background-color: plum;
    height: 48px;
    width: 99px;">Update</button> </a>
</td>
</tr>

<% 
}
%>


  </table>
  </div>
</section>
<script>
function functiondelete()
{
alert("Deleted Successfully");
}
</script>
</body>
</html>