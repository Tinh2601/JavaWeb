<div>

		<a href="${pageContext.request.contextPath}/admin-category/create"><span
			class="material-symbols-outlined"> Create Category</span></a>
			||		
			<a href="${pageContext.request.contextPath}/admin-video/create"><span
			class="material-symbols-outlined"> Create Video</span></a>
		||
		<a href="${pageContext.request.contextPath}/admin-video/list"><span
			class="material-symbols-outlined"> List Category</span></a>
		||
		<a href="${pageContext.request.contextPath}/admin-video"><span
			class="material-symbols-outlined"> List Video</span></a>	
		||	
		<a href="${pageContext.request.contextPath}/admin-video/phan-trang"><span
			class="material-symbols-outlined"> Phan Trang Video </span></a>
		||
		<form action="${pageContext.request.contextPath}/admin-video/search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txtS" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search">Search</i>
                                </button>
                            </div>
                        </div>
                    </form>
	</div>