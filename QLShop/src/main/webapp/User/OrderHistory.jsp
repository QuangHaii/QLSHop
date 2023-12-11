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
<%@include file="/SharedLayout/User.jsp" %>
<c:set var="user" value="${sessionScope.User }"/>
<h1>Manage your account</h1>

<div>
    <h2>Change your account settings</h2>
    <hr />
    <div class="row">
        <div class="col-md-3">
            <partial name="_ManageNav" />
            <form action="/QLShop/User/Profile" method="post">
            <ul class="nav navbar-nav">
            <li><a href="/QLShop/User/Profile" class="form-control" style="color: blue;">Edit Profile</a></li>
            <li><a href="/QLShop/User/ChangePassword" class="form-control" style="color: blue;">Change Password</a></li>
            <li><a href="/QLShop/User/OrderHistory" class="form-control" style="color: blue;">Order History</a></li>
            </ul>
            </form>
        </div>
        <div class="col-md-9">
        <div class="row">
            <div class="col-md-12 table-responsive-md" >
 				<h1>Lịch sử mua hàng</h1>
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
										<jsp:param name="paymentID" value="${order.payment.paymentID }" />
										<jsp:param name="fullName" value="${order.fullName }"/>
										<jsp:param name="phone" value="${order.phone }" />
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
</body>
</html>