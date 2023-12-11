<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/SharedLayout/User.jsp" %>
    
<body>
    <main>
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="10000">
                    <img src="/QLShop/images/nike_carousel.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="2000">
                    <img src="/QLShop/images/coolmate_carousel.jpeg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/QLShop/images/adidas_carousel.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div id="marketing" class="container marketing">


            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading fw-normal lh-1">Bạn muốn một đôi giày chất lượng cao, thoải mái và phong cách?</h2>
                    <p class="lead">Sản phẩm giày adidas được làm từ chất liệu cao cấp, bền bỉ và dễ chịu, có thiết kế đẹp mắt, trẻ trung và năng động. Sản phẩm giày adidas sẽ là người bạn đồng hành lý tưởng cho bạn khi chơi thể thao, đi dạo hay đi làm</p>
                </div>
                <div class="col-md-5">
                    <img src="/QLShop/images/adidas_shoes.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="...">
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7 order-md-2">
                    <h2 class="featurette-heading fw-normal lh-1">Bộ sưu tập Nike mới nhất</h2>
                    <p class="lead">Bộ sưu tập Nike sẽ hướng đến thiết kế theo phong cách thời trang đường phố. Các sản phẩm giúp cho người mặc cảm giác năng động, phóng khoáng và thoải mái nhưng vẫn thể hiện được rất rõ gu thời trang mang dấu ấn cá nhân.</p>
                </div>
                <div class="col-md-5 order-md-1">
                    <img src="/QLShop/images/nike_mkt.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="...">
                </div>
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading fw-normal lh-1">Coolmate Active</h2>
                    <p class="lead">
                        
                        Dòng sản phẩm thể thao ứng dụng các chất liệu và thiết kế mới với nhiều tính năng ưu việt giúp bạn thoải mái và tập trung hơn vào các chuyển động của mình.
                    </p>
                </div>
                <div class="col-md-5">
                    <img src="/QLShop/images/coolmate_mkt.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="...">
                </div>

                <hr class="featurette-divider">
                

                <div id="about" class="row">
                    <div class="col-lg-4">
                        <img src="/QLShop/images/avt_male.png" class="d-block w-100" alt="...">
                        <h2 class="fw-normal">Văn Trí</h2>
                        <p>Founder của một startup về bán hàng online muốn tạo ra một nền tảng thương mại điện tử dễ sử dụng và hiệu quả cho cả người bán và người mua hàng</p>
                    </div>
                    <div class="col-lg-4">
                        <img src="/QLShop/images/avt_male.png" class="d-block w-100" alt="...">
                        <h2 class="fw-normal">Thầy Phiêu</h2>
                        <p>Giáo viên hướng dẫn và là người truyền kiến thức và kinh nghiệm tạo nền tảng sáng lập nên trang thương mại điện tử trực tuyến</p>
                    </div>
                    <div class="col-lg-4">
                        <img src="/QLShop/images/avt_male.png" class="d-block w-100" alt="...">
                        <h2 class="fw-normal">Quang Hải</h2>
                        <p>Founder của một startup về bán hàng online muốn tạo ra một nền tảng thương mại điện tử dễ sử dụng và hiệu quả cho cả người bán và người mua hàng</p>
                    </div>
                </div>


            </div>
        </div>
    </main>
</body>


</body>
</html>