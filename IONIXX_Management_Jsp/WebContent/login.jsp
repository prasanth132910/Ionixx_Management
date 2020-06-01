<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("SELECT *FROM USER");
while(rs.next())
{
if(rs.getString("Username").equals(username) && (rs.getString("Password").equals(password)))	
{
	if(rs.getString("type").equals("A"))
	{
	    session.setAttribute("LoginID",rs.getInt("logID")); 
		response.sendRedirect("Menu.jsp");
	}
	else if(rs.getString("type").equals("U"))
	{
         session.setAttribute("LoginID",rs.getInt("logID"));       
		  response.sendRedirect("MenuUser.jsp");
	}
}
else
{
	out.println("invalid login");
}

}
%>
</body>
</html>