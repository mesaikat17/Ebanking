<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REQUEST CONFIRMED !!</title>
<%@ page import="Database.*,java.sql.*" %>
</head>
<body bgcolor="green">
<H1>ACCOUNT REQUEST CONFIRMED ! !</H1>
<% 
try{
	Connection cn=DbConnect.getDb();
	String sql1="update clientdb set status=? where status =?";
	PreparedStatement ps1=cn.prepareStatement(sql1);
	ps1.setString(1,"CONFIRMED");
	ps1.setString(2, "PENDING");
	
	ps1.execute();
	
	
	

%>
<%}catch(Exception e){
	}%>


</body>
</html>