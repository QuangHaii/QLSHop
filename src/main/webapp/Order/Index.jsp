<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/SharedLayout/Admin.jsp"%>
	<div class="main-panel">
		<div class="card">
			<div class="card-body" style="background: white">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a asp-controller="Home"
							asp-action="Index">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">All
							Order</li>
					</ol>
				</nav>
				<div class="row">
					<div class="col-md-12 table-responsive-md">
						<table class="table table-strip table" style="color: black;">

							<thead>
								<tr>

									<th>Order id</th>
									<th>Order id</th>
									<th>Full name</th>
									<th>Phone number</th>
									<th>Email</th>
									<th>Order Date</th>
									<th>Total price</th>
									<th class="text-warning">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${listOrders}">
									<jsp:include page="/material/orderItem.jsp">
										<jsp:param name="orderID" value="${order.orderID }" />
										<jsp:param name="paymentID" value="${order.payment.paymentID }" />
										<jsp:param name="fullName" value="${order.fullName }"/>
										<jsp:param name="phone" value="${order.phone }" />
										<jsp:param name="email" value="${order.email }" />
										<jsp:param name="orderDate" value="${order.orderDate }" />
										<jsp:param name="totalPrice" value="${order.totalPrice }" />
									</jsp:include>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="text-end">
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${pageIndex > 1}">
						<li class="page-item"><a
							href="/QLShop/Order/Index?pageIndex=1"
							class="page-link"> First </a></li>
						<li class="page-item"><a
							href="/QLShop/Order/Index?pageIndex=${pageIndex - 1}"
							class="page-link" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a></li>
					</c:if>

					<c:forEach var="page" begin="${startPage }" end="${endPage }">
						<li class="page-item"><a
							href="/QLShop/Order/Index?pageIndex=${page}"
							class="page-link"> ${page } </a></li>
					</c:forEach>

					<c:if test="${pageIndex < totalPages}">
						<li class="page-item"><a
							href="/QLShop/Order/Index?pageIndex=${pageIndex + 1}"
							class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
						</a></li>
						<li class="page-item"><a
							href="/QLShop/Order/Index?pageIndex=${totalPages}"
							class="page-link"> Last </a></li>
					</c:if>

				</ul>
			</div>

		</div>
</body>
</html>