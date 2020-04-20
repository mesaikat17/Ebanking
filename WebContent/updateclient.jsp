<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Info</title>
</head>
<body>
<form action="updateServ">
<table border="3" align="center">
		<tr><td colspan="2" align="center"><h2>ACCOUNT UPDATE </h2></td></tr>
		
		
		
		<tr><td>ADDRESS :</td><td><input type="text" name="caddr"></td></tr>
		<tr><td>PHONE NO.  :</td><td><input type="text" name="cph"></td></tr>
		<tr><td>EMAIL ID :</td><td><input type="text" name="email"></td></tr>
		<tr><td>OLD PIN :</td><td><input type="text" name="oldpin"></td></tr>
		<tr><td>NEW PIN :</td><td><input type="text" name="pin"></td></tr>
		<tr><td COLSPAN="2" ALIGN="CENTER"><input type="submit" value="CHANGE"></td></tr>
		
</table>
</form>
</body>
</html>