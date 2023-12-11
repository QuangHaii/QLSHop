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
	<div class="container">
		<main>
			<div class="py-4 text-center">
				<h2>Thông tin thanh toán</h2>
				<p class="lead">Thông tin thanh toán ID:${payment.paymentID}</p>
			</div>
						<h4 class="mb-3">Payment</h4>

						<div class="my-3">
							<c:forEach var="method" items="${listMethod }">
								<c:choose>
									<c:when test="${payment.method == method }">
										<div class="form-check">
											<input name="method" value="${method}" type="radio"
												class="form-check-input" checked>${method}
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-check">
											<input name="method" value="${method}" type="radio"
												class="form-check-input" disabled>${method}
										</div>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</div>

						<div class="row gy-3" id="showCredit">
							<div class="col-md-6">
								<label class="form-label">Name on card</label> <input
									name="nameOnCard" type="text" class="form-control" id="cc-name"
									placeholder="" value="${payment.nameOnCard }" required disabled>

								<div class="invalid-feedback">Name on card is required</div>
							</div>

							<div class="col-md-6">
								<label class="form-label">Card number</label> <input
									name="cardNumber" type="text" class="form-control"
									id="cc-number" placeholder="" disabled required
									value="${payment.cardNumber }">


								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>

							<div class="col-sm-6">
								<label class="form-label">CVV</label> <input name="cvv"
									type="text" value="${payment.cvv }" class="form-control"
									id="cc-expiration" placeholder="" disabled required>

								<div class="invalid-feedback">Expiration date required</div>
							</div>

							<div class="col-sm-3">
								<label class="form-label">Expiration Month</label> <input
									name="expirationMonth" type="text" class="form-control"
									id="cc-cvv" placeholder="" disabled
									value="${payment.expirationMonth }" required>

								<div class="invalid-feedback">Security code required</div>
							</div>

							<div class="col-sm-3">
								<label class="form-label">Expiration Year</label> <input
									name="expirationYear" type="text" class="form-control"
									id="cc-expiration" placeholder="" disabled
									value="${payment.expirationYear }" required>

								<div class="invalid-feedback">Security code required</div>
							</div>

						</div>

						<hr class="my-4">

						<a href="/QLShop/Payment/Index" class="w-100 btn btn-primary btn-lg">Go Back</a>
				</div>
			</div>
		</main>
	</div>
</body>
</html>