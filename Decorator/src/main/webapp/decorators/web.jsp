
<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title><dec:title default="Trang chủ" /></title>
 <!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<c:url value='/template/web/assets/favicon.ico' />" />
<!-- css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="<c:url value='/template/web/css/styles.css' />" rel="stylesheet"  />
</head>
<body>
	<!-- header -->
	<%@ include file="/common/web/header.jsp" %>
	
	<div class="container">
		<dec:body/>
	</div>
	
	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
</body>
</html>