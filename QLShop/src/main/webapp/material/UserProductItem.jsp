<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col mb-5">
		<div class="card h-100">
			<div class="badge bg-dark text-white position-absolute"
				style="top: 0.5rem; right: 0.5rem">${param.discountPercentage}%</div>
			<a> <img alt="image" src="${param.imgURL }"
				style="height: 13rem; width: -webkit-fill-available"
				onerror="this.src='/QLShop/images/missing.jpg';">
			</a>
			<div class="card-body p-4">
				<div class="text-center">
					<h5 class="card-title text-warning">${param.productName}</h5>
					<h4 class="card-text text-info">
						Category: <span class="text-light">${param.category}</span>
					</h4>
					<h4 class="card-text text-info">
						Brand: <span class="text-light">${param.brand}</span>
					</h4>
					<h4 class="card-text text-info">
						Price: <span class="text-light">${param.price}$</span>
					</h4>
				</div>
			</div>
			<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
				<div class="text-center">
				
					<a class="btn btn-primary" href="/QLShop/User/AddToCart?productID=${param.productID }">Add To Cart</a>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>