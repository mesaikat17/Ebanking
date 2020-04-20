<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fund Success</title>
<%@page import="java.sql.*" %>
</head>
<body>
<%
try{
	session=request.getSession();
	String operation=(String)session.getAttribute("operation");
	

%>
<h1><%=operation %> DONE</h1>
<h2><a href="platform.jsp">BACK TO DASHBOARD</a></h2>
<%}catch(Exception e){} %>
</body>
</html>