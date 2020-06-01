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
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
Statement st=conn.createStatement();

int LoginID=(int)session.getAttribute("LoginID");

String Transtype=request.getParameter("TransType");
int pdID=Integer.parseInt(request.getParameter("pdID"));
int Quant=Integer.parseInt(request.getParameter("Quant"));


if(Transtype.equalsIgnoreCase("buy"))
{
	String sql="SELECT *FROM ProductDetails WHERE pdctID='"+pdID+"' ";
	ResultSet rs=st.executeQuery(sql); 
	while(rs.next())
	{
		int AvlQuantity=rs.getInt("Quant");
		int avlPrice=rs.getInt("price");
	    int netQuant=AvlQuantity-Quant;
		int netCost=netQuant*avlPrice;
		
		//System.out.println(AvlQuantity+"\t"+avlPrice);
		//System.out.println(netQuant+"\t"+netCost);
			if(AvlQuantity>=Quant)
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
				Statement st1=con.createStatement();
				String s="UPDATE ProductDetails SET Quant="+netQuant+" , TotalCost="+netCost+" WHERE pdctID='"+pdID+"' ";
				String s2="INSERT INTO transaction values('"+Transtype+"',"+Quant+","+avlPrice+","+(Quant*avlPrice)+","+pdID+","+LoginID+")";
				System.out.println(s);
				st1.executeUpdate(s);
				st1.execute(s2);
				response.sendRedirect("agent-process.jsp");
			}
	}

		
}
else 
	if(Transtype.equalsIgnoreCase("sell"))
	{
		String sql="SELECT *FROM ProductDetails WHERE pdctID='"+pdID+"' ";
		ResultSet rs=st.executeQuery(sql); 
		while(rs.next())
		{
			int AvlQuantity=rs.getInt("Quant");
			int avlPrice=rs.getInt("price");
		    int netQuant=AvlQuantity+Quant;
			int netCost=netQuant*avlPrice;
			
			//System.out.println(AvlQuantity+"\t"+avlPrice);
			//System.out.println(netQuant+"\t"+netCost);
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "");
					Statement st1=con.createStatement();
					String s="UPDATE ProductDetails SET Quant="+netQuant+" , TotalCost="+netCost+" WHERE pdctID='"+pdID+"' ";
					String s2="INSERT INTO transaction values('"+Transtype+"',"+Quant+","+avlPrice+","+(Quant*avlPrice)+","+pdID+","+LoginID+")";
					st1.executeUpdate(s);
					st1.execute(s2);
					response.sendRedirect("agent-process.jsp");
				
		}

			
	}

%>
</body>
</html>