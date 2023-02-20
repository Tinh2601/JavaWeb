<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <!-- Site meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Free Bootstrap 4 Ecommerce Template</title>
    <!-- CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <style>
    
    footer {
    background: #343a40;
    padding: 40px;
}
footer a {
    color: #f8f9fa!important
}

div {
text-align: center;
	}
    </style>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
	<h1>Login form</h1>
	<h3 style="color:red">${requestScope.error}</h3>
	<div><form action="login1" method="get">
		<table>
			<tr>
				<td>Enter username:</td>
				<td><input type="text" name="user" /></td>
			</tr>
			<tr>
				<td>Enter password:</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="Login" /></td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- Footer -->
</body>
</html>