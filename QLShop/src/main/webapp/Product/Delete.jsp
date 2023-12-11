<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/SharedLayout/Admin.jsp"%>
	<div class="main-panel">
		<body>
			<div class="card">
				<div class="card-body" style="background: white;">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/QLShop/Product/Index">All
									Product</a></li>
							<li class="breadcrumb-item active" aria-current="page">Delete
								Product</li>
						</ol>
					</nav>
					<div class="row">
						<form method="post" action="/QLShop/Product/Delete">
							<input type="hidden" name="imgURL" value=${product.imgURL }>
							<div class="col-md-12 table-responsive-md"
								style="align-self: center; text-align: center">
								<div class="form-row">
									<div class="col-2 form-group"
										style="align-self: center; text-align: center">
										<label class="form-label">Product
											Id</label>
									</div>
									<div class="col-3 form-group">
										<input name="productID" value="${product.productID }"
											class="form-control text-dark" readonly /> <span
											class="text-danger"></span>
									</div>
									<div class="col-2 form-group"></div>
									<div class="col-2 form-group"
										style="align-self: center; text-align: center">
										<label class="form-label">Product
											Name</label>
									</div>
									<div class="col-3 form-group">
										<input value="${product.productName }"
											class="form-control text-dark" readonly /> <span
											class="text-danger"></span>
									</div>
								</div>
							</div>

							<div class="form-group">

								<button type="submit"
									class="btn btn-rounded btn-primary float-left">
									<i class="fas fa-plus-square" style="margin-right: 0.7em"></i>Delete
								</button>
								<a href="/QLShop/Product/Index"
									class="btn btn-rounded btn-success float-right"><i
									class="fas fa-caret-square-left" style="margin-right: 0.7em"></i>Back</a>
								<br /> <br /> <br />

							</div>
						</form>
					</div>
				</div>
			</div>
		</body>
</html>