<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="acc" value="${sessionScope.User }"/>
</head>
<body>
	<tr>
		<td>${param.orderID}</td>
		<td>${param.paymentID}</td>
		<td>${param.fullName}</td>
		<td>${param.phone}</td>
		<c:if test="${param.email != null }">
			<td>${param.email}</td>
		</c:if>
		<td>${param.orderDate }</td>
		<td>${param.totalPrice}</td>
		<c:choose>
		<c:when test="${acc.userID == 1 || acc.userID == 3}">
		<td><a class="text-success"
			href="/QLShop/Order/Detail?id=${param.orderID}"> <i
				class="fas fa-bars"></i> Detail
		</a></td>
		</c:when>
		<c:otherwise>
		<td><a class="text-success"
			href="/QLShop/Payment/Detail?id=${param.paymentID}"> <i
				class="fas fa-bars"></i> Detail
		</a></td>
		</c:otherwise>
		</c:choose>
		
	</tr>
</body>
</html>