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
						<li class="breadcrumb-item"><a href="/QLShop/Product/Index">All
								Product</a></li>
						<li class="breadcrumb-item active" aria-current="page">New
							Product</li>
					</ol>
				</nav>
				<div class="row">
					<form method="post" action="/QLShop/Product/Create" enctype="multipart/form-data">

					<div class="col-md-12 table-responsive-md">

						<div class="form-row">

							<div class="col-2 form-group"
								style="align-self: center; text-align: center">
								<label class="form-label">Product Name</label>
							</div>
							<div class="col-3 form-group">
								<input name="productName" class="form-control" /> <span
									class="text-danger"></span>
							</div>
							<div class="col-2 form-group"></div>

							<div class="col-2 form-group"
								style="align-self: center; text-align: center">
								<label class="form-label text-transform: uppercase"
									style="margin-top: 0px; margin-bottom: 0px;">Brand</label>
							</div>
							<div class="form-check col-md-3" text-transform:uppercase;>
								<select class="form-control" name="brand">
								<c:forEach var="item" items="${list }">
									<option>${item}</option>
								</c:forEach>
								</select> <span class="text-danger"></span>
							</div>
						</div>

						<div class="form-row">
							<div class="col-2 form-group"
								style="align-self: center; text-align: center" text-transform:uppercase; >
								<label class="form-label">Price</label>
							</div>
							<div class="col-3 form-group">
								<input name="price" class="form-control" /> <span
									class="text-danger"></span>
							</div>
							<div class="col-2 form-group"></div>
							<div class="col-2 form-group"
								style="align-self: center; text-align: center">
								<label class="form-label">Category</label>
							</div>
							<div class="col-3 form-group">
								<select class="form-control" name="category">
									<c:forEach var="item" items="${cateList }">
									<option>${item}</option>
								</c:forEach>
								</select> <span class="text-danger"></span>
							</div>

						</div>

						<div class="form-row">
							<div class="form-group col-md-1"
								style="align-self: center; text-align: center">
								<label>Image</label>
							</div>
							<div class="form-group col-md-4">
								<div class="btn btn-primary btn-icon-text">
									<i class="fas fa-cloud-upload-alt"></i> 
									<input type="file" name="image" /> 
										<span class="text-danger"></span>
								</div>
							</div>
							<div class="col-2 form-group"></div>
							<div class="col-2 form-group"
								style="align-self: center; text-align: center">
								<label class="form-label">Discount
									Percentage</label>
							</div>
							<div class="col-3 form-group">
								<input name="discount" class="form-control" />
								<span class="text-danger"></span>
							</div>
						</div>


					</div>
					<div class="form-group">

						<button type="submit"
							class="btn btn-rounded btn-primary float-left">
							<i class="fas fa-plus-square" style="margin-right: 0.7em"></i>Save
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
	</div>
</body>
</html>