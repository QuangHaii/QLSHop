<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<li class="list-group-item d-flex justify-content-between lh-sm">
		<div>
			<h6 class="my-0">Product Name: <strong>${param.productName} x ${param.quantity} </strong></h6>
			<small class="text-body-secondary">Category:<strong>${param.category }</strong> - Brand: <strong>${param.brand}</strong></small>
		</div> <span class="text-body-secondary"><strong>${param.price}</strong></span>
	</li>
</body>
</html>