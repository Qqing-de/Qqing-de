<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>活动报名</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>

    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/style.css" type="text/css" media="all" />
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/font-awesome.css" type="text/css" media="all">

</head>
<body>

<jsp:include page="navigation.jsp"></jsp:include>
<!-- team -->


<!-- contact -->
<div class="contact" id="contact" style="padding-left: 19em;">
    <div class="container gao1">
        <div class="col-md-9 col-sm-9 contact-right">
            <form id="save_apply_form" >
                <input type="text" id="name" name="name" placeholder="姓名" >
                <input type="text" id="email" name="email" placeholder="邮箱" >
                <input type="text" id="age" name="age" placeholder="年龄">
                <input type="text" id="telephone" name="telephone" placeholder="联系方式">
                <textarea name="message" id="message" placeholder="成为志愿者的理由 :"></textarea>
            </form>
            <button type="button" id="save_apply_btn">提交</button>
        </div>
    </div>
</div>
<!-- //team -->
<!-- js -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->
<script type="text/javascript">
    //总的数据 当前的页面

    var totalRecord,currentPage;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${path}/admin/admins",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //1、解析并显示员工数据
                build_admins_table(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_admins_table(result){
        //清空table表格
        $(".team-agileinfo").empty();
        //index：下标 user：单个对象
        var admins=result.extend.pageInfo.list;
        $.each(admins,function(index,admin){
            var pic=null
            var adminNameTd=null;
            var remarkTd=null;
            if( index%2 != 0){
                pic=$("<div></div>").addClass("team-grid-right aliquam").append($("<img/>").
                addClass("img-responsive").attr("src","/static/images/admin/"+admin.pic));
                adminNameTd=$("<div></div>").addClass("team-grid-left non").append($("<h4></h4>")).append(admin.adminName);
                remarkTd=$("<p></p>").append(admin.remark);
                adminNameTd.append(remarkTd);
            }else{
                pic=$("<div></div>").addClass("team-grid-right").append($("<img/>").
                addClass("img-responsive").attr("src","/static/images/admin/"+admin.pic));
                adminNameTd=$("<div></div>").addClass("team-grid-left").append($("<h4></h4>")).append(admin.adminName);
                remarkTd=$("<p></p>").append(admin.remark);
                adminNameTd.append(remarkTd);
            }
            $("<div></div>").addClass("col-md-6 team-grid w3-agileits")
                .append(pic)
                .append(adminNameTd)
                .appendTo(".team-agileinfo");
        });
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");

    }

    $("#save_apply_btn").click(function () {
        console.log($("#save_apply_form").serialize());
        $.ajax({
            url:"${path}/apply/create",
            type:"POST",
            data:$("#save_apply_form").serialize(),
            success:function (result) {
                alert("你的申请已经被提交");
                window.location.reload();
            },
            error:function (result) {
                alert("你提交的信息有错，请认真填写！");
                window.location.reload();
            }
        });
    });
</script>
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
