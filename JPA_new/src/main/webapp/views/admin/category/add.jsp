<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
<jsp:include page="/common/menu.jsp"></jsp:include>

	<form method="POST"
		action="${pageContext.request.contextPath}/admin-category/create"
		enctype="multipart/form-data">
		<table>
			<tr>
				<div hidden="hidden">

					<label for="UserID">Category ID:</label> <input type="text"
						name="categoryId" value="${category.categoryId }" id="categoryId"
						class="form-control" readonly />

				</div>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="categoryname"
					value="${category.categoryname }" /></td>
			</tr>
			<tr>
				<td>Code</td>
				<td><input type="text" name="categorycode"
					value="${category.categorycode }" /></td>
			</tr>

			<tr>
				<td><input id="statuson" class="form-check-input" type="radio"
					name="status" ${category.status?'checked':''} value="true">
					<label for="statuson" class="form-check-label">Hoạt động</label></td>
			</tr>
			<tr>
				<td><input id="statusoff" class="form-check-input" type="radio"
					name="status" ${!category.status?'checked':''} value="false">
					<label for="statusoff" class="form-check-label">Khóa</label></td>
			</tr>

			<tr>
				<label>Images:</label>
				<input type="file" name="images" id="images"
					value="${category.images}" />
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /> <a
					href="productList">Cancel</a></td>
			</tr>
			<tr>
				<button formaction="<c:url value="/admin-category/update"/>">

					Update <i class="fa fa-edit"></i>

				</button>
			</tr>
		</table>
	</form>
</body>
</html>