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
    <title>登录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
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
            <img src="${pageContext.request.contextPath}/image/login-image-3.png" class="theimg"/>
            <img src="${pageContext.request.contextPath}/image/login-image-2.png" class="secimg"/>
            <img src="${pageContext.request.contextPath}/image/login-image-1.png" class="firimg"/>
        </div> <form action="${pageContext.request.contextPath}/lg" method="post" >
        <div class="main_right">
            <div class="main_r_up">
                <img src="${pageContext.request.contextPath}/image/user.png" />
                <div class="pp">登录</div>
            </div>
            <div class="sub"><p>还没有账号？<a href="${pageContext.request.contextPath}/register.jsp"><span class="blue">立即注册</span></a></p></div>

            <div class="txt">
                <span style="letter-spacing:8px;">用户名:</span>
                <input name="username" type="text" class="txtphone" placeholder="请输入用户名"/>
            </div>
            <div class="txt">
                <span style="letter-spacing:4px;">登录密码:</span>
                <input name="password" type="text" class="txtphone" placeholder="请输入登录密码"/>
            </div>
            <div class="txt">
                <span style=" float:left;letter-spacing:8px;">验证码:</span>
                <input name="yzm" type="text" class="txtyzm" placeholder="请输入验证码"/>
                <img id="code" src="YZM" class="yzmimg" onclick="refreshCode()"/>

            </div>
            <button type="submit" class="xiayibu">登录</button>

        </div>  </form>
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

