<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASSBOOK</title>
<%@page import="Database.*,java.sql.*" %>
</head>
<body>
<h2><a href="platform.jsp">BACK TO DASHBOARD</a></h2>
<table border="3" align="center">
<tr><td colspan="5" align="center">TRANSACTIONS</td></tr>
<tr><td>TRANSACTION ID</td><td WIDTH="100PX" ALIGN="center">DATE</td><td>DEPOSITE</td><td>WITHDRAW</td><td>BALANCE</td></tr>
<%
try{
	session=request.getSession(false);
	String accid=(String)session.getAttribute("accid");
	
	Connection cn=DbConnect.getDb();
	String sql="select * from passbook where accid=?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
				%>
				<tr>
				<td ALIGN="center"><%=rs.getString(6) %></td>
				<td ALIGN="center"><%=rs.getString(2) %></td>
				<td ALIGN="center"><%=rs.getString(3) %></td>
				<td ALIGN="center"><%=rs.getString(4) %></td>
				<td ALIGN="center"><%=rs.getString(5) %></td>
	<% %>

	<%} %>
<%}catch(Exception e){} %>
</table>
</body>
</html>