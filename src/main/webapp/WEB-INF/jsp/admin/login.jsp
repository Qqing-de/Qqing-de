<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>萌宠联盟后台登录</title>
    <link rel="stylesheet" href="${path}/static/css/user/base.css">
    <link rel="stylesheet" href="${path}/static/css/user/login.css">
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
            <form action="${path}/admin/dologin" method="post">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top navy">
                            <span style="--i:1;">萌</span>
                            <span style="--i:2;">宠</span>
                            <span style="--i:3;">联</span>
                            <span style="--i:4;">盟</span>
                            <span style="--i:5;">后</span>
                            <span style="--i:6;">台</span>
                            <span style="--i:7;">管</span>
                            <span style="--i:8;">理</span>
                    </div>
                    <span style="color: white">${msg}</span>
                    <div class="panel-body"style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="adminName" id="name" placeholder="账号" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="adminPwd" id="password"  placeholder="密码" />
                            </div>
                        </div>
                        <div class="form-group v_container">
                            <div class="field">
                                <input type="text" class="input input-big" id="code_input" name="code" placeholder="验证码" />
                                <div id="v_container" style="width: 100px;height: 45px;" class="passcode"></div>
                            </div>
                        </div>
                        <div style="padding:30px;">
                            <input type="submit" id="button" class="button button-block bg-main text-big input-big" style="background-color: #ff6759;border-radius: 8px" value="登录">
                        </div>
                </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</body>
<script src="${path}/static/js/user/gVerify.js"></script>
<script>

    var verifyCode = new GVerify("v_container");

    document.getElementById("button").onclick = function(){
        /*获取inputi面的值*/
        var res = verifyCode.validate(document.getElementById("code_input").value);
        if(res){
            return;
        }else{
            alert("验证码错误");
            return false;
        }
    }
</script>
</html>
