<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>找回密码</title>
    <link rel="stylesheet" href="${path}/static/css/user/base.css">
    <link rel="stylesheet" href="${path}/static/css/user/login.css">

    <script type="text/javascript">
        //验证两次密码是否一致
        function checkPwd(){
            var confirmpwd=document.getElementById("confirmpwd").value;
            var password=document.getElementById("password").value;
            var hitpwd=document.getElementById("hit_confirmpwd");
            if(confirmpwd!=password){
                document.getElementById("hit_confirmpwd").innerHTML="两次密码不一致!";
                //alert('温馨提示:两次密码不一致!');
                return false;
            }else if (confirmpwd!=""){
                document.getElementById("hit_confirmpwd").innerHTML="密码一致!";
            }

        }
    </script>
</head>
<style>
    /*动态背景  */
    #pl{
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

    /*波浪文字效果*/
    /*font-family: consolas;*/
    @keyframes float {
        0% {
            transform: translateY(0px);
        }
        20% {
            transform: translateY(-10px);/*跳动高度*/
        }
        40%,100% {
            transform: translateY(0px);
        }
    }
    .navy {
        font-family: consolas;
        position: relative;
        /*-webkit-box-reflect: below -12px linear-gradient(transparent, rgba(0,0,0,0.2));*/
    }

    .navy span {
        position: relative;
        display: inline-block;
        color: white;
        font-size: 24px;
        animation: float 1s ease-in-out infinite;
        animation-delay: calc(0.1s * var(--i));
    }
    /*输入框效果*/
    input{
        border-radius: 7px;
    }
    input:focus{
        box-shadow: 0 0 12px #14ffd1;
        outline: none;
        border-color: #14ffd1;
        border-radius: 10px;
    }
</style>
<div>
<div class="bg"  id="pl"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form action="${path}/user/retrieve" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top navy">
                            <span style="--i:1;">修</span>
                            <span style="--i:2;">改</span>
                            <span style="--i:3;">密</span>
                            <span style="--i:4;">码</span>
                            <span style="--i:5;">页</span>
                            <span style="--i:6;">面</span>
                    </div>
                    ${msg}   <h8 style="color:#ffffff">${error}</h8>
                    <div class="panel-body"style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" required oninvalid="setCustomValidity('请输入用户名');" class="input input-big" name="username" id="name" placeholder="用户名" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" required oninvalid="setCustomValidity('请输入密码'); " class="input input-big" name="password" id="password"  placeholder="修改密码" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" required oninvalid="setCustomValidity('请输入确认密码'); " class="input input-big"  name="confirmpwd" id="confirmpwd"   placeholder="确认密码" onblur="checkPwd()" />
                                <span id="hit_confirmpwd" style="color: #fff;border-radius: 15px;margin-top: 6px;padding: 4px;position: absolute;">${error}</span>
                            </div>
                        </div>
                        <div style="padding:30px;">
                            <input type="submit" id="button"  class="button button-block bg-main text-big input-big" style="background-color: #ff6759;border-radius: 8px" value="修改密码">
                        </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>

</html>
