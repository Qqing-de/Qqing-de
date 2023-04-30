<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>宠物知识</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>

    <!-- css files -->
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/style.css" type="text/css" media="all" />
    <link href='${path}/static/css/user/simplelightbox.min.css' rel='stylesheet' type='text/css'>
</head>
<style>
    .ziti{
        font-size: 24px;
        color: #ff3535;
        font-weight: bold;
    }
    /* 引入字体 */
    @import url("https://fonts.googleapis.com/css?family=Amatic+SC");
    body {
        /* 添加透视效果 */
        transform-style: preserve-3d;
        perspective: 1800px;
    }
    .card {
        margin-left: 500px;
        margin-top: -25px;
        margin-bottom: 25px;
        width: 200px;
        height: 100px;
        border-radius: 105px;
        box-shadow: 0 10px 20px 20px rgba(255, 255, 255,0.87);
        /* 修改角度为--rotate */
        background: linear-gradient(var(--rotate), #ff1d74, #e3820c 43%, #c28846);
        /* 添加旋转动画 */
        animation: bg 2.5s infinite linear, rotate 1s infinite alternate-reverse;
        position: relative;
        transform: rotateX(10deg) rotateY(15deg);
    }
    .card::after {
        content: "";
        position: absolute;
        width: 296px;
        height: 196px;
        left: calc(50% - 148px);
        top: calc(50% - 98px);
        /*background: #fff;*/
        border-radius: 15px;
    }
    .card span {
        position: absolute;
        width: 100%;
        text-align: center;
        z-index: 1;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        font-size: 26px;
        font-weight: bold;
        color: #fff;
        letter-spacing: 2px;
        font-family: "Amatic SC";
        cursor: default;
        /* 添加过渡效果 */
        transition: all 0.5s;
    }
    /* span添加hover */
    .card:hover span {
        background: linear-gradient(45deg, #ff1d74, #e3820c 43%, #c28846);
        color: transparent;
        background-clip: text;
        -webkit-background-clip: text;
    }
    /* 定义@property */
    @property --rotate {
        syntax: "<angle>";
        initial-value: 0deg;
        inherits: false;
    }
    @keyframes bg {
        0% {
            --rotate: 0deg;
        }
        100% {
            --rotate: 360deg;
        }
    }
    @keyframes rotate {
        0% {
            transform: rotateX(10deg) rotateY(15deg);
        }
        100% {
            transform: rotateX(-10deg) rotateY(-15deg);
        }
    }
    .image_box:before {
        display: block;
        content: " ";
        position: absolute;
        top: 15px;
        left: 20px;
        width: 64px;
        height: 64px;
        background: url(/static/images/user/top_case.png) no-repeat;
    }
    .image_box:after {
        display: block;
        content: " ";
        position: absolute;
        bottom: 70px;
        right: 110px;
        width: 64px;
        height: 64px;
        background: url(/static/images/user/top_case.png) no-repeat;
        transform: rotate(180deg);
    }
    .image_box{
        height: 450px;
        overflow: hidden;
        position: absolute;
        padding-top: 35px;
        padding-right: 35px;
        padding-bottom: 35px;
        padding-left: 35px;
        margin-right: 0px;
        margin-left: 580px;
    }

    .image_box ul{
        height: 370px;
        width: 600px;
        margin-top: 0px;
        margin-right: -8px;
        margin-bottom: 0px;
        margin-left: -8px;
        display: block;
        list-style-type: disc;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        padding-inline-start: 40px;
    }
    .imgbox img{
        margin-right: 3px;
        margin-bottom: 3px;
        transition: all 0.2s linear;
        border-radius: 8px;
    }
    .imgbox img:hover{
        transition: all 0.2s linear;
        transform:scale(0.9,0.9);
        border-radius: 15px;
    }
.position1{
    float: left;
    left: -10px;
    top: 0px;
}
    .position2{
        float: left;
        left: -30px;
        top: 0px;
    }
    .position3{
        float: left;
        left: -10px;
        top: 20px;
    }
    .position4{
        float: left;
        left: -10px;
        top: 0px;
    }
</style>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- welcome -->
<div class="about" id="about">
    <div class="container">
        <div class="card">  <span>萌宠联盟</span></div>

        <div class="image_box">
            <ul>
                <li class="imgbox position1">
                    <img src="/static/images/animal/cat1_1.jpg"  width="217px" height="144px" alt="" /></li>
<%--                    <img alt="进入首页" src="../img/pro_bg.jpg" width="217px" height="144px"></a></li>--%>
                <li class="imgbox position2">
                    <img src="/static/images/animal/cat2_1.jpg"  width="217px" height="144px" alt="" /></li>
                <li class="imgbox position3">
                    <img src="/static/images/animal/cat2_3.jpg"  width="217px" height="144px" alt="" /></li>
                <li class="imgbox position4">
                    <img src="/static/images/animal/cat2_2.jpg"  width="217px" height="144px" alt="" /></li>
            </ul>
        </div>
            <div class="col-md-6 come">
                <div class="about-wel" style="margin-top: 50px">
                    <h5>
                        <span class="ziti">萌宠联盟</span>
                    </h5>
                    <p  style="line-height:1.9em;font-size: 18px"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp据不完全调查统计，全世界约有<span class="ziti">6亿</span>流浪动物，在我国就超过<span class="ziti">5000万</span>只流浪猫犬，它们吃不饱、睡不暖，随时随地需要应对生存的考验。
                        主要原因是人类遗弃，以及被遗弃的宠物未绝育，导致过度繁衍，这个数字以惊人的速度在不断地增长。
                        目前社会上流浪宠物的生活现状依旧不容乐观，在社会不断发展的今天，如何更好的关爱流浪宠物的群体，仍然值得我们关注~</p>
                    <ul>
<%--                        <li>--%>
<%--                            <i class="glyphicon glyphicon-ok"></i>猫和狗的健康和关怀</li>--%>
<%--                        <li>--%>
<%--                            <i class="glyphicon glyphicon-ok"></i>猫和狗的生活习惯</li>--%>
<%--                        <li>--%>
<%--                            <i class="glyphicon glyphicon-ok"></i>猫和狗的饮食</li>--%>
<%--                        <li>--%>
<%--                            <i class="glyphicon glyphicon-ok"></i>猫和狗的行为</li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Gallery -->

<!-- Modal5 -->
<div class="modal fade" id="Catbtn" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">
                    <h4>Cat Life</h4>
                    <img src="/static/images/about/c.jpg" alt=" " class="img-responsive" />
                    <p class="para-agileits-w3layouts">
                        我们不能一直将小猫放在家里面养，我们需要时不时的将小猫带出去溜溜,然后，我们在养小猫的时候，还需要多陪小猫玩耍。
                        我们在养小猫的时候，还需要多打理打理它的毛发。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal5 -->
<div class="modal fade" id="Dogbtn" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">
                    <h4>Dog Life</h4>
                    <img src="/static/images/about/d.jpg" alt=" " class="img-responsive" />
                    <p class="para-agileits-w3layouts">
                        喂食的时间要准，尽量按照在原主人家的习惯喂养，不要喂它们过多的甜食、咸食和刺激性强的食品。
                        刚来的宝宝，主人要亲自喂食，时日积久，便能和爱犬建立起深厚的感情，加深相互信任的程度，
                        主人的另一个重要任务是要帮助小家伙克服离开母亲的痛苦，尽快适应新环境。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- //Gallery -->
<!-- js -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->

<!-- simple-lightbox -->
<script src="${path}/static/js/user/simple-lightbox.min.js"></script>
<script>
    $(function () {
        var gallery = $('.agileinfo-gallery-row a').simpleLightbox({
            navText: ['&lsaquo;', '&rsaquo;']
        });
    });
</script>


<!-- Light-box css -->
<!-- //simple-lightbox -->
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
</body>
</html>
