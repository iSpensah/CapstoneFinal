<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="signin" method="post">
		<table>
			<tr>
				<td>Admin ID:</td>
				<td><input type="text" required name="adminid" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" required name="adminpass" /></td>
			</tr>
			<tr>
				<td><input name="submit" type="submit" value="submit" /></td>
			</tr>

			

		</table>
	</form>

</body>
</html>