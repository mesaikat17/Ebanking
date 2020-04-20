<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Platform</title>
<link href="Design.css" rel="stylesheet" type="text/css"/>
<%@page import="Database.*,java.sql.*"%>
</head>
<body BGCOLOR="SILVER">

<%
try{
	session = request.getSession(false);
	String cname=(String)session.getAttribute("cname");
	String caddr=(String)session.getAttribute("caddr");
	String accid=(String)session.getAttribute("accid");
	
	session.setAttribute("accid",accid);
%>
<div id="box6"><a href="logout.html"><h2>LOGOUT</h2></a></div>
<div id="box7">
<h1>WELCOME <%=cname %> ,</h1>
<h1>ACCOUNT NO : <%=accid %></h1>
<h1>ADDRESS : <%=caddr %></h1>
<%
	Connection cn=DbConnect.getDb();
	session=request.getSession(false);

	

	String balance="";
		
	String sql="select balance from clientdb where accid =?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		balance=rs.getString(1);
	}
	%>
<h1>BALANCE : <%=balance %></h1>
</div>
<%}catch(Exception e){} %>

<br>
<br>

<table ALIGN="center">
<tr><td HEIGHT="40PX" width="350px"><a href="updateclient.jsp"><h2>UPDATE INFO  </h2></a>  </td>
<td HEIGHT="40PX" width="350px"><a href="transaction.jsp"><h2>PASSBOOK DETAILS </h2></a></td>
<td HEIGHT="40PX"><a href="withdraw.jsp"><h2>WITHDRAW MONEY</h2></a></td>
<tr><td HEIGHT="40PX"><a href="deposite.jsp"><h2>DEPOSITE MONEY</h2></a></td>
<td HEIGHT="40PX"><a href="bill.jsp"><h2>BILL PAYMENT</h2></a></td>
<td HEIGHT="40PX"><a href="fund.jsp"><h2>FUND TRANSFER</h2></a></td>

</table>
</body>
</html>