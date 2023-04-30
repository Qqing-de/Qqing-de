<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>志愿活动</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <style type="text/css">
        @import url("https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap");

        :root{
            --color1: #01579B;
            --color2: #00838F;
            --color3: #FFD600;
            --color4: #FF4081;
            --color5: #F44336;
        }

        .myfont {
            font-size: 30px;
            color: #fff;
            text-transform: uppercase;
            word-spacing: 100vw;
            /*width: min-content;*/
            text-align: center;
            font-family: "Luckiest Guy", cursive;
            line-height: 100%;
            background:linear-gradient(225deg,
            var(--color1) 0%, var(--color1) 9%,
            transparent 9%, transparent 10%,
            var(--color2) 10%, var(--color2) 19%,
            transparent 19%, transparent 20%,
            var(--color3) 20%, var(--color3) 29%,
            transparent 29%, transparent 30%,
            var(--color4) 30%, var(--color4) 39%,
            transparent 39%, transparent 40%,
            var(--color5) 40%, var(--color5) 49%,
            transparent 49%, transparent 50%,
            var(--color1) 50%, var(--color1) 59%,
            transparent 59%, transparent 60%,
            var(--color2) 60%, var(--color2) 69%,
            transparent 69%, transparent 70%,
            var(--color3) 70%, var(--color3) 79%,
            transparent 79%, transparent 80%,
            var(--color4) 80%, var(--color4) 89%,
            transparent 89%, transparent 90%,
            var(--color5) 90%, var(--color5) 99%,
            transparent 99%
            );
            background-clip: text;
            -webkit-background-clip: text;
            background-size: 200% 200%;
            color: transparent;
            animation: move 4s linear infinite;
        }

        @keyframes move {
            0%{
                background-position: 0px 100%;
            }
            100%{
                background-position: 100% 0px;
            }
        }

        #blog{
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            -ms-background-size: cover;
            position: relative;
        }

        /*动态背景  */
        #pl{
            align-items: center;
            background: linear-gradient(125deg,#2c3e50,#27ae60,#2980b9,#e74c3c,#8e44ad);
            background-size: 500%;
            animation: backgroundframe 15s infinite linear;
        }
        .pl{
            align-items: center;
            background: linear-gradient(125deg,#2c3e50,#27ae60,#2980b9,#e74c3c,#8e44ad);
            background-size: 500%;
            animation: backgroundframe 15s infinite linear;
        }
        @keyframes backgroundframe {
            0%{
                background-position: 0% 50%;
            }
            50%{
                background-position: 100% 50%;
            }
            100%{
                background-position: 0% 50%;
            }
        }
    </style>
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${path}/static/css/user/style.css" type="text/css" media="all" />

</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- blog -->
<div class="blog pl" id="pl" >
    <div class="container">
        <div class="col-md-5 col-xs-6 blog-grids">


            <div class="clearfix"></div>
        </div>

    </div>

    <!-- 显示分页信息 -->
    <div class="row" style="width: 1000px;">
        <div class="col-md-4" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
    <div class="blog-grids mid-blog-agile" style="bottom: 5.5%">
        <img src="/static/images/login/zhiyuan.png" class="img-responsive" alt="" style="width: 700px;height: 750px;margin-right: 0px;;padding-top: 4px;margin-bottom: -38px;">
    </div>
</div>
<!-- Modal5 -->
<div class="modal fade" id="showTeam" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">

                    <h4 id="title" style="color: #e55dff;"></h4>
                    <p id="addres" style="margin-left: 50px;"></p>
                    <p class="para-agileits-w3layouts" id="event" style="margin-left: 140px;color: #204e99"></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Modal5 -->
<!-- //blog -->
<!-- js -->
<script src="${path}/static/js/jquery-3.4.1.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->
<script type="text/javascript">
    var totalRecord,currentPage;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${path}/blog/blogs",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //1、解析并显示员工数据
                build_blogs_table(result);

                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }


    function build_blogs_table(result){
        //清空table表格
        $(".col-md-5").empty();
        //index：下标 user：单个对象
        var blogs=result.extend.pageInfo.list;
        $.each(blogs,function(index,blog){

            var yearTd=$("<div></div>").addClass("blog-left-agileits").append($("<p></p>")).append(blog.actionTime);

            var blogTd=$("<div></div>").addClass("blog-right-agileits-w3layouts");

            var titleTd=$("<h4 style='cursor: pointer'></h4>").append($("<a></a>")).addClass("myfont").append(blog.title);
            titleTd.attr("id","title_btn");
            titleTd.attr("title-id",blog.id);

            var peopelsTd=$("<p></p>").append($("<a></a>")).append(blog.peoples);

           blogTd.append(titleTd).append(peopelsTd);

           var clear=$("<div></div>").addClass("clearfix");
            //append方法执行完成以后还是返回原来的元素
                $("<div></div>").addClass("blog-full-wthree")
                    .append(yearTd)
                    .append(blogTd)
                    .append(clear)
                    .appendTo(".col-md-5");

        });
    }

    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a style='cursor: pointer'></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a style='cursor: pointer'></a>").append("&laquo;"));
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

        var nextPageLi = $("<li></li>").append($("<a style='cursor: pointer'></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a style='cursor: pointer'></a>").append("尾页").attr("href","#"));
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

    //点击编辑按钮弹出模态框。

    $(document).on("click","#title_btn",function(){

        var id = $(this).attr("title-id");
        $.ajax({
            url:"${path}/blog/findById?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                $("#title").text(result.extend.blog.title);
                $("#addres").text(result.extend.blog.address);
                $("#event").text(result.extend.blog.event);

            }});
        //2、弹出模态框
        $("#showTeam").modal({
            backdrop:"static"
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
