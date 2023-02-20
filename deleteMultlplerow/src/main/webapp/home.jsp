<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function noCheck() {
		if (document.querySelectorAll('input[type="checkbox"]:checked').length == 0) {
			alert("You haven't checked any record");
			return false;
		}
	}
		
	
</script>
<div id="main">
<form action="${pageContext.request.contextPath }/user?action=deleteList" method="post">
	<table class="table table-striped table-hover">
				<thead>
					<tr>						
						
						<th>Name</th>
						<th>Email</th>						
						<th>Phone</th>						
					</tr>
				</thead>
				<tbody>
					<c:set var="i" value="1" />
					<c:forEach var="user" items="${users}" >
					<tr>						
						
						<td>${user.name }</td>
						<td>${user.email }</td>						
						<td>${user.phone }</td>
						<td><input class="checkbox" type="checkbox" name="ids" value="${user.id }" >
						</td>
					</tr>	
					<c:set var="i" value="${i+1 }" />
					</c:forEach>				
				</tbody>
			</table>
			<input onclick="noCheck()" type="submit" value = "Delete" >			
	</form>
</div>

</body>
</html>