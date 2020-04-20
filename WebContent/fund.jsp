<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FUND TRANSFER</title>
<%@page import="Database.*,java.sql.*" %>
</head>
<body>
<form action="fundServ1">
<table border="3" align="center">
<tr><td colspan="2" align="center">FUND TRANSFER DETAILS</td>
<tr><td>ACCOUNT NO : </td><td><input type="text" name="acctr"></td>
<tr>	<td>AMOUNT : </td><td><input type="text" name="deposite"></td>
<tr>	<td>DATE : </td><td><input type="text" name="date"></td>
<tr>	<td colspan="2" align="center"><input type="submit" value="TRANSFER"></td>
</table>	
<br>
<br>
<table border="3" align="center">
<tr><td colspan="2" align="center">Available Balance</td>
<%
try{
	Connection cn=DbConnect.getDb();
	session=request.getSession(false);

	String accid=(String)session.getAttribute("accid");

	String balance="";
		
	String sql="select balance from clientdb where accid =?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		balance=rs.getString(1);
	}
%>
<tr><td colspan="2" align="center"><%=balance%></td>
<%}
catch(Exception e){} %>
</table>


</form>
</body>
</html>