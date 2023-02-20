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
<-- header -->
<jsp:include page="/common/header.jsp"></jsp:include>
	<form action="editCategory" method="get">
		<table>
			<tr>
				<td>ID Category:</td>
				<td><input type="text" name="id"  value="${c.cateId}" readonly required/></td>
			</tr>
			<tr>
				<td>Enter New Name:</td>
				<td><input type="text" name="name"  value="${c.cateName}"/></td>
			</tr>
			<tr>
				<td>Url of image:</td>
				<td><input type="text" name="image" value="${c.images}" /></td>
			</tr>
			<tr>
				<td>Status:</td>
				<td><input type="text" name="status"  value="${c.status}"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" /></td>
			</tr>
		</table>
	</form>
<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- Footer -->


<!-- JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>