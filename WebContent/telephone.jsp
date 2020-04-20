<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TELEPHONE BILL</title>
</head>
<body>
<form action="telephoneServ1">
<% 
try
{
	
	session=request.getSession(false);
	String accid=(String)session.getAttribute("accid");
	session.setAttribute("accid", accid);
	/*PrintWriter ot=response.getWriter();
	ot.print(accid);*/
%>	
<%}catch(Exception e) {}%>

<table ALIGN="CENTER">
<tr><td COLSPAN="2"><H1>PHONE BILL PAYMENT</H1></td></tr>
<tr><td>PHONE NO : </td><td><input type="text" name="ph" VALUE="+91-"></td>
<tr><td>SELECT OPERATOR</td>
<td><select name="id1">
<option>---Select Operator---</option>
<option>AIRCEL</option>
<option>AIRTEL</option>
<option>IDEA</option>
<option>RELIANCE</option>
<option>BSNL</option>
<option>TATA DOCOMO</option>
<option>VODAFONE</option></td>
</select>

<tr><td>CONNECTION TYPE</td>
<td><select name="id2">
<option>---Select type---</option>
<option>PREPAID</option>
<option>POSTPAID</option>

</select>
<tr><td>DATE</td><td><input type="text" name="date"></td>
<tr><td>AMOUNT</td><td><input type="text" name="deposite"></td>
<tr><td COLSPAN="2" ALIGN="CENTER"><input type="submit" value="PAY">
</table>
</form>
</body>
</html>