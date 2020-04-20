<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BALANCE</title>
<%@page import="java.sql.*,Database.*" %>
</head>
<body>


<%
try{
	Connection cn=DbConnect.getDb();
	session=request.getSession(false);
	String withdraw=(String)session.getAttribute("wd");
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
		baln=baln-(Integer.parseInt(withdraw));
		balance=Integer.toString(baln);
		
		if(baln>0){
		
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
		
		String operation="BALANCE WITHDRAWN ";
		session.setAttribute("operation", operation);
		RequestDispatcher rd=request.getRequestDispatcher("operation.jsp");
		rd.include(request, response);
		%>
		<h1>BALANCE = <%=baln %></h1>
		
		<%}
		else{
			String sql3="delete from passbook where trnid=?";
			PreparedStatement ps3=cn.prepareStatement(sql3);
			ps3.setString(1,trnid);
			
			ps3.execute();
			
			
			String operation="DUE TO INSUFFICIENT FUND \n BALANCE WITHDRAWN NOT ";
			session.setAttribute("operation", operation);
			RequestDispatcher rd=request.getRequestDispatcher("operation.jsp");
			rd.include(request, response);
			
		}
		
		
		
%>
		<%} %>	
	<%}catch(Exception e){} %>
	


</body>
</html>