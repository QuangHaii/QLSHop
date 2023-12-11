<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<tr>
		<td>${param.productName }</td>
		<td>${param.brand }</td>
		<td>${param.price }</td>
		<td>${param.category }</td>
		<td><img alt="image" src="${param.imgURL }" /></td>
		<td><a class="text-primary"
			href="/QLShop/Product/Edit?id=${param.productID }"> <i
				class="fas fa-edit"></i> Edit
		</a> <a class="text-danger"
			href="/QLShop/Product/Delete?id=${param.productID }"> <i
				class="far fa-trash-alt"></i> Delete
		</a></td>
	</tr>
</body>
</html>