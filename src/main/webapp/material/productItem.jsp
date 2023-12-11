<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col">
		<div class="card h-100">
			<div class="badge bg-dark text-white position-absolute"
				style="top: 0.5rem; right: 0.5rem">${param.discount}%</div>
			<img alt="image" src="${param.image }"
				style="height: 13rem;">
			<div class="card-body p-4">
				<div class="text-center">
					<h5 class="card-title">${param.productName}</h5>
					<p>${param.brand}</p>
					<p>${param.price}</p>
					<div class="col-3 form-group"></div>
				</div>
			</div>
			<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
				<div class="text-center">
					<form asp-action="AddToCart" asp-route-id="@item.productID"
						method="post">
						<div asp-validation-summary="ModelOnly" class="text-danger"></div>
						<div class="form-group">
							<input type="submit" value="Add To Cart" class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>