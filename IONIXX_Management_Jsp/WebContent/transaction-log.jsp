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
  <h1>Transaction Log</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
         <th>Name</th>
         <th>Product</th>
         <th>Type</th>
         <th>Quantity</th>
        <th>Cost/unit</th>
         <th>Total Cost</th>
        </tr>
      </thead>
 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();

String sql="SELECT T.type,T.quantity,T.cost,T.Totalcost,U.name,P.pdctName FROM transaction T INNER JOIN productdetails P ON P.pdctID=T.pdctID INNER JOIN user U ON U.logID=T.logID";
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("pdctName") %></td>
<td><%=rs.getString("type") %></td>
<td><%=rs.getInt("quantity") %></td>
<td><%=rs.getInt("cost") %></td>
<td><%=rs.getInt("Totalcost") %></td>
</tr>
<% 
}
%>
   </table>
  </div>
</section>

</body>
</html>