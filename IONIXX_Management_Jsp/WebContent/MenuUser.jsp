<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/stylemenu.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  </head>
  <body>
  <%
  Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();
int LoginID=(int)session.getAttribute("LoginID");
session.setAttribute("LoginID",LoginID); 
%>
  
  
    <input type="checkbox" id="check">
    <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
    </label>
    <div class="sidebar">
    <header>My App</header>
  <ul>
    <li><a href="profile.jsp"><i class="fas fa-qrcode"></i>Profile</a></li>
    <li><a href="ViewAllProducts.jsp"><i class="fas fa-link"></i>View All Products</a></li>
    <li><a href="agent-process.jsp"><i class="fas fa-sliders-h"></i>Buy/Sell Item</a></li>
    <li><a href="index.jsp"><i class="far fa-envelope"></i>Logout</a></li>
  </ul>
</div>
 <section></section>

  </body>
</html>
    