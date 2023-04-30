<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>首页</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css" type="text/css" media="all">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/font-awesome.css" type="text/css" media="all">
    <!-- Font-Awesome-Icons-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/owl.carousel.css" type="text/css" media="all" />
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/style.css" type="text/css" media="all" />


    <!-- Style-CSS -->
    <!-- //css files -->
    <!-- web fonts -->
    <link href="http://fonts.googleapis.com/css?family=Molle:400i&amp;subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- //sticky navigation 首页轮播图 -->
<div class="w3l-main" id="home1">
    <div class="container">
    </div>
    <!-- Slider -->
    <div class="slider">
        <div class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>
                    <div class="slider-img-w3layouts one">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>萌宠联盟
                                        <span></span>
                                        <span></span>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts two">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>萌宠联盟
                                        <span></span>
                                        <span></span>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts three">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>萌宠联盟
                                        <span></span>
                                        <span></span>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-img-w3layouts four">
                        <div class="w3l-overlay">
                            <div class="container">
                                <div class="banner-text-info">
                                    <h3>萌宠联盟
                                        <span></span>
                                        <span></span>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--//Slider-->
</div>
<!--//banner-->



<!-- footer -->
<section class="footer-w3 foothei">
    <div class="container" style="padding-left: 155px">
        <!--联系方式-->
        <div class="col-lg-4 col-md-4 col-sm-4 footer-agile1" data-aos="zoom-in">
            <p style="padding-left: 140px;width: 1000px;letter-spacing: 6px;font-family: 幼圆;font-weight: bold;color:#ff6759">服务电话&nbsp;&nbsp;<span style="font-size: 18px;color: #ffff00">186******39</span>

           反馈&nbsp;&nbsp;<span  style="font-size: 18px;color: #ffff00">MengChong@qing.com</span>

           &nbsp;&nbsp;

            <div style="text-align: center;margin-top: 5px;padding-left: 200px;position: relative; width: 600px;color: #fff">
            Copyright &copy; 2023-2099 @qing 所有
        </div>
            </p>
        </div>

    </div>

</section>


<!-- js 非得用2.0版本得jQuery-->
<script src="${path}/static/js/user/jquery-2.2.3.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->

<!-- Banner Slider -->
<script src="${path}/static/js/user/responsiveslides.min.js"></script>
<script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            pager: true,
            nav: true,
            speed: 1000,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });
    });

</script>
<!-- //Banner Slider -->

</body>
</html>
