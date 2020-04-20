<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@page import="java.sql.*,Database.*" %>
</head>
<body>


<%
try{
	Connection cn=DbConnect.getDb();
	session=request.getSession(false);
	String deposite=(String)session.getAttribute("wd");
	String accid=(String)session.getAttribute("accid");
	String trnid=(String)session.getAttribute("trnid");
	
	//PrintWriter ot=response.getWriter();
	//ot.println(accid);
	
	//ot.println("w= "+withdraw);
	
	int baln=0;
	String balance="";
		
	String sql="select balance from clientdb where accid =?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1, accid);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		balance=rs.getString(1);
		//ot.println(balance);
		baln=Integer.parseInt(balance);
		baln=baln+(Integer.parseInt(deposite));
		balance=Integer.toString(baln);
		
		
		
		
		String sql1="update clientdb set balance=? where accid =?";
		PreparedStatement ps1=cn.prepareStatement(sql1);
		ps1.setString(1,balance);
		ps1.setString(2,accid);
		ps1.execute();
		
		String sql2="update passbook set balance=? where trnid =?";
		PreparedStatement ps2=cn.prepareStatement(sql2);
		ps2.setString(1,balance);
		ps2.setString(2,trnid);
		ps2.execute();
		
		String operation="BALANCE DEPOSITION ";
		session.setAttribute("operation", operation);
		RequestDispatcher rd=request.getRequestDispatcher("operation.jsp");
		rd.include(request, response);
		
		
		
		
%>
			<h1>BALANCE = <%=baln %></h1>
		<%} %>
	<%}catch(Exception e){} %>
	



</body>
</html>