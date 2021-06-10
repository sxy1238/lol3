<%--
  Created by IntelliJ IDEA.
  User: 孙晓阳
  Date: 2020/12/7
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function refreshCode(){
            document.getElementById("code").src = "YZM?" + Math.random();
        }
        $(document).ready(function () {
            var height=$(document).height();
            $('.main').css('height',height);
        })
    </script>
</head>

<body>
<div class="main">
    <div class="main0">
        <div class="main_left">
            <img src="image/zhuce-image-3.png" class="theimg"/>
            <img src="image/zhuce-image-2.png" class="secimg"/>
            <img src="image/zhuce-image-1.png" class="firimg"/>
        </div>
        <form action="${pageContext.request.contextPath}/Register" method="post">
            <div class="main_right">
                <div class="main_r_up">
                    <img src="image/user.png" />
                    <div class="pp">注册</div>
                </div>
                <div class="sub"><p>已经注册？<a href="${pageContext.request.contextPath}/login.jsp"><span class="blue">请登录</span></a></p></div>
                <div class="txt txt0">
                    <span style="letter-spacing:8px;">昵称:</span>
                    <input name="name" type="text" class="txtphone" placeholder="请输入昵称"/>
                </div>
                <div class="txt txt0">
                    <span style="letter-spacing:8px;">用户名:</span>
                    <input name="username" type="text" class="txtphone" placeholder="请输入用户名"/>
                </div>
                <div class="txt txt0">
                    <span style="letter-spacing:4px;">登录密码:</span>
                    <input name="password" type="text" class="txtphone" placeholder="请输入密码"/>
                </div>
                <div class="txt txt0">
                    <span style=" float:left;letter-spacing:8px;">验证码:</span>
                    <input name="yzm" type="text" class="txtyzm" placeholder="请输入验证码"/>
                    <img id="code" src="YZM" class="yzmimg" onclick="refreshCode()"/><span style="color: red">${fail}</span>
                </div>
                <div class="txt txt0">
                    <button type="submit" class="zhucebtn">注册</button>
                </div>
            </div>
        </form>

    </div>
</div>

<div class="footer">
    <div class="footer0">
        <div class="footer_l">使用条款 | 隐私保护</div>
        <div class="footer_r">© 2020</div>
    </div>
</div>
</body>
</html>
