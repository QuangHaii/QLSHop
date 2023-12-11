<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<head>
	<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@ViewData["Title"] - DCT1205</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.2-dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-5.3.2-dist/css/site.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/css/sitebars.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar bg-body-tertiary bg-info" data-bs-theme="info">
        <div class="container-fluid">
            <a class="navbar-brand" asp-controller="User" asp-action="Home">
                <img src="/QLShop/images/Dotabg.jpg" alt="logo" width="120" height="60">
            </a>
            <div class="navbar-menu-wrapper bg-info d-flex align-items-center justify-content-end">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit" style="color: snow;border: 1px solid #dee2e6;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                        </svg>
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container-fluid page-body-wrapper">
        <div class="flex-shrink-0 p-3" style="width: 280px;  border-right: 1px solid #d3d3d3;background-image: url(https://colorlib.com/etc/bootstrap-sidebar/sidebar-06/images/bg_1.jpg);">
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
                        <span class="fa fa-home mr-3"></span>
                        Home
                    </button>
                    <div class="collapse" id="home-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a class="nav-link" href="/QLShop/User/Admin">Admin Hone</a></li>
                            <li><a class="nav-link" href="/QLShop/User/Home.jsp">User Home</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1"> 
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#product-collapse" aria-expanded="false">
                        Product
                    </button>
                    <div class="collapse" id="product-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li class="nav-item"><a class="nav-link" href="/QLShop/Product/Create"> New Product</a></li>
                            <li class="nav-item"><a class="nav-link" href="/QLShop/Product/Index"> All Produt</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#payment-collapse" aria-expanded="false">
                        Payment
                    </button>
                    <div class="collapse" id="payment-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li class="nav-item"><a class="nav-link" href="/QLShop/Payment/Index"> All Payment</a></li>
                        </ul>
                    </div>
                </li>
     
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                        Orders
                    </button>
                    <div class="collapse" id="orders-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li class="nav-item"><a class="nav-link" href="/QLShop/Order/Index"> All Order</a></li>

                        </ul>
                    </div>
                </li>
                <c:set var="acc" value="${sessionScope.User }"/>
                <c:if test="${acc.role.roleID == 1 }">
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#role-collapse" aria-expanded="false">
                        User
                    </button>
                    <div class="collapse" id="role-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li class="nav-item">
                                <a class="nav-link text-white" href="/QLShop/User/Index">User Index</a>
                            </li>

                        </ul>
                    </div>
                </li>
                </c:if>

                <li class="border-top my-3"></li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">        
                            <strong>Admin</strong>
                    </button>
                    <div class="collapse" id="account-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="/QLShop/User/Profile" title="Manage" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a></li>
                            <li>
                                <a class="btn btn-warning btn-outline-light me-2" href="#userHomePage">
                                    <form class="form-inline"  action="/QLShop/User/Logout">
                                        <button type="submit" class="nav-link btn btn-link text-dark">Sign out</button>
                                    </form>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    <script src="~/lib/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-5.3.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="~/js/site.js" asp-append-version="true"></script>
</body>
</html>