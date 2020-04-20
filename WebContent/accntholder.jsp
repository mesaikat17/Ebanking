<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Info</title>
</head>
<body bgcolor="gold">


<%@ page import="Database.*,java.sql.*" %>
<form action="Showdetails.jsp">
<table border="3" align="center">
<tr><td><h3>ACCOUNT INFO</h3></td></tr>
<tr><td>
<select name="accid">
<option>---Select ACCNT ID---</option>
<%
try{
	Connection cn=DbConnect.getDb();
	String sql="select accid from clientdb";
	
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<option><%=rs.getString(1) %></option>
<%} %>

<%} catch(Exception e){
	e.printStackTrace();
}%>
</td>
</select>
<tr><td align="center">
<input type="submit" value="OK"></td>

</table>
<br>
<table border="3" align="center">
<TR><TD><a href="accntstatus.jsp">ACCOUNT CONFIRMATION REQUESTS</a></TD></TR>
</table>
<br>
<br>
<br>
<br>

</form>

</body>
</html>