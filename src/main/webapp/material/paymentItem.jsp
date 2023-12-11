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
		<td>${param.paymentID}</td>
		<td>${param.method}</td>
		<td>${param.nameOnCard}</td>
		<td>${param.cardNumber}</td>
		<td>${param.expirationMonth}/${param.expirationYear}</td>
		<td>${param.CVV}</td>
		<td><a class="text-success"
			href="/QLShop/Payment/AdminDetail?id=${param.paymentID}"> <i
				class="fas fa-bars"></i> Detail
		</a></td>
	</tr>
</body>
</html>