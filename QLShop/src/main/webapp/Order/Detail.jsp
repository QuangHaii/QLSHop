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
<%@include file="/SharedLayout/Admin.jsp" %>
<div class="container">
    <form method="get" asp-action="Detail" enctype="multipart/form-data">
        <main>
            <div class="py-4 text-center">
                <h2>Thông tin đơn hàng</h2>
                <p class="lead">Thông tin đơn hàng ID:${customer.orderID} </p>
            </div>

            <div class="row g-5">
				<c:forEach var="item" items="${orderDetailList }">
					<c:set var="count" value="${count+item.quantity}" />
				</c:forEach>	
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Your cart</span>
                        <span class="badge bg-primary rounded-pill">${count }</span>
                    </h4>
                    <ul class="list-group mb-3">
                    	<c:set var="total" value="0" />
                        <c:forEach var="item" items="${orderDetailList}">
                        	<c:set var="total" value="${total + item.product.price*item.quantity }"/>
                        	<jsp:include page="/material/createPaymentItem.jsp">
								<jsp:param name="productName"
									value="${item.product.productName }" />
								<jsp:param name="quantity" value="${item.quantity }"/>
								<jsp:param name="brand" value="${item.product.brand }" />
								<jsp:param name="price" value="${item.product.price * item.quantity }" />
								<jsp:param name="category"
									value="${item.product.category }" />
							</jsp:include>
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                        <li class="list-group-item d-flex justify-content-between"><span>Total
								(USD)</span> <strong>${total}$</strong></li>
						<li class="list-group-item d-flex justify-content-between"><span>Total
								(Discounted): </span> <strong>${customer.totalPrice}$</strong></li>
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
						<div class="row g-3">

							<div class="col-sm-6">
								<label class="form-label">Full name</label> <input type="text"
									class="form-control" id="firstName" placeholder=""
									value="${customer.fullName}" disabled required>

								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>

							<div class="col-sm-6">
								<label class="form-label">Username</label> <input type="text"
									class="form-control" id="lastName" placeholder=""
									value="${username}" disabled required>

								<div class="invalid-feedback">Your username is required.</div>
							</div>

							<div class="col-12">
								<label class="form-label">Phone number</label>
								<div class="input-group has-validation">
									<input type="text" class="form-control"
										value="${customer.phone}" disabled required>

									<div class="invalid-feedback">Your phone number is
										required.</div>
								</div>
							</div>

							<div class="col-12">
								<label class="form-label">Email <span
									class="text-body-secondary">(Optional)</span></label> <input
									type="email" class="form-control" id="email"
									placeholder="you@example.com" value="${customer.email }"
									disabled>

								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
							</div>

							<div class="col-12">
								<label class="form-label">Address</label> <input type="text"
									class="form-control" id="address" placeholder="1234 Main St"
									value="${customer.address }" disabled required>


								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>
						</div>
						<br />
                        

                        <a href="/QLShop/Order/Index" class="w-100 btn btn-primary btn-lg" type="submit">Back</a>
                    </form>
                </div>
            </div>
        </main>
    </form>
</div>

<!-- @section Scripts{
    @{
        await Html.RenderPartialAsync("_ValidationScriptsPartial");
    }
    <script>
        function show1() {
            document.getElementById('showCredit').style.display = "none";
        }
        function show2() {
            document.getElementById('showCredit').style.display = "flex";
        }
        function show3() {
            document.getElementById('showCredit').style.display = "flex";
        }
    </script>
}
 -->
</body>
</html>