<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
<form action="registrationServ">
<table border="3" align="center">
<tr><td colspan="2" align="center">REGISTRATION DETAILS</td>
<tr><td>ENTER NAME : </td><td><input type="text" name="cname"></td>
<tr><td>ENTER ADDRESS : </td><td><input type="text" name="caddr"></td>
<tr><td>ENTER DOB : </td><td><input type="text" name="cdob"></td>
<tr><td>ENTER PHONE NO : </td><td><input type="text" name="cph"></td>
<tr><td>ENTER EMAIL ID : </td><td><input type="text" name="email"></td>
<tr><td>ENTER BANKING TYPE : </td><td><input type="text" name="banktype"></td>
<tr><td colspan="2" align="center"><input type="submit" value="REGISTER"></td>


</table>
</form>
</body>
</html>