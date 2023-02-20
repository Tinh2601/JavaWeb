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
		action="${pageContext.request.contextPath}/admin-video/create"
		enctype="multipart/form-data">
		<table>
			
			<tr>
				<td>Video ID</td>
				<td><input type="text" name="videoId"
					value="${video.videoId }" /></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" name="title"
					value="${video.title }" /></td>
			</tr>
			<tr>
				<td>Poster</td>
				<td><input type="text" name="poster"
					value="${video.poster }" /></td>
			</tr>
			<tr>
				<td>Views</td>
				<td><input type="text" name="views"
					value="${video.views }" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="description"
					value="${video.description }" /></td>
			</tr>
			<tr>
				<td>Category Id</td>
				<td><input type="text" name="categoryId"
					value="${video.categoryId }" /></td>
			</tr>
			<tr>
				<td><input id="statuson" class="form-check-input" type="radio"
					name="status" ${video.active?'checked':''} value="true">
					<label for="statuson" class="form-check-label">True</label></td>
			</tr>
			<tr>
				<td><input id="statusoff" class="form-check-input" type="radio"
					name="status" ${!video.active?'checked':''} value="false">
					<label for="statusoff" class="form-check-label">False</label></td>
			</tr>

			
			<tr>
				<td colspan="2"><input type="submit" value="Submit" /> <a
					href="productList">Cancel</a></td>
			</tr>
			<tr>
				<button formaction="<c:url value="/admin-video/update"/>">

					Update <i class="fa fa-edit"></i>

				</button>
			</tr>
		</table>
	</form>
	
	
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



												



													<tr class="odd gradeX">


														
														<td>${video.videoId }</td>

														<td>${video.title }</td>
														<td>${video.poster }</td>
														<td>${video.views }</td>
														<td>${video.description }</td>
														<td>${video.active }</td>
														<td>${video.categoryId }</td>

														
														<td><a
															href="<c:url value='/admin-video/edit?videoId=${item.videoId }'/>"
															class="center">Edit</a> | <a
															href="<c:url value='/admin-video/delete?videoId=${item.videoId }'/>"
															class="center">Delete</a></td>

													</tr>


											</tbody>

										</table>

</body>
</html>