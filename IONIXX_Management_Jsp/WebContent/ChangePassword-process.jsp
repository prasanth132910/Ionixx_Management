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

String loginID=request.getParameter("userid");
String currentPassword=request.getParameter("currentPass");
String Newpass=request.getParameter("newPass");
String confirmPass=request.getParameter("confirmPass");
String pass="";
ResultSet rs=st.executeQuery("select * from user where Password='"+currentPassword+"' and logID="+loginID +"");
while(rs.next())
{
	pass=rs.getString("Password");
}
if(pass.equals(currentPassword)){
	if(Newpass.equals(confirmPass)){
		Statement st1=conn.createStatement();
		int i=st1.executeUpdate("update user set Password='"+Newpass+"' where logID='"+loginID+"'");
		out.println("Password changed successfully");

		}
		else{
		out.println("New Password must match with Confirm password");
		}
	}
else{
	out.println("Invalid Current Password");
	}
%>
</body>
</html>