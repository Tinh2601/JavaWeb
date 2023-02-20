<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<-- header -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Home.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Category</a></li>
						<li class="breadcrumb-item active" aria-current="#">Sub-category</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="card bg-light mb-3">
					<div class="card-header bg-primary text-white text-uppercase">
						<i class="fa fa-list"></i> Categories
					</div>
					<ul class="list-group category_block">
						<c:forEach items="${listCC}" var="o">
							<li class="list-group-item text-white ${tagCate == o.cateId ? "active":""} "><a
								href="category?cateId=${o.cateId}">${o.cateName}</a></li>
						</c:forEach>

					</ul>
				</div>
				<div class="card bg-light mb-3">
					<div class="card">

						<div class="card-header bg-success text-white text-uppercase">
							<i class="fa fa-heart"></i> Top one
						</div>
						<img class="img-fluid border-0" src="${top1.image}"
							alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title text-center">
								<h4 class="card-title text-center">
									<a href="detail?pid=${top1.productId}" title="View Product">${top1.productName}</a>
								</h4>
							</h4>
							<div class="row">
								<div class="col">
									<p class="btn btn-danger btn-block">${top1.price}$</p>
								</div>
								<div class="col">
									<a href="product.html" class="btn btn-success btn-block">View</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-9">
				<div id="content" class="row">
					<c:forEach items="${listP}" var="o">
						<div class="product col-12 col-md-6 col-lg-4">
							<div class="card">
								<img class="card-img-top" src="${o.image}" alt="Card image cap">
								<div class="card-body">
									<h4 class="card-title show_txt">
										<a href="detail?pid=${o.productId}" title="View Product">${o.productName}</a>
									</h4>
									<p class="card-text show_txt"></p>
									<div class="row">
										<div class="col">
											<p class="btn btn-danger btn-block">${o.price}$</p>
										</div>
										<div class="col">
											<a href="#" class="btn btn-success btn-block">Add to cart</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				
  				<button onclick="loadMore()" class="btn btn-primary">Load
					more</button>  
			</div>

		</div>

	</div>

	<jsp:include page="/common/footer.jsp"></jsp:include>
	<!-- Footer -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		/* $(window).scroll(
				function() {
					if ($(window).scrollTop() + $(window).height() >= $(
							document).height()) {
						loadMore();
					}
				}); */
		function loadMore() {
			var amount = document.getElementsByClassName("product").length;
			$.ajax({
				url : "/LTWeb/load",
				type : "get", //send it through get method
				data : {
					exits : amount
				},
				success : function(data) {
					var row = document.getElementById("content");
					row.innerHTML += data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
		function searchByName(param) {
			var txtSearch = param.value;
			$.ajax({
				url : "/WebBanGiay2/searchAjax",
				type : "get", //send it through get method
				data : {
					txt : txtSearch
				},
				success : function(data) {
					var row = document.getElementById("content");
					row.innerHTML = data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
	</script>
</body>
</html>

