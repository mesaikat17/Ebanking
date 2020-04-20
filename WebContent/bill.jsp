<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BILL PAYMENT</title>
<%@page import="Database.*,java.sql.*" %>
</head>
<body>
<% 
try
{
	
	session=request.getSession(false);
	String accid=(String)session.getAttribute("accid");
	
%>	
<%}catch(Exception e) {}%>

<table align="center">
<tr><td COLSPAN="2" align="center"><h1>BILL PAYMENT GATEWAY</h1></td>
<tr><td width="300px"><a href="telephone.jsp"><h2>TELEPHONE BILL</h2></a></td>
	<td><a href="electricity.jsp"><h2>ELECTRICITY BILL</h2></a></td>
</tr>

</table>
</body>
</html>