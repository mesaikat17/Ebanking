<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ELECTRICITY BILL</title>
</head>
<body>

<form action="electricityServ">
<% 
try
{
	
	session=request.getSession(false);
	String accid=(String)session.getAttribute("accid");
	
%>	
<%}catch(Exception e) {}%>
%>
<table ALIGN="CENTER">
<tr><td COLSPAN="2"><H1>ELECTRICITY BILL PAYMENT</H1></td></tr>
<tr><td>CONSUMER ID : </td><td><input type="text" name="cid" VALUE="CONID:"></td>
<tr><td>SELECT OPERATOR</td>
<td><select name="id1">
<option>---Select Operator---</option>
<option>CESC</option>
<option>WBSECL</option>

</select>


</select>
<tr><td>DATE</td><td><input type="text" name="date"></td>
<tr><td>AMOUNT</td><td><input type="text" name="deposite"></td>
<tr><td COLSPAN="2" ALIGN="CENTER"><input type="submit" value="PAY">
</table>
</form>
</body>
</html>