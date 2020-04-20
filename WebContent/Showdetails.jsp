<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ACCCOUNT DETAILS</title>
</head>
<body bgcolor="cyan">

<%@ page import="Database.*,java.sql.*" %>
<a href="info.html">[HOME]</a>
<%
try{
	String accid=request.getParameter("accid");
	Connection cn=DbConnect.getDb();
	String sql="select * from clientdb where accid=?";
		
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		%>
		<table border="3" align="center">
		<tr><td colspan="2" align="center"><h2>ACCOUNT INFORMATION</h2></td></tr>
		<tr><td>ACCOUNT ID :</td><td><%=rs.getString(1) %></td></tr>
		<tr><td>ACCOUNT HOLDER'S NAME :</td><td><%=rs.getString(2) %></td></tr>
		<tr><td>DATE OF BIRTH :</td><td><%=rs.getString(7) %></td></tr>
		<tr><td>ADDRESS :</td><td><%=rs.getString(3) %></td></tr>
		<tr><td>PHONE NO.  :</td><td><%=rs.getString(4) %></td></tr>
		<tr><td>EMAIL ID :</td><td><%=rs.getString(5) %></td></tr>
		<tr><td>BANKING TYPE :</td><td><%=rs.getString(6) %></td></tr>
		<tr><td>PIN :</td><td><%=rs.getString(8) %></td></tr>
		<tr><td>BALANCE AMOUNT :</td><td><%=rs.getString(10) %></td></tr>
		<tr><td>STATUS :</td><td><%=rs.getString(9) %></td></tr>
			</table>
		
		
		
		
		
	<%} %>
<%}catch(Exception e){
	e.printStackTrace();
}%>

</form>
</body>
</html>