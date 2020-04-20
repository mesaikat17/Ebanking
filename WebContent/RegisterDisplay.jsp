<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successful Registration</title>
<%@page import="Database.*,java.sql.*" %>
</head>
<body>
<h1><font color="GREEN">SUCCESSFULLY REGISTERED</font></h1>
<% 
try{
	session=request.getSession(false);
	String accid=(String)session.getAttribute("accid");
	
	Connection cn=DbConnect.getDb();
	String sql="select accid,cname,pin,status from clientdb where accid=?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		
		%>
		<table>
		<tr><td>ACCNT NO : </td> <td><%=rs.getString(1)%></td></tr>
		<tr><td>NAME : </td><td> <%=rs.getString(2)%></td>>
		<tr><td>PASSWORD :</td><td><%=rs.getString(3)%></td>
		<tr><td>STATUS : </td><td><%=rs.getString(4)%></td>
		
		</table>
	<%} %>
	<h2><font color="red">PLEASE WAIT FOR ACCOUNT CONFIRMATION <BR><BR>FOR ACTIVATION OF YOUR ACCOUNT <br><br>***DO REMEMBER YOUR PASSWORD </font></h2>
<BR>
<A HREF="info.html">[HOME]</A>
<%}catch(Exception e){} %>
</body>
</html>