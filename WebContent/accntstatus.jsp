<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Confirmation</title>
</head>
<%@ page import="Database.*,java.sql.*" %>
<body bgcolor="gold">
<form action="confirmrequest.jsp">
<table border="3" align="center">
<tr><td>ACCNT NO</td>
<td>NAME</td>
<td>STATUS</td>
</tr>

<%
try{
		
	Connection cn=DbConnect.getDb();
	String sql="select accid, cname, status from clientdb where status=?";
	
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, "PENDING");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
		<tr><td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
	<%} %>
	<tr><td colspan="3" align="center"><input type="submit" value="CONFIRM REQUEST" name="confirm">

<%}catch(Exception e){
	
}%>
</table>
</form>
</body>
</html>