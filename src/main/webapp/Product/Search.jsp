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
<body>
	<c:set var="searchString" value="${sessionScope.Search }" />
	<form method="get">
		<input type="hidden" name="searchString" value="${searchString }" /> <input
			type="hidden" name="sortOrder" value="${sortString }" />
		<div style="float: right; padding-right: 3rem !important;">
			<span>Sort Category: </span> <select class="form-select"
				onchange="this.form.submit()" name="cateSort"
				aria-label="Default select example"
				style="display: unset; width: auto;">
				<option value="">Any</option>
				<option value="Hat"
					<c:if test="${cateString.contains('Hat')}"> selected </c:if>>Category: Hat</option>
				<option value="Shirt"
					<c:if test="${cateString.contains('Shirt')}"> selected </c:if>>Category: Shirt</option>
				<option value="Pant"
					<c:if test="${cateString.contains('Pant')}"> selected </c:if>>Category: Pant</option>
				<option value="Shoes"
					<c:if test="${cateString.contains('Shoes')}"> selected </c:if>>Category: Shoes</option>
				<option value="Gloves"
					<c:if test="${cateString.contains('Gloves')}"> selected </c:if>>Category: Gloves</option>
			</select>
		</div>
	</form>
	<section class="py-5">
		<form method="get">
			<input type="hidden" name="searchString" value="${searchString }" />
			<input type="hidden" name="cateSort" value="${cateString }" />
			<div style="float: right; padding-right: 3rem !important;">
				<span>Sort by: </span> <select class="form-select"
					onchange="this.form.submit()" name="sortOrder"
					aria-label="Default select example"
					style="display: unset; width: auto;">
					<option value="">None</option>
					<option value="a_to_z"
						<c:if test="${sortString.contains('a_to_z')}"> selected </c:if>>Name:
						A - Z</option>
					<option value="z_to_a"
						<c:if test="${sortString.contains('z_to_a')}"> selected </c:if>>Name:
						Z - A</option>
					<option value="price_desc"
						<c:if test="${sortString.contains('price_desc')}"> selected </c:if>>Price:
						High - Low</option>
					<option value="price_asc"
						<c:if test="${sortString.contains('price_asc')}"> selected </c:if>>Price:
						Low - High</option>
				</select>
			</div>
		</form>

		<!--  <a asp-route-sortOrder="@ViewData["DateSortParm"]"
           asp-route-currentFilter="@ViewData["CurrentFilter"]"
           asp-action="Search">date</a>
        <a asp-route-sortOrder="@ViewData["PriceSortParm"]"
           asp-route-currentFilter="@ViewData["CurrentFilter"]"
           asp-action="Search">price</a>
 -->
		<div class="container px-4 px-lg-5 mt-5">
			<c:if test="${listProducts.isEmpty() }">
				<h1 style="color: red; font-weight: bold;">No Result Found !!</h1>
			</c:if>
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

				<c:forEach var="product" items="${listProducts }">
					<jsp:include page="/material/UserProductItem.jsp">
						<jsp:param name="productID" value="${product.productID }" />
						<jsp:param name="productName" value="${product.productName }" />
						<jsp:param name="brand" value="${product.brand }" />
						<jsp:param name="price" value="${product.price }" />
						<jsp:param name="category" value="${product.category }" />
						<jsp:param name="discountPercentage"
							value="${product.discountPercentage }" />
						<jsp:param name="imgURL" value="${product.imgURL }" />
					</jsp:include>
				</c:forEach>
			</div>
		</div>
		<br />
		<div class="text-end">
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${pageIndex > 1}">
						<li class="page-item"><a
							href="/QLShop/User/Shopping?pageIndex=1&sortOrder=${sortString }&searchString=${searchString}&cateSort=${cateString}"
							class="page-link"> First </a></li>
						<li class="page-item"><a
							href="/QLShop/User/Shopping?pageIndex=${pageIndex - 1}&sortOrder=${sortString }&searchString=${searchString}&cateSort=${cateString}"
							class="page-link" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a></li>
					</c:if>

					<c:forEach var="page" begin="${startPage }" end="${endPage }">
						<li class="page-item"><a
							href="/QLShop/User/Shopping?pageIndex=${page}&sortOrder=${sortString }&searchString=${searchString}&cateSort=${cateString}"
							class="page-link"> ${page } </a></li>
					</c:forEach>

					<c:if test="${pageIndex < totalPages}">
						<li class="page-item"><a
							href="/QLShop/User/Shopping?pageIndex=${pageIndex + 1}&sortOrder=${sortString }&searchString=${searchString}&cateSort=${cateString}"
							class="page-link" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
						</a></li>
						<li class="page-item"><a
							href="/QLShop/User/Shopping?pageIndex=${totalPages}&sortOrder=${sortString }&searchString=${searchString}&cateSort=${cateString}"
							class="page-link"> Last </a></li>
					</c:if>

				</ul>
			</div>

		</div>
	</section>
</body>

<!-- @section Scripts{
    @{
        await Html.RenderPartialAsync("_ValidationScriptsPartial");
    }
    <script>
        $('input.input-qty').each(function () {
            var $this = $(this),
                qty = $this.parent().find('.is-form'),
                min = Number($this.attr('min')),
                max = Number($this.attr('max'))
            if (min == 0) {
                var d = 0
            } else d = min
            $(qty).on('click', function () {
                if ($(this).hasClass('minus')) {
                    if (d > min) d += -1
                } else if ($(this).hasClass('plus')) {
                    var x = Number($this.val()) + 1
                    if (x <= max) d += 1
                }
                $this.attr('value', d).val(d)
            })
        })

        $(".alertLogin").click(function () {
            alert("please login before purchase")
        });

    </script>
}
 -->
</div>
</body>
</html>