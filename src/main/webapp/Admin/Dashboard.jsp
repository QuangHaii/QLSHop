<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-QwLIzRyddi8I+Z4+n/UonmiXy6qUyOwhiHahDE0Lr0u5r2BRDc/X9U+va76fIJK0cdPQrVnG7n5Aq4eGldI7eDQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body {
	padding-top: 5rem;
	background-color: #f8f9fa;
}

.navbar {
	background-color: #343a40;
}

.navbar-brand {
	color: #ffffff;
}

.dashboard-card {
	margin-bottom: 20px;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-title {
	color: #343a40;
}

.card-body {
	padding: 20px;
}

.icon {
	font-size: 2rem;
	margin-right: 10px;
}
</style>
<title>Admin Dashboard</title>
</head>
<%@include file="/SharedLayout/Admin.jsp"%>
<div class="main-panel" style="padding: 1em">
	<body>

		<div class="mt-5 py-3 px-5 bg-white shadow-sm rounded-3">
			<nav style="--bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Statistics</li>
				</ol>
			</nav>
		</div>



		<div class="row">
			<div class="col-lg-3 py-3">
				<div
					class="bg-white shadow-sm rounded-3 d-flex justify-content-between p-4">
					<div>
						<p class="small">Customers</p>
						<p class="fs-3 fw-bold">5</p>
						<p class="mb-0">
							<span class="text-danger"><i class="fas fa-arrow-down"></i>
								20% </span>Since last month
						</p>
					</div>
					<i class="fas fa-user-check fa-2x stats"></i>
				</div>
			</div>
			<div class="col-lg-3 py-3">
				<div
					class="bg-white shadow-sm rounded-3 d-flex justify-content-between p-4">
					<div>
						<p class="small">Orders</p>
						<p class="fs-3 fw-bold">${tongDonHang}</p>
						<c:choose>
						<c:when test="${percentDonHang < 0 }">
						<p class="mb-0">
							<span class="text-danger"><i class="fas fa-arrow-down"></i>
								${percentDonHang }%  </span>Since last month
						</p>
						</c:when>
						<c:otherwise>
						<p class="mb-0">
							<span class="text-success"><i class="fas fa-arrow-up"></i>
								${percentDonHang }% </span>Since last month
						</p>
						</c:otherwise>
						</c:choose>
					</div>
					<i class="fas fa-cart-plus fa-2x stats"></i>
				</div>
			</div>
			<div class="col-lg-3 py-3">
				<div
					class="bg-white shadow-sm rounded-3 d-flex justify-content-between p-4">
					<div>
						<p class="small">Revenue</p>
						<p class="fs-3 fw-bold">${doanhthu}$</p>
						<c:choose>
						<c:when test="${percentDoanhThu < 0 }">
						<p class="mb-0">
							<span class="text-danger"><i class="fas fa-arrow-down"></i>
								${percentDoanhThu }%  </span>Since last month
						</p>
						</c:when>
						<c:otherwise>
						<p class="mb-0">
							<span class="text-success"><i class="fas fa-arrow-up"></i>
								${percentDoanhThu }% </span>Since last month
						</p>
						</c:otherwise>
						</c:choose>
					</div>
					<i class="fas fa-dollar-sign fa-2x stats"></i>
				</div>
			</div>
			<div class="col-lg-3 py-3">
				<div
					class="bg-white shadow-sm rounded-3 d-flex justify-content-between p-4">
					<div>
						<p class="small">Growth</p>
						<p class="fs-3 fw-bold">14.25%</p>
						<p class="mb-0">
							<span class="text-success"><i class="fas fa-arrow-up"></i>
								1.51% </span>Since last month
						</p>
					</div>
					<i class="fas fa-chart-bar fa-2x stats"></i>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-7 py-3">
				<h3>
					5 Đơn hàng gần nhất
					</h1>
					<div class="bg-white shadow-sm rounded-3 p-4->"
						style="border: solid;; height: 200px; overflow-y: scroll">
						<table class="table table-strip table" style="color: black;">

							<thead>
								<tr>

									<th>Order id</th>
									<th>Payment id</th>
									<th>Full name</th>
									<th>Phone number</th>
									<th>Order Date</th>
									<th>Total price</th>
									<th class="text-warning">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${listOrders}">
									<jsp:include page="/material/orderItem.jsp">
										<jsp:param name="orderID" value="${order.orderID }" />
										<jsp:param name="paymentID"
											value="${order.payment.paymentID }" />
										<jsp:param name="fullName" value="${order.fullName }" />
										<jsp:param name="phone" value="${order.phone }" />
										<jsp:param name="orderDate" value="${order.orderDate }" />
										<jsp:param name="totalPrice" value="${order.totalPrice }" />
									</jsp:include>
								</c:forEach>
							</tbody>
						</table>
					</div>
			</div>

			<div class="col-lg-5 py-3">
				<h3>
					Top 5 khách hàng mua nhiều nhất
					</h1>
					<div class="bg-white shadow-sm rounded-3 p-4"
						style="border: solid;; height: 200px; overflow-y: scroll">
						<table class="table table-strip table" style="color: black;">

							<thead>
								<tr>
									<th>User ID</th>
									<th>UserName</th>
									<th>Total price</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${listUser}">
									
									<tr>
										<td>${item[0]}</td>
										<td>${item[1]}</td>
										<td>${item[2]}</td>
									</tr>
							
								</c:forEach>

							</tbody>
						</table>
					</div>
			</div>

			<div class="col-12 py-3">
				<h3>
					10 sp bán chạy nhất
					</h1>
					<div class="bg-white shadow-sm rounded-3 p-4"
						style="border: solid; height: 400px; overflow-y: scroll;">
						<table class="table table-strip table" style="color: black">
							<thead>
								<tr>
									<th>Product ID</th>
									<th>Product Name</th>
									<th>Brand</th>
									<th>Category</th>
									<th>Quantity</th>
									<th>Total Price</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach var="item" items="${listProduct}">
									
									<tr>
										<td>${item[0]}</td>
										<td>${item[1]}</td>
										<td>${item[2]}</td>
										<td>${item[3]}</td>
										<td>${item[4]}</td>
										<td>${item[5]}$</td>
									</tr>
							
								</c:forEach>
								
							</tbody>
						</table>
					</div>
			</div>
		</div>

	</body>
</html>