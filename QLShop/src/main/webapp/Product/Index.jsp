<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="/SharedLayout/Admin.jsp"%>
<body>
	<div class="main-panel">
		<div class="card">
			<div class="card-body" style="background: white">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/QLShop/Product/Index">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">All
							Product</li>
					</ol>
				</nav>
				<div class="row">
					<div class="col-md-12 table-responsive-md">
						<table class="table table-strip table" style="color: black;">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Brand</th>
									<th>Price</th>
									<th>Category</th>
									<th>Image</th>
									<th class="text-warning">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="product" items="${listProducts }">
									<jsp:include page="/material/AdminProductItem.jsp">
										<jsp:param name="productID" value="${product.productID }"/>
										<jsp:param name="productName" value="${product.productName }" />
										<jsp:param name="brand" value="${product.brand }" />
										<jsp:param name="price" value="${product.price }" />
										<jsp:param name="category" value="${product.category }"/>
										<jsp:param name="discount"
											value="${product.discountPercentage }" />
										<jsp:param name="imgURL" value="${product.imgURL }" />
									</jsp:include>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>