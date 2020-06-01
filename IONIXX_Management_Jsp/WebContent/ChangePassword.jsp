<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>


<form action="ChangePassword-process.jsp" method="post">
<table>
		<tr><td>Current UserID</td><td><input type="text" name="userid" value="<%=(int)session.getAttribute("LoginID") %>" ></td></tr>
		<tr><td>Current Password</td><td><input type="password" name="currentPass" ></td></tr>
		<tr><td>New Password</td><td><input type="password" name="newPass"></td></tr>
		<tr><td>Confirm Password</td><td><input type="password" name="confirmPass"></td></tr>
		<tr><td><input type="submit" value="Change Password"></td></tr>
</table>
</form>
</body>
</html>