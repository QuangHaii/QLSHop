<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>@ViewData["Title"] - DCT1205</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/site.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link
	href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/sitebars.css"
	rel="stylesheet">
</head>
<body>
	<header class="p-3 text-bg-dark"
		style="background-color: #2b80ff !important;">
		<div id="userHomePage" class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<img src="/QLShop/images/Dotabg.jpg" alt="logo" width="120"
					height="60">
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/QLShop/User/Home.jsp"
						class="nav-link px-2 text-white">Home</a></li>
					<li><a href="#carouselExampleInterval"
						class="nav-link px-2 text-white">Introduce</a></li>
					<li><a href="#about" class="nav-link px-2 text-white">About</a></li>
					<li><a href="/QLShop/User/Shopping"
						class="nav-link px-2 text-white">Product</a></li>
					<!--   @if (SignInManager.IsSignedIn(User))
                    {
                        <li><a class="nav-link px-2 text-white" asp-controller="Home" asp-action="Index">Admin</a></li>
                    }   -->
				</ul>

				<form class="d-flex" role="search" action="/QLShop/User/Shopping" method="get" style="margin-right: 2rem;">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" value="" name="searchString">
					<button class="btn btn-outline-success" type="submit"
						style="color: snow; border: 1px solid #dee2e6;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                            </svg>
					</button>
				</form>

				<div class="text-end">
					<c:set var="user" value="${sessionScope.User }" />
					<c:choose>
						<c:when test="${not empty user }">

							<c:set var="cart" value="${sessionScope.Cart }" />
							<c:set var="count" value="0" />
							<c:if test="${not empty cart }">
								<c:forEach var="item" items="${cart }">
									<c:set var="count" value="${count+item.value.quantity}" />
								</c:forEach>
							</c:if>
							<a href="/QLShop/User/ViewCart" class="btn btn-ouline-dark"
								type="submit"> <i class="fa-solid fa-cart-shopping fa-2xl"
								style="color: #000000;"></i> Cart <span id="badge"
								class="badge bg-dark text-white ms-1 rounded-pill">${count}</span>
							</a>


							<button type="button" class="btn btn-outline-light me-2">
								<a class="nav-link text-dark" href="/QLShop/User/Profile"><i
									class="fa-solid fa-user fa-xl" style="color: #ffffff;"></i></a>
							</button>

							<a class="btn btn-warning btn-outline-light me-2">
								<form class="form-inline" action="/QLShop/User/Logout">
									<button type="submit" class="nav-link btn btn-link text-dark">
										<i class="fa-solid fa-right-from-bracket fa-xl"
											style="color: #ffffff;"></i>
									</button>
								</form>
							</a>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-outline-light me-2">
								<a class="nav-link text-white" href="/QLShop/User/Register">Register</a>
							</button>
							<button type="button" class="btn btn-warning">
								<a class="nav-link text-white" href="/QLShop/User/Login">Login</a>
							</button>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</div>
	</header>
	<!-- <main>
		<div class="main-panel">
		
		</div>
		
    </main>

 -->

	<script src="~/lib/jquery/dist/jquery.min.js"></script>
	<script
		src="http://localhost:8080/boostrap/bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
	<script src="~/js/site.js" asp-append-version="true"></script>

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
        sessionStorage.setItem("searchString", @ViewData["CurrentFilter"])
        let searchString = sessionStorage.getItem("searchString");
    </script>
</body>
</body>
</html>