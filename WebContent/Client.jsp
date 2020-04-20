<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Login</title>
</head>
<link href="Design.css" rel="stylesheet" type="text/css"/>
<body bgcolor="green">

<form action="ClientServ">

<div id="box5">
<table border="3" align="center">
<tr><td colspan="2" align="center"><font size="40">CLIENT LOGIN</font></td></tr>

<tr><td>Enter User ID </td><td><input type="text" name="user"></td>
<tr><td>Enter Password </td><td><input type="password" name="pass"></td>
<tr><td colspan="2" align="center"><input type="submit" value="LOGIN"></td>
<tr><td colspan="2" align="center"><a href="registration.jsp">NEW USER ?</a></td>
</div>
</table>
</form>
</body>
</html>