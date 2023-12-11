<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/SharedLayout/User.jsp"%>

	<section class="py-5">
		<div class="card">
			<div class="card-body" style="background: white; text-align: center;">
			<c:set var="cart" value="${sessionScope.Cart }"/>
			<c:if test="${not empty cart }">
				<div class="row">
					<div class="col-md-12 table-responsive-md">
						<table class="table table-strip table" style="color: black;">
							<thead>
								<tr>
									<th>No.</th>
									<th>Product Name</th>
									<th>Category</th>
									<th>Brand</th>
									<th>Quantity</th>
									<th>Product Price</th>
									<th>Discount</th>
									<th>Total Price</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="count" value="0"/>
								<c:forEach var="rows" items="${cart }">
								<c:set var="count" value="${count + 1}"/>
								<tr>
									<td>${count}</td>
									<td>${rows.value.sanpham.productName}</td>
									<td>${rows.value.sanpham.category}</td>
									<td>${rows.value.sanpham.brand}</td>
									<td>${rows.value.quantity}</td>
									<td>${rows.value.sanpham.price}$</td>
									<td>${rows.value.sanpham.discountPercentage}%</td>
									<td>${rows.value.sanpham.price*rows.value.quantity*(1 - (rows.value.sanpham.discountPercentage/100))}</td>
									<td> <a class="text-danger" href="/QLShop/User/DeleteItem?id=${rows.value.sanpham.productID}">
                                        <i class="far fa-trash-alt"></i> Delete
                                    </a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>

					<div class="container overflow-hidden text-center">
						<div class="row gx-5"
							style="place-content: center; margin-top: 2em;">
							<div class="col" style="width: 45%;">
								<a class="nav-link  btn btn-primary btn-lg"
									href="/QLShop/Payment/Create"
									style="color: white; font-size: 1.6em;">Continue to
									checkout</a>
							</div>
							<div class="col" style="width: 45%;">
								<a class="nav-link  btn btn-primary btn-lg"
									href="/QLShop/User/Shopping"
									style="color: white; font-size: 1.6em;">Back to shopping</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--        @*<div class="py-5"
            <li class="list-group-item d-flex justify-content-between">
                            <strong style="padding-left:1rem">Total </strong>
                            <strong style="padding-left:58.3rem">$@Model.totalPrice</strong>
                        </li>
            <button class="w-100 btn btn-primary btn-lg" type="submit">
                <a class="nav-link" asp-controller="Payment" asp-action="Create" style="color: white">Continue to checkout</a>
            </button>
        </div>*@
 -->
		</div>
	</section>
</body>
</html>