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
					<img class="img-fluid border-0"
						src="${top1.image}"
						alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title text-center">
							<h4 class="card-title text-center"><a  href="detail?pid=${top1.productId}" title="View Product">${top1.productName}</a></h4>
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
			</div>
			
		</div>
					<div class="clearfix" align="right">
                        <div class="hint-text">Showing <b>4</b> out of <b>25</b> entries</div>
                        
                        <ul class="pagination">
						<c:if test="${tag>1}">
							<li class="page-item disabled"><a
								href="product?index=${tag-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="1" end="${endP}" var="i">

							<li class="page-item ${tag==i?"active":""}" ><a
								href="product?index=${i}" class="page-link">${i}</a></li>

						</c:forEach>
						<c:if test="${tag<endP}">
							<li class="page-item"><a href="product?index=${tag+1}"
								class="page-link">Next</a></li>
						</c:if>
					</ul>
                    </div>
	</div>
	
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<!-- Footer -->
</body>
</html>

