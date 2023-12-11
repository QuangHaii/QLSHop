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
<div class="main-panel">
<div class="card">
    <div class="card-body" style="background: white">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a asp-controller="Home" asp-action="Index">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">All Payment</li>
            </ol>
        </nav>
        <div class="row">
            <div class="col-md-12 table-responsive-md">
                <table class="table table-strip table" style="color: black;">
                    <thead>
                        <tr>
                            <th>Payment id</th>
                            <th>Method</th>
                            <th>Name on card</th>
                            <th>Card number</th>
                            <th>Expiration</th>
                            <th>CVV</th>
                            <th class="text-warning">Action</th>
                        </tr>
                    </thead>

                    <tbody>
					<c:forEach var="payment" items="${listPayments }">
						<jsp:include page="/material/paymentItem.jsp">
							<jsp:param name="paymentID" value="${payment.paymentID }"/>
							<jsp:param name="method" value="${payment.method }"/>
							<jsp:param name="nameOnCard" value="${payment.nameOnCard }"/>
							<jsp:param name="cardNumber" value="${payment.cardNumber }"/>
							<jsp:param name="expirationMonth" value="${payment.expirationMonth }"/>
							<jsp:param name="expirationYear" value="${payment.expirationYear }"/>
							<jsp:param name="CVV" value="${payment.cvv}"/>
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
							href="/QLShop/Payment/Index?pageIndex=1"
							class="page-link"> First </a></li>
						<li class="page-item"><a
							href="/QLShop/Payment/Index?pageIndex=${pageIndex - 1}"
							class="page-link" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a></li>
					</c:if>

					<c:forEach var="page" begin="${startPage }" end="${endPage }">
						<li class="page-item"><a
							href="/QLShop/Payment/Index?pageIndex=${page}"
							class="page-link"> ${page } </a></li>
					</c:forEach>

					<c:if test="${pageIndex < totalPages}">
						<li class="page-item"><a
							href="/QLShop/Payment/Index?pageIndex=${pageIndex + 1}"
							class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
						</a></li>
						<li class="page-item"><a
							href="/QLShop/Payment/Index?pageIndex=${totalPages}"
							class="page-link"> Last </a></li>
					</c:if>

				</ul>
			</div>

		</div>
</body>
</html>