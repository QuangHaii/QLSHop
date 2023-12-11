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
	<%@include file="/SharedLayout/User.jsp"%>
	<div class="container">
		<main>
			<div class="py-4 text-center">
				<h2>Checkout form</h2>
				<p class="lead">Vui lòng điền thông tin và kiểm tra sản phẩm
					trước khi thanh toán</p>
			</div>
			<c:set var="count" value="0" />
			<c:set var="cart" value="${sessionScope.Cart }" />
			<c:forEach var="item" items="${cart }">
				<c:set var="count" value="${count+item.value.quantity}" />
			</c:forEach>
			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">Your cart</span> <span
							class="badge bg-primary rounded-pill">${count }</span>
					</h4>
					<ul class="list-group mb-3">
						<c:set var="total1" value="0" />
						<c:set var="total2" value="0" />
						<c:forEach var="product" items="${cart }">
							<c:set var="total1"
								value="${total1 + product.value.sanpham.price*product.value.quantity}" />
							<c:set var="total2"
								value="${total2 + product.value.sanpham.price*product.value.quantity*(1 - (product.value.sanpham.discountPercentage/100))}" />
							<jsp:include page="/material/createPaymentItem.jsp">
								<jsp:param name="productName"
									value="${product.value.sanpham.productName }" />
								<jsp:param name="quantity" value ="${product.value.quantity }"/>
								<jsp:param name="brand" value="${product.value.sanpham.brand }" />
								<jsp:param name="price" value="${product.value.sanpham.price*product.value.quantity }" />
								<jsp:param name="category"
									value="${product.value.sanpham.category }" />
							</jsp:include>
						</c:forEach>
						<li class="list-group-item d-flex justify-content-between"><span>Total
								(USD)</span> <strong>${total1}$</strong></li>
						<li class="list-group-item d-flex justify-content-between"><span>Total
								(Discounted): </span> <strong>${total2}$</strong></li>
					</ul>

					<form class="card p-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Promo code">
							<button type="submit" class="btn btn-secondary">Redeem</button>
						</div>
					</form>
				</div>


				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3">Billing address</h4>
					<form method="post" action="/QLShop/Payment/Create"
						class="needs-validation" novalidate>
						<input type="hidden" name="totalPrice" value="${total2}"/>
						<div class="row g-3">

							<div class="col-sm-6">
								<label class="form-label">Full name</label> <input
									name="fullname" type="text" class="form-control" id="firstName"
									placeholder="" value="${user.fullname}" required>

								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>

							<div class="col-sm-6">
								<label class="form-label">Username</label> <input
									name="username" type="text" class="form-control" id="lastName"
									placeholder="" value="${user.username}" required disabled>

								<div class="invalid-feedback">Your username is required.</div>
							</div>

							<div class="col-12">
								<label class="form-label">Phone number</label>
								<div class="input-group has-validation">
									<input name="phone" type="text" class="form-control"
										value="${user.phone}" required>

									<div class="invalid-feedback">Your phone number is
										required.</div>
								</div>
							</div>

							<div class="col-12">
								<label class="form-label">Email <span
									class="text-body-secondary">(Optional)</span></label> <input
									name="email" type="email" class="form-control" id="email"
									placeholder="you@example.com" value="${user.email }">

								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
							</div>

							<div class="col-12">
								<label class="form-label">Address</label> <input name="address"
									type="text" class="form-control" id="address"
									placeholder="1234 Main St" value="${user.address }" required>


								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
						</div>
						<br />
						<h4 class="mb-3">Payment</h4>

						<div class="my-3">
							<c:forEach var="method" items="${listMethod }">
								<c:choose>
									<c:when test="${paymentMethod == method }">
										<div class="form-check">
											<input name="method" value="${method}" type="radio"
												class="form-check-input" checked>${method}
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-check">
											<input name="method" value="${method}" type="radio"
												class="form-check-input">${method}
										</div>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</div>

						<div class="row gy-3" id="showCredit">
							<div class="col-md-6">
								<label class="form-label">Name on card</label> <input
									name="nameOnCard" type="text" class="form-control" id="cc-name"
									placeholder="" required>

								<div class="invalid-feedback">Name on card is required</div>
							</div>

							<div class="col-md-6">
								<label class="form-label">Card number</label> <input
									name="cardNumber" type="text" class="form-control"
									id="cc-number" placeholder="" required>


								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>

							<div class="col-sm-6">
								<label class="form-label">CVV</label> <input name="cvv"
									type="text" class="form-control" id="cc-expiration"
									placeholder="" required>

								<div class="invalid-feedback">Expiration date required</div>
							</div>

							<div class="col-sm-3">
								<label class="form-label">Expiration Month</label> <input
									name="expirationMonth" type="text" class="form-control"
									id="cc-cvv" placeholder="" required>

								<div class="invalid-feedback">Security code required</div>
							</div>

							<div class="col-sm-3">
								<label class="form-label">Expiration Year</label> <input
									name="expirationYear" type="text" class="form-control"
									id="cc-expiration" placeholder="" required>

								<div class="invalid-feedback">Security code required</div>
							</div>

						</div>
						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit">Hoàn
							tất thanh toán</button>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>