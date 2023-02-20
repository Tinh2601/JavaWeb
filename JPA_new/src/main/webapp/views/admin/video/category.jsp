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
		
	<c:forEach var="item" items="${listC}">
		<a href="${pageContext.request.contextPath}/admin-video/list?id=${item.categoryId}">${item.categoryname}</a></br>
	</c:forEach>
	
	
	<table class="table table-striped table-bordered table-hover"
											id="sample_2">

											<thead>

												<tr>

													<th>Video ID</th>

													<th>Title</th>

													<th>Poster</th>





													<th>View</th>

													<th>Description</th>
													<th>Active</th>
													
													<th>Category Id</th>

												</tr>

											</thead>

											<tbody>



												<c:forEach var="item" items="${videos}">



													<tr class="odd gradeX">


														
														<td>${item.videoId }</td>

														<td>${item.title }</td>
														<td>${item.poster }</td>
														<td>${item.views }</td>
														<td>${item.description }</td>
														<td>${item.active }</td>
														<td>${item.categoryId }</td>

														
														<td><a
															href="<c:url value='/admin-video/edit?videoId=${item.videoId }'/>"
															class="center">Edit</a> | <a
															href="<c:url value='/admin-video/delete?videoId=${item.videoId }'/>"
															class="center">Delete</a></td>

													</tr>

												</c:forEach>

											</tbody>

										</table>

</body>
</html>